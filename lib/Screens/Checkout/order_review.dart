import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../GlobalComponents/button_global.dart';
import '../../Models/order_create_model.dart';
import '../../Models/profile_model.dart';
import '../../Screens/Authentication/add_billing.dart';
import './order_successfull.dart';
import '../../Services/api_manager.dart';
import '../../Services/cart_item_notifier.dart';
import '../../Services/discount_provider.dart';
import '../../Services/cart_notifier.dart';
import '../../constant.dart';
import '../Authentication/update_shipping.dart';
import '../Home Screen/home.dart';
import '../Profile/order_list.dart';

class OrderReview extends StatefulWidget {
  const OrderReview({Key? key}) : super(key: key);
  @override
  _OrderReviewState createState() => _OrderReviewState();
}

class _OrderReviewState extends State<OrderReview> {
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String token = '';
  bool isPaypal = false;
  bool isCod = true;
  bool isRazorpay = false;
  String orderNo = '';
  int? country;
  String? mobile;

  Future<void> getToken() async {
    SharedPreferences preferences = await _prefs;
    setState(() {
      token = preferences.getString('token') ?? "";
      country = preferences.getInt('country');
      mobile = preferences.getString('phone');
    });
  }

  late Razorpay _razorpay;
  @override
  void initState() {
    super.initState();

    getToken();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  bool paymentSuccess = false;

  void openCheckout(double amount) async {
    var options = {
      'key': razorPayApiKey,
      'amount': amount * 100,
      'name': companyName,
      'description': companyDescription,
      'currency': currency,
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print('catch block' + " " + e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print('Success Response Message: ${response.paymentId}');

    setState(() {
      paymentSuccess = true;
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    setState(() {
      paymentSuccess = false;
    });
    print('Error Response Message: $response');
    EasyLoading.showError('Payment failed ! ${response.message} ');
    /* Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    /* Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.black),
            title: Text(
              'Order Review',
              style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: FutureBuilder<ProfileModel>(
            future: _apiManager.getProfileInfo(token),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                print("177===== ${snapshot.data?.value?.shipping}");
                if (snapshot.data?.value?.shipping == null) {
                  print("119");
                  return Center(
                    child: SizedBox(
                        height: 60.0,
                        child: ButtonGlobal(
                            buttontext: 'Add Shipping Id',
                            buttonDecoration:
                                kButtonDecoration.copyWith(color: kMainColor),
                            onPressed: () =>
                                AddBilling(country: country, mobile: mobile)
                                    .launch(context))),
                  );
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 60.0, bottom: 10.0),
                              child: Text(
                                'Please confirm and submit Your order',
                                style: kTextStyle.copyWith(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                                maxLines: 2,
                              ),
                            ),
                            ListTile(
                              contentPadding: const EdgeInsets.only(left: 0.0),
                              title: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Billing Address',
                                      style:
                                          kTextStyle.copyWith(fontSize: 18.0),
                                    ),
                                    const WidgetSpan(
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFF16DB4D),
                                        size: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: Text(
                                snapshot.data!.value!.billing!.id != null
                                    ? '${snapshot.data?.value?.billing?.firstName ?? ''} ${snapshot.data?.value?.billing?.lastName ?? ''} - ${snapshot.data?.value?.billing?.address1 ?? ''} , ${snapshot.data?.value?.billing?.userCity ?? ''}  ,${snapshot.data?.value?.billing?.country?.name ?? ''} , ${snapshot.data?.value?.billing?.postCode ?? ''}'
                                    : 'No billing Address Found',
                                style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                                maxLines: 5,
                              ),
                              trailing: Text(
                                snapshot.data!.value!.billing!.id != null
                                    ? 'Change'
                                    : 'Add',
                                style: kTextStyle.copyWith(color: kRedColor),
                              ),
                              onTap: () {
                                if (snapshot.data!.value!.shipping!.id !=
                                    null) {
                                  ShippingUpdate shipUpdate = ShippingUpdate(
                                      fullName:
                                          '${snapshot.data?.value?.billing?.firstName} ${snapshot.data?.value?.billing?.lastName} ',
                                      addressOne: snapshot.data?.value?.shipping
                                          ?.addressLineOne,
                                      addressTwo: snapshot.data?.value?.shipping
                                          ?.addressLineTwo,
                                      town: snapshot
                                          .data?.value?.shipping?.shippingTown,
                                      countryId: snapshot
                                          .data?.value?.shipping?.country?.id
                                          .toString(),
                                      postCode: snapshot
                                          .data?.value?.shipping?.shippingPost,
                                      mobile: snapshot.data?.value?.shipping
                                          ?.shippingMobile);
                                  UpdateShipping(
                                    shipping: shipUpdate,
                                    isBilling: true,
                                    isProfile: false,
                                  ).launch(context);
                                } else {
                                  AddBilling(
                                    country: country,
                                    mobile: mobile,
                                    isBilling: true,
                                  ).launch(context);
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            ListTile(
                              isThreeLine: true,
                              contentPadding: const EdgeInsets.only(left: 0.0),
                              title: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Shipping Address',
                                      style:
                                          kTextStyle.copyWith(fontSize: 18.0),
                                    ),
                                    const WidgetSpan(
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFF16DB4D),
                                        size: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: Text(
                                snapshot.data!.value!.shipping!.id != null
                                    ? '${snapshot.data?.value?.shipping?.shippingName ?? ''} - ${snapshot.data?.value?.shipping?.addressLineOne ?? ''} ,${snapshot.data?.value?.shipping?.addressLineTwo ?? ''} , ${snapshot.data?.value?.shipping?.shippingTown ?? ''}  ,${snapshot.data?.value?.shipping?.country?.name ?? ''} , ${snapshot.data?.value?.shipping?.shippingPost ?? ''} - ${snapshot.data?.value?.shipping?.shippingMobile ?? ''} '
                                    : 'No Shipping Address Found',
                                style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                                maxLines: 5,
                              ),
                              trailing: Text(
                                snapshot.data!.value!.shipping!.id != null
                                    ? 'Change'
                                    : 'Add',
                                style: kTextStyle.copyWith(color: kRedColor),
                              ),
                              onTap: () {
                                if (snapshot.data!.value!.shipping!.id !=
                                    null) {
                                  ShippingUpdate shipUpdate = ShippingUpdate(
                                      fullName: snapshot
                                          .data?.value?.shipping?.shippingName,
                                      addressOne: snapshot.data?.value?.shipping
                                          ?.addressLineOne,
                                      addressTwo: snapshot.data?.value?.shipping
                                          ?.addressLineTwo,
                                      town: snapshot
                                          .data?.value?.shipping?.shippingTown,
                                      countryId: snapshot
                                          .data?.value?.shipping?.country?.id
                                          .toString(),
                                      postCode: snapshot
                                          .data?.value?.shipping?.shippingPost,
                                      mobile: snapshot.data?.value?.shipping
                                          ?.shippingMobile);
                                  UpdateShipping(
                                    shipping: shipUpdate,
                                    isBilling: false,
                                    isProfile: false,
                                  ).launch(context);
                                } else {
                                  AddBilling(
                                    country: country,
                                    mobile: mobile,
                                    isBilling: true,
                                  ).launch(context);
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Payment Method ',
                                    style: kTextStyle.copyWith(fontSize: 18.0),
                                  ),
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF16DB4D),
                                      size: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white),
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.only(left: 0.0),
                                leading: Image.asset(
                                  'images/cod.png',
                                  height: 60.0,
                                  width: 80.0,
                                  fit: BoxFit.cover,
                                ),
                                title: Text('Cash On Delivery',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor)),
                                subtitle: Text(
                                  'Pay On Cash',
                                  style: kTextStyle.copyWith(
                                      color: kGreyTextColor),
                                  maxLines: 2,
                                ),
                                trailing: Checkbox(
                                    value: isCod,
                                    onChanged: (val) {
                                      setState(() {
                                        isCod = val!;
                                        if (isCod) {
                                          isRazorpay = false;
                                          isPaypal = false;
                                        } else {
                                          isRazorpay = false;
                                          isPaypal = true;
                                        }
                                      });
                                    }),
                              ),
                            ),
                            /*COD*/
                            const SizedBox(
                              height: 10.0,
                            ),

                            /* Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white),
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.only(left: 0.0),
                                leading: Image.asset(
                                  'images/paypal.png',
                                  height: 60.0,
                                  width: 80.0,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(
                                  'Paypal',
                                  style:
                                      kTextStyle.copyWith(color: kTitleColor),
                                ),
                                subtitle: Text(
                                  'Pay With Paypal',
                                  style: kTextStyle.copyWith(
                                      color: kGreyTextColor),
                                  maxLines: 2,
                                ),
                                trailing: Checkbox(
                                    value: isPaypal,
                                    onChanged: (val) {
                                      setState(() {
                                        isPaypal = val!;
                                        if (isPaypal) {
                                          isRazorpay = false;
                                          isCod = false;
                                        } else {
                                          isRazorpay = false;
                                          isCod = true;
                                        }
                                      });
                                    }),
                              ),
                            ),  */ /*paypal*/ /*

                            const SizedBox(
                              height: 10.0,
                            ),*/

                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white),
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.only(left: 0.0),
                                leading: Image.asset(
                                  'images/razorpay.png',
                                  height: 60.0,
                                  width: 80.0,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(
                                  'Razorpay',
                                  style:
                                      kTextStyle.copyWith(color: kTitleColor),
                                ),
                                subtitle: Text(
                                  'Pay With Razorpay',
                                  style: kTextStyle.copyWith(
                                      color: kGreyTextColor),
                                  maxLines: 2,
                                ),
                                trailing: Checkbox(
                                    value: isRazorpay,
                                    onChanged: (val) {
                                      setState(() {
                                        isRazorpay = val!;
                                        if (isRazorpay) {
                                          isCod = false;
                                          isPaypal = false;
                                        } else {
                                          isPaypal = false;
                                          isCod = true;
                                        }
                                      });
                                    }),
                              ),
                            ), /* Razorpay*/
                          ],
                        ),
                      ),
                      Container(
                        height: 150.0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                        ),
                        child: Consumer(builder: (_, ref, watch) {
                          List<Carts> cartItems =
                              ref.watch(cartProvider).getItems();
                          Discount info =
                              ref.watch(fetDiscountInfoProvider).getInfo();
                          double discount = info.discountAmount ?? 0.0;
                          int cartSize = cartItems.length;

                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      cartSize < 2
                                          ? 'Order Total (${cartSize.toString()} Item)'
                                          : 'Order Total (${cartSize.toString()} Items)',
                                      style: kTextStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '$currencyIcon ${((ref.read(cartProvider.notifier).getTotalCharge() - discount) + ref.read(cartProvider.notifier).getShippingCharge()).toString()}',
                                      style: kTextStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                ButtonGlobal(
                                  buttontext: 'Submit Order',
                                  buttonDecoration: kButtonDecoration.copyWith(
                                      color: kMainColor),
                                  onPressed: () async {
                                    if (snapshot.data!.value!.shipping!.id ==
                                        null) {
                                      toast('Please add shipping address');
                                      // return;
                                    } else {
                                      try {
                                        EasyLoading.show(
                                            status: 'Creating Order');
                                        double subtotal = (ref
                                                .read(cartProvider.notifier)
                                                .getTotalCharge() -
                                            discount);
                                        double shipping = ref
                                            .read(cartProvider.notifier)
                                            .getShippingCharge();
                                        double total = (subtotal + shipping);

                                        Currency currency = Currency(
                                            exchangeRate: '1', id: '1');
                                        OrderCreateModel model =
                                            OrderCreateModel(
                                                couponId: info.couponId ?? "1",
                                                couponDiscount:
                                                    info.discountAmount == null
                                                        ? "0.0"
                                                        : discount.toString(),
                                                subTotal: subtotal.toString(),
                                                totalShipping: shipping
                                                    .toString(),
                                                total: total.toString(),
                                                shippingAddressId:
                                                    snapshot.data?.value
                                                        ?.shipping?.id
                                                        .toString(),
                                                billingAddressId: snapshot
                                                    .data?.value?.billing?.id
                                                    .toString(),
                                                cart: cartItems,
                                                currency: currency,
                                                paymentBy: 'cod');
                                        final order =
                                            await _apiManager
                                                .createOrder(
                                                    model,
                                                    token,
                                                    'cod',
                                                    subtotal.toString(),
                                                    shipping.toString(),
                                                    total.toString(),
                                                    info.discountAmount == null
                                                        ? "0.0"
                                                        : discount.toString(),
                                                    info.couponId ?? "0",
                                                    snapshot.data?.value
                                                            ?.shipping?.id
                                                            .toString() ??
                                                        '',
                                                    snapshot.data?.value
                                                            ?.billing?.id
                                                            .toString() ??
                                                        '');

                                        print("Order response" +
                                            " " +
                                            order.toString());
                                        if (order.success == true) {
                                          EasyLoading.showSuccess(
                                              'Create Successfull');
                                          ref
                                              .read(cartProvider)
                                              .cartItems
                                              .clear();
                                          ref
                                              .read(cartItemUiProvider)
                                              .cartItemUis
                                              .clear();
                                          setState(() {
                                            //  orderNo = order.value?.orders?.orderNo ?? '';
                                            orderNo = '';
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Home()),
                                                ModalRoute.withName("/Home"));
                                          });
                                        } else {
                                          EasyLoading.showError(
                                              order.message.toString());
                                        }
                                      } catch (e) {
                                        EasyLoading.showError(e.toString());
                                      }
                                    }
                                  },
                                ).visible(isCod),
                                ButtonGlobal(
                                    buttontext: 'Pay with Razorpay',
                                    buttonDecoration: kButtonDecoration
                                        .copyWith(color: kMainColor),
                                    onPressed: () async {
                                      double subtotal = (ref
                                              .read(cartProvider.notifier)
                                              .getTotalCharge() -
                                          discount);
                                      double shipping = ref
                                          .read(cartProvider.notifier)
                                          .getShippingCharge();
                                      double total = (subtotal + shipping);
                                      // double total = 1.0;
                                      openCheckout(total);
                                      //  ========================================
                                      if (paymentSuccess) {
                                        try {
                                          EasyLoading.show(
                                              status: 'Creating Order');
                                          double subtotal = (ref
                                                  .read(cartProvider.notifier)
                                                  .getTotalCharge() -
                                              discount);
                                          double shipping = ref
                                              .read(cartProvider.notifier)
                                              .getShippingCharge();
                                          double total = (subtotal + shipping);

                                          Currency currency = Currency(
                                              exchangeRate: '1', id: '1');
                                          OrderCreateModel model =
                                              OrderCreateModel(
                                                  couponId: info.couponId ??
                                                      "1",
                                                  couponDiscount:
                                                      info.discountAmount == null
                                                          ? "0.0"
                                                          : discount.toString(),
                                                  subTotal: subtotal.toString(),
                                                  totalShipping:
                                                      shipping.toString(),
                                                  total: total.toString(),
                                                  shippingAddressId: snapshot
                                                      .data?.value?.shipping?.id
                                                      .toString(),
                                                  billingAddressId: snapshot
                                                      .data?.value?.billing?.id
                                                      .toString(),
                                                  cart: cartItems,
                                                  currency: currency,
                                                  paymentBy: 'cod');
                                          final order =
                                              await _apiManager.createOrder(
                                                  model,
                                                  token,
                                                  'razorpay',
                                                  subtotal.toString(),
                                                  shipping.toString(),
                                                  total.toString(),
                                                  info.discountAmount == null
                                                      ? "0.0"
                                                      : discount.toString(),
                                                  info.couponId ?? "0",
                                                  snapshot.data?.value?.shipping
                                                          ?.id
                                                          .toString() ??
                                                      '',
                                                  snapshot.data?.value?.billing
                                                          ?.id
                                                          .toString() ??
                                                      '');

                                          print("Order response" +
                                              " " +
                                              order.toString());
                                          if (order.success == true) {
                                            EasyLoading.showSuccess(
                                                'Create Successfull');
                                            ref
                                                .read(cartProvider)
                                                .cartItems
                                                .clear();
                                            ref
                                                .read(cartItemUiProvider)
                                                .cartItemUis
                                                .clear();
                                            setState(() {
                                              //  orderNo = order.value?.orders?.orderNo ?? '';
                                              orderNo = '';
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Home()),
                                                  ModalRoute.withName("/Home"));
                                            });
                                          } else {
                                            EasyLoading.showError(
                                                order.message.toString());
                                          }
                                        } catch (e) {
                                          EasyLoading.showError(e.toString());
                                        }
                                      }

                                      //==========================================
                                    }).visible(isRazorpay),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                );
              } else {
                print("Else");
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ).visible(orderNo == ''),
        Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/check.png'),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Order Placed Successfully',
                  style: kTextStyle,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Order id: ',
                        style: kTextStyle.copyWith(
                            fontSize: 14.0, color: kGreyTextColor),
                      ),
                      TextSpan(
                        text: orderNo,
                        style: kTextStyle.copyWith(
                            fontSize: 14.0, color: kMainColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                ButtonGlobal(
                  buttontext: 'View Order',
                  buttonDecoration:
                      kButtonDecoration.copyWith(color: kMainColor),
                  onPressed: () {
                    OrderList(
                      page: 1,
                    ).launch(context, isNewTask: true);
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Back to Home',
                  style: kTextStyle.copyWith(color: kGreyTextColor),
                ).onTap(() => const Home().launch(context, isNewTask: true)),
              ],
            ),
          ),
        ).visible(orderNo != ''),
      ],
    );
  }
}
