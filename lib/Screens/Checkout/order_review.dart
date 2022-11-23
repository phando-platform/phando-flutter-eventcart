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

  void saveBillingAndShippingData({
    required Billing? billing,
    required Shipping? shipping,
  }) async {
    if (billing != null) {
      await _prefs
        ..setString(
          'billing_postal_Code',
          billing.postCode ?? '',
        )
        ..setString(
          'billing_user_state',
          billing.state ?? '',
        )
        ..setString(
          'billing_user_city',
          billing.state ?? '',
        )
        ..setString(
          'billing_add_one',
          billing.address1 ?? '',
        )
        ..setString(
          'billing_add_two',
          '',
        )
        ..setString(
          'billing_full_name',
          '${billing.firstName ?? ''} ${billing.lastName ?? ''}',
        )
        ..setString(
          'billing_email',
          billing.email ?? '',
        )
        ..setString(
          'billing_phone',
          billing.mobile ?? '',
        );
    }
    if (shipping != null) {
      await _prefs
        ..setString(
          'shipping_postal_Code',
          shipping.shippingPost ?? '',
        )
        ..setString(
          'shipping_user_state',
          shipping.shippingState ?? '',
        )
        ..setString(
          'shipping_user_city',
          shipping.shippingTown ?? '',
        )
        ..setString(
          'shipping_add_one',
          shipping.addressLineOne ?? '',
        )
        ..setString(
          'shipping_add_two',
          shipping.addressLineTwo ?? '',
        )
        ..setString(
          'shipping_full_name',
          shipping.shippingName ?? '',
        )
        ..setString(
          'shipping_phone',
          shipping.shippingMobile ?? '',
        )
        ..setString(
          'shipping_email',
          shipping.shippingEmail ?? '',
        );
    }
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

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response Message: ${response.paymentId}');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response Message: $response');
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
                saveBillingAndShippingData(
                  billing: snapshot.data?.value?.billing,
                  shipping: snapshot.data?.value?.shipping,
                );
                if (snapshot.data?.value?.shipping == null) {
                  return Center(
                    child: SizedBox(
                      height: 60.0,
                      child: ButtonGlobal(
                        buttontext: 'Add Shipping Id',
                        buttonDecoration:
                            kButtonDecoration.copyWith(color: kMainColor),
                        onPressed: () => AddBilling(
                          country: country,
                          mobile: mobile,
                          status: 2,
                        ).launch(context),
                      ),
                    ),
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
                                ShippingUpdate shipUpdate = ShippingUpdate(
                                  fullName:
                                      '${snapshot.data?.value?.billing?.firstName} ${snapshot.data?.value?.billing?.lastName}',
                                  addressOne:
                                      snapshot.data?.value?.billing?.address1,
                                  addressTwo:
                                      snapshot.data?.value?.billing?.userCity,
                                  town: snapshot.data?.value?.billing?.userCity,
                                  countryId: snapshot
                                      .data?.value?.billing?.country?.id
                                      .toString(),
                                  postCode:
                                      snapshot.data?.value?.billing?.postCode,
                                  mobile: snapshot.data?.value?.billing?.mobile,
                                  email: snapshot.data?.value?.billing?.email,
                                  state: snapshot.data?.value?.billing?.state,
                                );
                                UpdateShipping(
                                  shipping: shipUpdate,
                                  isShipping: false,
                                ).launch(context);
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
                                '${snapshot.data?.value?.shipping?.shippingName ?? ''} - ${snapshot.data?.value?.shipping?.addressLineOne ?? ''} ,${snapshot.data?.value?.shipping?.addressLineTwo ?? ''} , ${snapshot.data?.value?.shipping?.shippingTown ?? ''}  ,${snapshot.data?.value?.shipping?.country?.name ?? ''} , ${snapshot.data?.value?.shipping?.shippingPost ?? ''} - ${snapshot.data?.value?.shipping?.shippingMobile ?? ''} ',
                                style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                                maxLines: 5,
                              ),
                              trailing: Text(
                                'Change',
                                style: kTextStyle.copyWith(color: kRedColor),
                              ),
                              onTap: () {
                                ShippingUpdate shipUpdate = ShippingUpdate(
                                  fullName: snapshot
                                      .data?.value?.shipping?.shippingName,
                                  addressOne: snapshot
                                      .data?.value?.shipping?.addressLineOne,
                                  addressTwo: snapshot
                                      .data?.value?.shipping?.addressLineTwo,
                                  town: snapshot
                                      .data?.value?.shipping?.shippingTown,
                                  countryId: snapshot
                                      .data?.value?.shipping?.country?.id
                                      .toString(),
                                  postCode: snapshot
                                      .data?.value?.shipping?.shippingPost,
                                  mobile: snapshot
                                      .data?.value?.shipping?.shippingMobile,
                                  email: snapshot
                                      .data?.value?.shipping?.shippingEmail,
                                  state: snapshot
                                      .data?.value?.shipping?.shippingState,
                                );
                                UpdateShipping(
                                  shipping: shipUpdate,
                                  isShipping: true,
                                ).launch(context);
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
                            const SizedBox(
                              height: 10.0,
                            ),
                            // Container(
                            //   padding: const EdgeInsets.all(8.0),
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(10.0),
                            //       color: Colors.white),
                            //   child: ListTile(
                            //     contentPadding:
                            //         const EdgeInsets.only(left: 0.0),
                            //     leading: Image.asset(
                            //       'images/paypal.png',
                            //       height: 60.0,
                            //       width: 80.0,
                            //       fit: BoxFit.cover,
                            //     ),
                            //     title: Text(
                            //       'Paypal',
                            //       style:
                            //           kTextStyle.copyWith(color: kTitleColor),
                            //     ),
                            //     subtitle: Text(
                            //       'Pay With Paypal',
                            //       style: kTextStyle.copyWith(
                            //           color: kGreyTextColor),
                            //       maxLines: 2,
                            //     ),
                            //     trailing: Checkbox(
                            //         value: isPaypal,
                            //         onChanged: (val) {
                            //           setState(() {
                            //             isPaypal = val!;
                            //             if (isPaypal) {
                            //               isRazorpay = false;
                            //               isCod = false;
                            //             } else {
                            //               isRazorpay = false;
                            //               isCod = true;
                            //             }
                            //           });
                            //         }),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 10.0,
                            // ),
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
                            ),
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
                                    try {
                                      EasyLoading.show(
                                        status: 'Creating Order',
                                      );
                                      double subtotal = (ref
                                              .read(cartProvider.notifier)
                                              .getTotalCharge() -
                                          discount);
                                      double shipping = ref
                                          .read(cartProvider.notifier)
                                          .getShippingCharge();
                                      double total = (subtotal + shipping);

                                      Currency currency =
                                          Currency(exchangeRate: '1', id: '1');
                                      OrderCreateModel model = OrderCreateModel(
                                        couponId: info.couponId ?? "1",
                                        couponDiscount:
                                            info.discountAmount == null
                                                ? "0.0"
                                                : discount.toString(),
                                        subTotal: subtotal.toString(),
                                        totalShipping: shipping.toString(),
                                        total: total.toString(),
                                        shippingAddressId: snapshot
                                            .data?.value?.shipping?.id
                                            .toString(),
                                        billingAddressId: snapshot
                                            .data?.value?.billing?.id
                                            .toString(),
                                        cart: cartItems,
                                        currency: currency,
                                        paymentBy: 'cod',
                                      );
                                      final order =
                                          await _apiManager.createOrder(
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
                                        snapshot.data?.value?.shipping?.id
                                                .toString() ??
                                            '',
                                        snapshot.data?.value?.billing?.id
                                                .toString() ??
                                            '',
                                      );

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
                                                  builder: (context) => Home()),
                                              ModalRoute.withName("/Home"));
                                        });
                                      } else {
                                        EasyLoading.showError(
                                            order.message.toString());
                                      }
                                    } catch (e) {
                                      EasyLoading.showError(e.toString());
                                    }
                                  },
                                ).visible(isCod),
                                ButtonGlobal(
                                    buttontext: 'Pay with Paypal',
                                    buttonDecoration: kButtonDecoration
                                        .copyWith(color: kMainColor),
                                    onPressed: () {
                                      double subtotal = (ref
                                              .read(cartProvider.notifier)
                                              .getTotalCharge() -
                                          discount);
                                      double shipping = ref
                                          .read(cartProvider.notifier)
                                          .getShippingCharge();
                                      double total = (subtotal + shipping);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              UsePaypal(
                                                  sandboxMode: sandbox,
                                                  clientId: paypalClientId,
                                                  secretKey: paypalClientSecret,
                                                  returnURL:
                                                      "https://samplesite.com/return",
                                                  cancelURL:
                                                      "https://samplesite.com/cancel",
                                                  transactions: [
                                                    {
                                                      "amount": {
                                                        "total": '$total',
                                                        "currency": currency,
                                                        "details": {
                                                          "subtotal":
                                                              '$subtotal',
                                                          "shipping":
                                                              '$shipping',
                                                          "shipping_discount": 0
                                                        }
                                                      },
                                                      "description":
                                                          "The payment transaction description.",
                                                      // "payment_options": {
                                                      //   "allowed_payment_method":
                                                      //       "INSTANT_FUNDING_SOURCE"
                                                      // },
                                                      "item_list": {
                                                        "items": [
                                                          {
                                                            "name":
                                                                "A demo product",
                                                            "quantity": 1,
                                                            "price":
                                                                '$subtotal',
                                                            "currency": currency
                                                          }
                                                        ],

                                                        // shipping address is not required though
                                                        "shipping_address": {
                                                          "recipient_name":
                                                              snapshot
                                                                  .data
                                                                  ?.value
                                                                  ?.shipping
                                                                  ?.shippingName,
                                                          "line1": snapshot
                                                              .data
                                                              ?.value
                                                              ?.shipping
                                                              ?.addressLineOne,
                                                          "line2": snapshot
                                                              .data
                                                              ?.value
                                                              ?.shipping
                                                              ?.addressLineTwo,
                                                          "city": snapshot
                                                              .data
                                                              ?.value
                                                              ?.shipping
                                                              ?.shippingTown,
                                                          "country_code":
                                                              snapshot
                                                                  .data
                                                                  ?.value
                                                                  ?.shipping
                                                                  ?.country
                                                                  ?.isoNo,
                                                          "postal_code": snapshot
                                                              .data
                                                              ?.value
                                                              ?.shipping
                                                              ?.shippingPost,
                                                          "phone": snapshot
                                                              .data
                                                              ?.value
                                                              ?.shipping
                                                              ?.shippingMobile,
                                                        },
                                                      }
                                                    }
                                                  ],
                                                  note:
                                                      "Contact us for any questions on your order.",
                                                  onSuccess:
                                                      (Map params) async {
                                                    try {
                                                      EasyLoading.show(
                                                          status:
                                                              'Creating Order');
                                                      double subtotal = (ref
                                                              .read(cartProvider
                                                                  .notifier)
                                                              .getTotalCharge() -
                                                          discount);
                                                      double shipping = ref
                                                          .read(cartProvider
                                                              .notifier)
                                                          .getShippingCharge();
                                                      double total =
                                                          (subtotal + shipping);

                                                      Currency currency =
                                                          Currency(
                                                              exchangeRate: '1',
                                                              id: '1');
                                                      OrderCreateModel model = OrderCreateModel(
                                                          couponId: info.couponId ??
                                                              "1",
                                                          couponDiscount:
                                                              info.discountAmount ==
                                                                      null
                                                                  ? "0.0"
                                                                  : discount
                                                                      .toString(),
                                                          subTotal: subtotal
                                                              .toString(),
                                                          totalShipping: shipping
                                                              .toString(),
                                                          total:
                                                              total.toString(),
                                                          shippingAddressId:
                                                              snapshot
                                                                  .data
                                                                  ?.value
                                                                  ?.shipping
                                                                  ?.id
                                                                  .toString(),
                                                          billingAddressId:
                                                              snapshot
                                                                  .data
                                                                  ?.value
                                                                  ?.billing
                                                                  ?.id
                                                                  .toString(),
                                                          cart: cartItems,
                                                          currency: currency,
                                                          paymentBy: 'paypal');
                                                      final order = await _apiManager.createOrder(
                                                          model,
                                                          token,
                                                          'paypal',
                                                          subtotal.toString(),
                                                          shipping.toString(),
                                                          total.toString(),
                                                          info.discountAmount ==
                                                                  null
                                                              ? "0.0"
                                                              : discount
                                                                  .toString(),
                                                          info.couponId ?? "0",
                                                          snapshot.data?.value
                                                                  ?.shipping?.id
                                                                  .toString() ??
                                                              '',
                                                          snapshot.data?.value
                                                                  ?.billing?.id
                                                                  .toString() ??
                                                              '');
                                                      if (order.success ==
                                                          true) {
                                                        EasyLoading.showSuccess(
                                                            'Create Successfull');
                                                        ref
                                                            .read(cartProvider)
                                                            .cartItems
                                                            .clear();
                                                        ref
                                                            .read(
                                                                cartItemUiProvider)
                                                            .cartItemUis
                                                            .clear();
                                                        setState(() {
                                                          orderNo = order
                                                                  .value
                                                                  ?.orders?[0]
                                                                  .orderId ??
                                                              "";
                                                        });
                                                      } else {
                                                        EasyLoading.showError(
                                                            order.message
                                                                .toString());
                                                      }
                                                    } catch (e) {
                                                      EasyLoading.showError(
                                                          e.toString());
                                                    }
                                                    OrderSuccessful(
                                                      orderNumber:
                                                          orderNo.toString(),
                                                    ).launch(context);
                                                  },
                                                  onError: (error) {
                                                    EasyLoading.showError(
                                                        error.toString());
                                                  },
                                                  onCancel: (params) {
                                                    EasyLoading.showError(
                                                        'Payment Cancelled. Please try again');
                                                  }),
                                        ),
                                      );
                                    }).visible(isPaypal),
                                ButtonGlobal(
                                    buttontext: 'Pay with Razorpay',
                                    buttonDecoration: kButtonDecoration
                                        .copyWith(color: kMainColor),
                                    onPressed: () {
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
