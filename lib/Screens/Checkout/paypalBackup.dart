// ButtonGlobal(
                                //     buttontext: 'Pay with Paypal',
                                //     buttonDecoration: kButtonDecoration
                                //         .copyWith(color: kMainColor),
                                //     onPressed: () {
                                //       double subtotal = (ref
                                //               .read(cartProvider.notifier)
                                //               .getTotalCharge() -
                                //           discount);
                                //       double shipping = ref
                                //           .read(cartProvider.notifier)
                                //           .getShippingCharge();
                                //       double total = (subtotal + shipping);
                                //       Navigator.of(context).push(
                                //         MaterialPageRoute(
                                //           builder: (BuildContext context) =>
                                //               UsePaypal(
                                //                   sandboxMode: sandbox,
                                //                   clientId: paypalClientId,
                                //                   secretKey: paypalClientSecret,
                                //                   returnURL:
                                //                       "https://samplesite.com/return",
                                //                   cancelURL:
                                //                       "https://samplesite.com/cancel",
                                //                   transactions: [
                                //                     {
                                //                       "amount": {
                                //                         "total": '$total',
                                //                         "currency": currency,
                                //                         "details": {
                                //                           "subtotal":
                                //                               '$subtotal',
                                //                           "shipping":
                                //                               '$shipping',
                                //                           "shipping_discount": 0
                                //                         }
                                //                       },
                                //                       "description":
                                //                           "The payment transaction description.",
                                //                       // "payment_options": {
                                //                       //   "allowed_payment_method":
                                //                       //       "INSTANT_FUNDING_SOURCE"
                                //                       // },
                                //                       "item_list": {
                                //                         "items": [
                                //                           {
                                //                             "name":
                                //                                 "A demo product",
                                //                             "quantity": 1,
                                //                             "price":
                                //                                 '$subtotal',
                                //                             "currency": currency
                                //                           }
                                //                         ],

                                //                         // shipping address is not required though
                                //                         "shipping_address": {
                                //                           "recipient_name":
                                //                               snapshot
                                //                                   .data
                                //                                   ?.value
                                //                                   ?.shipping
                                //                                   ?.first
                                //                                   ?.shippingName,
                                //                           "line1": snapshot
                                //                               .data
                                //                               ?.value
                                //                               ?.shipping
                                //                               ?.first
                                //                               .addressLineOne,
                                //                           "line2": snapshot
                                //                               .data
                                //                               ?.value
                                //                               ?.shipping
                                //                               ?.first
                                //                               .addressLineTwo,
                                //                           "city": snapshot
                                //                               .data
                                //                               ?.value
                                //                               ?.shipping
                                //                               ?.first
                                //                               .shippingTown,
                                //                           "country_code":
                                //                               snapshot
                                //                                   .data
                                //                                   ?.value
                                //                                   ?.shipping
                                //                                   ?.first
                                //                                   .country
                                //                                   ?.isoNo,
                                //                           "postal_code":
                                //                               snapshot
                                //                                   .data
                                //                                   ?.value
                                //                                   ?.shipping
                                //                                   ?.first
                                //                                   .shippingPost,
                                //                           "phone": snapshot
                                //                               .data
                                //                               ?.value
                                //                               ?.shipping
                                //                               ?.first
                                //                               .shippingMobile,
                                //                         },
                                //                       }
                                //                     }
                                //                   ],
                                //                   note:
                                //                       "Contact us for any questions on your order.",
                                //                   onSuccess:
                                //                       (Map params) async {
                                //                     try {
                                //                       EasyLoading.show(
                                //                           status:
                                //                               'Creating Order');
                                //                       double subtotal = (ref
                                //                               .read(cartProvider
                                //                                   .notifier)
                                //                               .getTotalCharge() -
                                //                           discount);
                                //                       double shipping = ref
                                //                           .read(cartProvider
                                //                               .notifier)
                                //                           .getShippingCharge();
                                //                       double total =
                                //                           (subtotal + shipping);

                                //                       Currency currency =
                                //                           Currency(
                                //                               exchangeRate: '1',
                                //                               id: '1');
                                //                       OrderCreateModel model = OrderCreateModel(
                                //                           couponId: info.couponId ??
                                //                               "1",
                                //                           couponDiscount:
                                //                               info.discountAmount ==
                                //                                       null
                                //                                   ? "0.0"
                                //                                   : discount
                                //                                       .toString(),
                                //                           subTotal: subtotal
                                //                               .toString(),
                                //                           totalShipping: shipping
                                //                               .toString(),
                                //                           total:
                                //                               total.toString(),
                                //                           shippingAddressId:
                                //                               snapshot
                                //                                   .data
                                //                                   ?.value
                                //                                   ?.shipping
                                //                                   ?.first
                                //                                   ?.id
                                //                                   .toString(),
                                //                           billingAddressId:
                                //                               snapshot
                                //                                   .data
                                //                                   ?.value
                                //                                   ?.billing
                                //                                   ?.first
                                //                                   ?.id
                                //                                   .toString(),
                                //                           cart: cartItems,
                                //                           currency: currency,
                                //                           paymentBy: 'paypal');
                                //                       final order = await _apiManager.createOrder(
                                //                           model,
                                //                           token,
                                //                           'paypal',
                                //                           subtotal.toString(),
                                //                           shipping.toString(),
                                //                           total.toString(),
                                //                           info.discountAmount ==
                                //                                   null
                                //                               ? "0.0"
                                //                               : discount
                                //                                   .toString(),
                                //                           info.couponId ?? "0",
                                //                           snapshot
                                //                                   .data
                                //                                   ?.value
                                //                                   ?.shipping
                                //                                   ?.first
                                //                                   .id
                                //                                   .toString() ??
                                //                               '',
                                //                           snapshot
                                //                                   .data
                                //                                   ?.value
                                //                                   ?.billing
                                //                                   ?.first
                                //                                   .id
                                //                                   .toString() ??
                                //                               '');
                                //                       if (order.success ==
                                //                           true) {
                                //                         EasyLoading.showSuccess(
                                //                             'Create Successfull');
                                //                         ref
                                //                             .read(cartProvider)
                                //                             .cartItems
                                //                             .clear();
                                //                         ref
                                //                             .read(
                                //                                 cartItemUiProvider)
                                //                             .cartItemUis
                                //                             .clear();
                                //                         setState(() {
                                //                           orderNo = order
                                //                                   .value
                                //                                   ?.orders?[0]
                                //                                   .orderId ??
                                //                               "";
                                //                         });
                                //                       } else {
                                //                         EasyLoading.showError(
                                //                             order.message
                                //                                 .toString());
                                //                       }
                                //                     } catch (e) {
                                //                       EasyLoading.showError(
                                //                           e.toString());
                                //                     }
                                //                     // ref
                                //                     //     .read(cartProvider
                                //                     //         .notifier)
                                //                     //     .removeAllItem();
                                //                     OrderSuccessful(
                                //                       orderNumber:
                                //                           orderNo.toString(),
                                //                     ).launch(context);
                                //                   },
                                //                   onError: (error) {
                                //                     EasyLoading.showError(
                                //                         error.toString());
                                //                   },
                                //                   onCancel: (params) {
                                //                     EasyLoading.showError(
                                //                         'Payment Cancelled. Please try again');
                                //                   }),
                                //         ),
                                //       );
                                //     }).visible(isPaypal),