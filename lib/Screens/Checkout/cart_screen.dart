import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/button_global.dart';
import '../../Models/order_create_model.dart';
import '../../Screens/Authentication/signin.dart';
import '../../Services/api_manager.dart';
import '../../Services/cart_item_notifier.dart';
import '../../Services/cart_notifier.dart';
import '../../Services/discount_provider.dart';
import '../../constant.dart';
import '../Home Screen/home.dart';
import 'order_review.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int productQuantity = 1;
  int minQuantity = 0;
  double shipping = 0.0;
  final couponController = TextEditingController();
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String token = '';
  double discount = 0.0;
  String? username;
  late List<CartItemUi> cartItemUi;
  late List<Cart> cartItems;

  Future<void> getToken() async {
    SharedPreferences preferences = await _prefs;
    setState(() {
      token = preferences.getString('token') ?? 'Guest';
      username = preferences.getString('username')!;
    });
  }

  @override
  void initState() {
    getToken();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, ref, watch) {
        cartItemUi = ref.watch(cartItemUiProvider).cartItemUis;
        cartItems = ref.watch(cartProvider).cartItems;
        if (cartItems.isEmpty) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                centerTitle: true,
                iconTheme: const IconThemeData(color: Colors.black),
                title: Text(
                  'My Cart',
                  style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/emptycart.svg',
                    height: context.height() / 2,
                    width: context.width(),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'No Items in the cart',
                    style: kTextStyle.copyWith(
                        color: kTitleColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ButtonGlobal(
                      buttontext: 'Shop Now',
                      buttonDecoration:
                          kButtonDecoration.copyWith(color: kMainColor),
                      onPressed: () => const Home().launch(context)),
                ],
              ));
        } else {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black),
              title: Text(
                'My Cart',
                style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cartItemUi.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          elevation: 1.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: 120.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              cartItemUi[index].productImage ??
                                                  ''),
                                        ),
                                      ),
                                    )),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartItemUi[index].productName ?? 'Null',
                                        style: kTextStyle,
                                        maxLines: 2,
                                      ),
                                      Text(
                                        'Price: $currencyIcon${(cartItemUi[index].productPrice * cartItemUi[index].productQuantity).toString()}',
                                        style: kTextStyle.copyWith(
                                            color: kMainColor, fontSize: 12.0),
                                      ),
                                      // RichText(
                                      //   text: TextSpan(
                                      //     children: [
                                      //       TextSpan(
                                      //         text: 'Color: ',
                                      //         style: kTextStyle.copyWith(
                                      //             color: kGreyTextColor,
                                      //             fontSize: 12.0),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      // RichText(
                                      //   text: TextSpan(
                                      //     children: [
                                      //       TextSpan(
                                      //         text: 'Size: ',
                                      //         style: kTextStyle.copyWith(
                                      //             color: kGreyTextColor,
                                      //             fontSize: 12.0),
                                      //       ),
                                      //       TextSpan(
                                      //         text:
                                      //             cartItemUi[index].productSize,
                                      //         style: kTextStyle.copyWith(
                                      //             color: kMainColor,
                                      //             fontSize: 12.0),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.remove,
                                            color: kTitleColor,
                                          ).onTap(() {
                                            if (ref
                                                    .read(cartItemUiProvider)
                                                    .cartItemUis[index]
                                                    .minimumQtd
                                                    .toInt() <
                                                ref
                                                    .read(cartItemUiProvider)
                                                    .cartItemUis[index]
                                                    .productQuantity!) {
                                              ref
                                                  .read(cartItemUiProvider
                                                      .notifier)
                                                  .decreaseQuantity(
                                                      cartItemUi[index].id ??
                                                          0);
                                              ref
                                                  .read(cartProvider.notifier)
                                                  .updatePrice(
                                                      cartItemUi[index].id ?? 0,
                                                      ref
                                                          .read(
                                                              cartItemUiProvider
                                                                  .notifier)
                                                          .cartItemUis[index]
                                                          .productQuantity!
                                                          .toInt());
                                            } else {
                                              toast(
                                                'Minimum purchase quantity for product is ${ref.read(cartItemUiProvider).cartItemUis[index].productQuantity}',
                                                bgColor: Colors.red,
                                              );
                                            }
                                          }),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            cartItemUi[index]
                                                .productQuantity
                                                .toString(),
                                            // ref
                                            //     .read(
                                            //         cartItemUiProvider.notifier)
                                            //     .cartItemUis[index]
                                            //     .productQuantity
                                            //     .toString(),
                                            style: kTextStyle.copyWith(
                                                color: kMainColor,
                                                fontSize: 18.0),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          const Icon(
                                            Icons.add,
                                            color: kTitleColor,
                                          ).onTap(() {
                                            ref
                                                .read(
                                                    cartItemUiProvider.notifier)
                                                .updateQuantity(
                                                  cartItemUi[index].id ?? 0,
                                                );
                                            ref
                                                .read(cartProvider.notifier)
                                                .updatePrice(
                                                  cartItemUi[index].id ?? 0,
                                                  ref
                                                      .read(cartItemUiProvider
                                                          .notifier)
                                                      .cartItemUis[index]
                                                      .productQuantity!
                                                      .toInt(),
                                                );
                                            /*if (productQuantity == 10) {
                                              toast(
                                                  'You can\'t buy more than 10 products');
                                            }*/
                                          }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: const Color(0xFFFFEAEA),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.delete_outlined,
                                      color: Colors.red,
                                    ),
                                  ),
                                ).onTap(() {
                                  ref
                                      .read(cartProvider.notifier)
                                      .removeItem(cartItemUi[index].id ?? 0);
                                  ref
                                      .read(cartItemUiProvider.notifier)
                                      .removeUiItem(cartItemUi[index].id ?? 0);
                                }),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              AppTextField(
                                textFieldType: TextFieldType.NAME,
                                controller: couponController,
                                decoration: InputDecoration(
                                  fillColor: const Color(0xFFFFEAEA),
                                  focusColor: const Color(0xFFFFEAEA),
                                  filled: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  hintText: 'Enter Promo Code',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                height: 60.0,
                                width: 100.0,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                  ),
                                  color: Colors.red,
                                ),
                                child: Center(
                                  child: Text(
                                    'Apply',
                                    style: kTextStyle.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ),
                              ).onTap(() async {
                                if (couponController.text.isNotEmpty) {
                                  try {
                                    int total = ref
                                        .read(cartProvider.notifier)
                                        .getTotalCharge()
                                        .toInt();
                                    EasyLoading.show(status: 'Applying Coupon');
                                    final coupon = await _apiManager.addCoupon(
                                        couponController.text, token);
                                    if (coupon.success == true) {
                                      if (coupon.coupon?.type == 'product' &&
                                          coupon.coupon!.details!.productId!
                                              .contains(cartItems[0].id)) {
                                        ref
                                            .read(cartProvider.notifier)
                                            .couponForProduct(
                                                coupon.coupon!.details!
                                                    .productId!,
                                                coupon.coupon!.discount!,
                                                coupon.coupon!.discountType!);
                                        ref
                                            .read(fetDiscountInfoProvider)
                                            .getCouponCode(
                                                coupon.coupon!.code!);
                                        ref
                                            .read(fetDiscountInfoProvider)
                                            .getCouponId(coupon.coupon!.id!);
                                        ref
                                            .read(fetDiscountInfoProvider)
                                            .getDiscountAmount(discount);
                                        EasyLoading.showSuccess(
                                            'Coupon Applied');
                                      } else if (coupon.coupon?.type ==
                                              'product' &&
                                          !coupon.coupon!.details!.productId!
                                              .contains(cartItems[0].id)) {
                                        EasyLoading.showError(
                                          'Your Cart is not Eligible For the Coupon',
                                        );
                                      } else if (coupon.coupon?.type ==
                                              'cart' &&
                                          total >
                                              coupon.coupon!.details!.minBuy!
                                                  .toInt()) {
                                        EasyLoading.showSuccess(
                                            'Coupon Applied');
                                        setState(() {
                                          discount = ref
                                              .read(cartProvider)
                                              .couponForCart(
                                                  total,
                                                  coupon
                                                      .coupon!.details!.minBuy!
                                                      .toInt(),
                                                  coupon.coupon!.details!
                                                      .maxDiscount!
                                                      .toInt(),
                                                  coupon.coupon!.discount!,
                                                  coupon.coupon!.discountType!);
                                        });
                                        ref
                                            .read(fetDiscountInfoProvider)
                                            .getCouponCode(
                                                coupon.coupon!.code!);
                                        ref
                                            .read(fetDiscountInfoProvider)
                                            .getCouponId(coupon.coupon!.id!);
                                        ref
                                            .read(fetDiscountInfoProvider)
                                            .getDiscountAmount(discount);
                                      } else if (coupon.coupon?.type ==
                                              'cart' &&
                                          total <
                                              coupon.coupon!.details!.minBuy!
                                                  .toInt()) {
                                        EasyLoading.showError(
                                            'Please shop $currencyIcon ${coupon.coupon!.details!.minBuy!.toInt() - total} more to use this coupon');
                                      }
                                    } else {
                                      EasyLoading.showError(
                                          coupon.message.toString());
                                    }
                                  } catch (e) {
                                    EasyLoading.showError(e.toString());
                                  }
                                } else {
                                  toast(
                                    'Please enter a valid Promo Code',
                                    bgColor: Colors.red,
                                  );
                                }
                              }),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Text(
                                'SubTotal: ',
                                style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                              ),
                              const Spacer(),
                              Text(
                                currencyIcon +
                                    ref
                                        .read(cartProvider.notifier)
                                        .getSubTotal()
                                        .toString(),
                                style: kTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       'Delivery Fee: ',
                          //       style:
                          //           kTextStyle.copyWith(color: kGreyTextColor),
                          //     ),
                          //     const Spacer(),
                          //     Text(
                          //       currencyIcon +
                          //           ref
                          //               .read(cartProvider.notifier)
                          //               .getShippingCharge()
                          //               .toString(),
                          //       style: kTextStyle,
                          //     ),
                          //   ],
                          // ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'T&C: Delivery fee is subjected to shipping address*',
                                  style: kTextStyle.copyWith(
                                    color: kGreyTextColor,
                                    fontSize: 10,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Divider(
                            color: kGreyTextColor.withOpacity(0.2),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       'Total Amount: ',
                          //       style: kTextStyle.copyWith(
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //     const Spacer(),
                          //     Text(
                          //       currencyIcon +
                          //           ((ref
                          //                           .read(cartProvider.notifier)
                          //                           .getTotalCharge() -
                          //                       discount) +
                          //                   ref
                          //                       .read(cartProvider.notifier)
                          //                       .getShippingCharge())
                          //               .toString(),
                          //       style: kTextStyle,
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ButtonGlobal(
                            buttontext: 'Checkout',
                            buttonDecoration:
                                kButtonDecoration.copyWith(color: kMainColor),
                            onPressed: () {
                              if (token != 'Guest') {
                                double weight = 0;
                                OrderReview(
                                  subTotalAmount: (ref
                                          .read(cartProvider.notifier)
                                          .getTotalCharge() -
                                      discount),
                                  cart: ref.watch(cartProvider).getItems(),
                                  reference: ref,
                                  token: token,
                                ).launch(context);
                              } else {
                                toast('Please sign In to Checkout');
                                const SignIn().launch(context);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
