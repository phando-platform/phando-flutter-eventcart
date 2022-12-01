import 'dart:developer';

import 'package:event_app/Models/delivery/delivery_body_model.dart';
import 'package:event_app/Models/delivery/delivery_reponse_model.dart';
import 'package:event_app/Screens/payment_helpers/create_order_helper.dart';
import 'package:event_app/Screens/payment_helpers/razorpay_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart' hide log;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../GlobalComponents/button_global.dart';
import '../../Models/order_create_model.dart';
import '../../Models/profile_model.dart';
import '../../Services/api_manager.dart';
import '../../Services/cart_item_notifier.dart';
import '../../Services/discount_provider.dart';
import '../../Services/cart_notifier.dart';
import '../../constant.dart';
import '../Authentication/update_shipping.dart';
import '../Home Screen/home.dart';
import '../Profile/order_list.dart';

class OrderReview extends StatefulWidget {
  const OrderReview({
    Key? key,
    required this.subTotalAmount,
    required this.cart,
    required this.reference,
  }) : super(key: key);
  @override
  _OrderReviewState createState() => _OrderReviewState();

  final double subTotalAmount;
  final List<Carts> cart;
  final WidgetRef reference;
}

class _OrderReviewState extends State<OrderReview> {
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String token = '';
  bool isCod = true;
  int? country;
  String? mobile;
  DeliveryResponseModel? updatedAmount;

