import 'dart:developer';

import 'package:event_app/Models/delivery/delivery_reponse_model.dart';
import 'package:event_app/Models/order_create_model.dart';
import 'package:event_app/Screens/payment_helpers/create_order_helper.dart';
import 'package:event_app/Services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayMethods {
  ///Initialise the razorPay instance with the Razorpay.
  static void initialise({
    required Razorpay razorpay,
    required BuildContext context,
    required String token,
    required ApiManager apiManager,
    required OrderCreateModel model,
    required DeliveryResponseModel? updatedAmount,
    required VoidCallback successCallbackFunction,
  }) {
    razorpay
      ..on(
        Razorpay.EVENT_PAYMENT_SUCCESS,
        (PaymentSuccessResponse response) async {
          try {
            final result = await CreateOrderHelper.placeOrder(
              token: token,
              apiManager: apiManager,
              paymentBy: 'razorpay',
              paymentId: response.paymentId ?? "",
              model: model,
              amount: updatedAmount,
            );
            if (result) {
              successCallbackFunction.call();
            } else {
              EasyLoading.showError(
                'We are placing problem placing the order at the moment.\nNote: Any amount deducted from your account will be refunded within 7 working days.',
              );
            }
          } catch (error) {
            EasyLoading.showError(
              'We are placing problem placing the order at the moment.\nNote: Any amount deducted from your account will be refunded within 7 working days.',
            );
          }
        },
      )
      ..on(
        Razorpay.EVENT_PAYMENT_ERROR,
        (PaymentFailureResponse response) {
          EasyLoading.showError(
            response.message.toString(),
          );
        },
      )
      ..on(
        Razorpay.EVENT_EXTERNAL_WALLET,
        (ExternalWalletResponse response) {},
      );
  }

  /// Method calls the razorPay payment gateway along with the given info
  static void openRazopay({
    required Razorpay razorpay,
    required String orderId,
    required String key,
    required String amount,
    required String contact,
    required String email,
    required String name,
  }) {
    final amountVal = (double.parse(amount) * 100).toString();
    log(amountVal.toString());
    log(amountVal.split('.')[0]);
    final options = {
      'key': key,
      'order_id': orderId,
      'amount': amountVal.split('.')[0],
      'name': 'Event Cart',
      'description': 'Order',
      'prefill': {
        'contact': contact,
        'email': email,
        'name': name,
      },
    };

    try {
      razorpay.open(options);
    } catch (e, s) {
      log(s.toString());
      EasyLoading.showError(
        e.toString(),
      );
    }
  }

  ///Dispose the razorPay Instance
  static void dispose({
    required Razorpay razorpay,
  }) {
    razorpay.clear();
  }
}
