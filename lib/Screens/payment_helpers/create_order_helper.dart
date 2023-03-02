import 'package:event_app/Models/delivery/delivery_reponse_model.dart';
import 'package:event_app/Models/order_create_model.dart';
import 'package:event_app/Services/api_manager.dart';
import 'package:nb_utils/nb_utils.dart';

class CreateOrderHelper {
  static Future<bool> placeOrder({
    required String token,
    required ApiManager apiManager,
    required String paymentBy,
    required String? paymentId,
    required OrderCreateModel model,
    required DeliveryResponseModel? amount,
  }) async {
    try {
      final order = await apiManager.createOrder(
        model: model,
        token: token,
        payment: paymentBy,
        subTotal: (amount?.value.subtotal ?? 0).toString(),
        totalShipping: (amount?.value.shippingCost ?? 0).toString(),
        total: (amount?.value.grandTotal ?? 0).toString(),
        paymentId: paymentId ?? '',
        //IMPT
        deliveryDate: model.deliveryDate!,
      );
      if (order.success ?? false) {
        return true;
      }
      return false;
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      return false;
    }
  }
}