  Future<void> getToken() async {
    SharedPreferences preferences = await _prefs;

    token = preferences.getString('token') ?? "";
    country = preferences.getInt('country');
    mobile = preferences.getString('phone');

    final profile = await _apiManager.getProfileInfo(token);

    final finalAmount = await _apiManager.getShippingCharges(
      details: DeliveryBodyModel(
        addressLineOne: profile.value?.shipping?.addressLineOne ?? '',
        shippingPost: profile.value?.shipping?.shippingPost ?? '',
        shippingTown: profile.value?.shipping?.shippingTown ?? '',
        shippingState: profile.value?.shipping?.shippingState ?? '',
        subTotal: widget.subTotalAmount.toString(),
        cart: widget.cart,
      ),
      token: token,
    );

    if (finalAmount?.success ?? false) {
      updatedAmount = finalAmount;
    }

    setState(() {});

    _razorpay = Razorpay();

    OrderCreateModel model = OrderCreateModel(
      couponId: "1",
      couponDiscount: "0.0",
      subTotal: updatedAmount?.value.subtotal.toString(),
      totalShipping: updatedAmount?.value.shippingCost.toString(),
      total: updatedAmount?.value.grandTotal.toString(),
      shippingAddressId: "0",
      billingAddressId: "0",
      cart: widget.cart,
      currency: Currency(
        id: '7',
        exchangeRate: '1',
      ),
      paymentBy: 'razorpay',
    );

    RazorPayMethods.initialise(
      razorpay: _razorpay,
      context: context,
      apiManager: _apiManager,
      model: model,
      token: token,
      updatedAmount: updatedAmount,
      successCallbackFunction: () {
        EasyLoading.showSuccess('Order Placed Successfully');
        widget.reference.read(cartProvider).deleteCart();
        widget.reference.read(cartItemUiProvider).deleteUICart();
        setState(() {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Home(),
            ),
            ModalRoute.withName("/Home"),
          );
        });
      },
    );
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
  }

  @override
  void dispose() {
    super.dispose();
    RazorPayMethods.dispose(razorpay: _razorpay);
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
              if (snapshot.hasData && snapshot.data?.value?.shipping != null) {
                saveBillingAndShippingData(
                  billing: snapshot.data?.value?.billing,
                  shipping: snapshot.data?.value?.shipping,
                );
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
                                  callback: null,
                                ).launch(context).then((_) {
                                  setState(() {});
                                });
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
                                Navigator.of(context)
                                    .push<ShippingUpdate>(MaterialPageRoute(
                                  builder: (context) => UpdateShipping(
                                    shipping: shipUpdate,
                                    isShipping: true,
                                    callback: (value) async {
                                      final finalAmount =
                                          await _apiManager.getShippingCharges(
                                        details: DeliveryBodyModel(
                                          addressLineOne:
                                              value.addressOne ?? '',
                                          shippingPost: value.postCode ?? '',
                                          shippingTown: value.town ?? '',
                                          shippingState: value.state ?? '',
                                          subTotal:
                                              widget.subTotalAmount.toString(),
                                          cart: widget.cart,
                                        ),
                                        token: token,
                                      );
                                      if (finalAmount?.success ?? false) {
                                        updatedAmount = finalAmount;
                                      }
                                      setState(() {});
                                    },
                                  ),
                                ));
                                // UpdateShipping(
                                //   shipping: shipUpdate,
                                //   isShipping: true,
                                // ).launch(context).then((v) async {
                                //   final value = v as ShippingUpdate;
                                //   final finalAmount =
                                //       await _apiManager.getShippingCharges(
                                //     details: DeliveryBodyModel(
                                //       addressLineOne: value.addressOne ?? '',
                                //       shippingPost: value.postCode ?? '',
                                //       shippingTown: value.town ?? '',
                                //       shippingState: value.state ?? '',
                                //       subTotal:
                                //           widget.subTotalAmount.toString(),
                                //       cart: widget.cart,
                                //     ),
                                //     token: token,
                                //   );
                                //   if (finalAmount?.success ?? false) {
                                //     updatedAmount = finalAmount;
                                //   }
                                //   setState(() {});
                                // });
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
                                        log(isCod.toString());
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
                                    value: !isCod,
                                    onChanged: (val) {
                                      setState(() {
                                        isCod = !isCod;
                                        log(isCod.toString());
                                      });
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DecoratedBox(
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
                                      '$currencyIcon ${updatedAmount?.value.grandTotal ?? 0 - discount}',
                                      style: kTextStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                ButtonGlobal(
                                  buttontext:
                                      isCod ? 'Submit Order' : 'Proceed to Pay',
                                  buttonDecoration: kButtonDecoration.copyWith(
                                      color: kMainColor),
                                  onPressed: () async {
                                    try {
                                      EasyLoading.show(
                                        status: 'Processing Order',
                                      );
                                      Currency currency =
                                          Currency(exchangeRate: '1', id: '1');
                                      OrderCreateModel model = OrderCreateModel(
                                        couponId: info.couponId ?? "1",
                                        couponDiscount:
                                            info.discountAmount == null
                                                ? "0.0"
                                                : discount.toString(),
                                        subTotal: updatedAmount?.value.subtotal
                                            .toString(),
                                        totalShipping: updatedAmount
                                            ?.value.shippingCost
                                            .toString(),
                                        total: updatedAmount?.value.grandTotal
                                            .toString(),
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
                                      // If the order is COD
                                      if (isCod) {
                                        final result =
                                            await CreateOrderHelper.placeOrder(
                                          token: token,
                                          apiManager: _apiManager,
                                          paymentBy: 'cod',
                                          paymentId: '',
                                          model: model,
                                          amount: updatedAmount,
                                        );
                                        if (result) {
                                          EasyLoading.showSuccess(
                                            'Order Placed Successfully',
                                          );
                                          ref.read(cartProvider).deleteCart();
                                          ref
                                              .read(cartItemUiProvider)
                                              .deleteUICart();
                                          setState(() {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Home(),
                                                ),
                                                ModalRoute.withName("/Home"));
                                          });
                                        } else {
                                          EasyLoading.showError(
                                            'Can not place order at the moment!\nPlease try again later.',
                                          );
                                        }
                                      } else {
                                        final prefs = await _prefs;
                                        String? billingPhone =
                                            prefs.getString('billing_phone') ??
                                                prefs.getString('phone') ??
                                                '0000000000';
                                        String? billingEmail =
                                            prefs.getString('billing_email') ??
                                                "Not Specified";
                                        String? billingFirstName =
                                            prefs.getString('firstName') ??
                                                "Not Specified";
                                        String? billingLastName =
                                            prefs.getString('lastName') ??
                                                "Not Specified";

                                        final razorPayDetails =
                                            await _apiManager.getRazorPayId(
                                          amount:
                                              updatedAmount?.value.grandTotal ??
                                                  0,
                                          token: token,
                                        );
                                        if (razorPayDetails != null) {
                                          RazorPayMethods.openRazopay(
                                            razorpay: _razorpay,
                                            orderId: razorPayDetails.orderId,
                                            key: razorPayDetails.razorpayKey,
                                            amount: (updatedAmount
                                                        ?.value.grandTotal ??
                                                    0)
                                                .toString(),
                                            contact: billingPhone,
                                            email: billingEmail,
                                            name:
                                                '$billingFirstName $billingLastName',
                                          );
                                        } else {
                                          EasyLoading.showError(
                                            'Unable to connect to Razorpay at the moment.\nPlease try again later.',
                                          );
                                        }
                                      }
                                    } catch (e, strackTrace) {
                                      log(strackTrace.toString());
                                      EasyLoading.showError(e.toString());
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ).visible(true),
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
                        text: '',
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
        ).visible(false),
      ],
    );
  }
}
