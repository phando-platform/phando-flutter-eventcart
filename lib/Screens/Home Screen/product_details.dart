// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Helpers/helper.functions.dart';
import '../../Models/order_create_model.dart';
import '../../Models/product_details_model.dart';
import '../../Screens/Checkout/cart_screen.dart';
import '../../Services/api_manager.dart';
import '../../Services/cart_item_notifier.dart';
import '../../Services/cart_notifier.dart';
import '../../constant.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  ProductDetails({Key? key, @required this.productId}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  var productId;
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void addBookmark(String id) async {
    try {
      EasyLoading.show(status: 'Adding...');
      final SharedPreferences prefs = await _prefs;
      final wishlist = await _apiManager.addToWishList(
          id, prefs.getString('token').toString());
      if (wishlist.success == true) {
        EasyLoading.showSuccess(wishlist.message.toString());
      } else {
        EasyLoading.showError(wishlist.message.toString());
      }
    } catch (e) {
      toast(e.toString());
    }
  }

  bool description = true;

  int selectedColorIndex = 0;
  int productQuantity = 1;
  int selectedSizeIndex = 0;

  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;
  final ApiManager _apiManager = ApiManager();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<ProductDetailsModel>(
        future: _apiManager.productDetails(widget.productId.toString()),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                elevation: 0.0,
                iconTheme: const IconThemeData(color: kBlackColor),
                leading: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: GestureDetector(
                    child: CircleAvatar(
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: kBlackColor,
                      ),
                      backgroundColor: kDarkWhite.withOpacity(0.5),
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
                backgroundColor: kTransparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: const CircleAvatar(
                      backgroundColor: kWhiteColor,
                      radius: 15.0,
                      child: Center(
                          child: Icon(
                        Icons.favorite_border_outlined,
                        color: kMainColor,
                      )),
                    ).onTap(() => addBookmark(
                        snapshot.data?.value?.id?.toString() ?? '')),
                  ),
                ],
              ),
              bottomNavigationBar: Card(
                elevation: 0.0,
                color: kWhiteColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Consumer(
                    builder: (BuildContext context, ref, watch) {
                      bool isAdded = ref.read(cartProvider.notifier).checkCart(
                          snapshot.data?.value?.id ?? 10,
                          snapshot.data!.value!.sizes!.isEmpty
                              ? 'Null'
                              : snapshot.data?.value?.sizes?[selectedSizeIndex]
                                      .name ??
                                  'Null',
                          snapshot.data!.value!.colors!.isEmpty
                              ? 'Null'
                              : snapshot.data?.value
                                      ?.colors?[selectedColorIndex].name ??
                                  'Null');
                      return Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (ref.read(cartProvider.notifier).checkCart(
                                        snapshot.data?.value?.id ?? 10,
                                        snapshot.data!.value!.sizes!.isEmpty
                                            ? 'Null'
                                            : snapshot
                                                    .data
                                                    ?.value
                                                    ?.sizes?[selectedSizeIndex]
                                                    .name ??
                                                'Null',
                                        snapshot.data!.value!.colors!.isEmpty
                                            ? 'Null'
                                            : snapshot
                                                    .data
                                                    ?.value
                                                    ?.colors?[
                                                        selectedColorIndex]
                                                    .name ??
                                                'Null') ==
                                    false) {
                                  EasyLoading.show(
                                      status: 'Adding To The Cart');
                                  Cart cartItem = Cart(
                                      id: snapshot.data?.value?.id ?? 'Null',
                                      price: snapshot.data?.value?.salePrice ??
                                          0.0,
                                      quantity: productQuantity,
                                      size: snapshot.data!.value!.sizes!.isEmpty
                                          ? 'Null'
                                          : snapshot.data?.value
                                              ?.sizes?[selectedSizeIndex].name,
                                      color:
                                          snapshot.data!.value!.colors!.isEmpty
                                              ? 'Null'
                                              : snapshot
                                                  .data
                                                  ?.value
                                                  ?.colors?[selectedColorIndex]
                                                  .hex,
                                      shippingCost:
                                          snapshot.data?.value?.shippingCost ??
                                              'Null',
                                      estimatedShippingDays: snapshot
                                              .data
                                              ?.value
                                              ?.details
                                              ?.estimatedShippingDays
                                              .toString() ??
                                          'Null',
                                      productPriceTotal:
                                          snapshot.data?.value?.salePrice *
                                                  productQuantity ??
                                              'Null');
                                  CartItemUi cartUi = CartItemUi(
                                      id: snapshot.data?.value?.id ?? 0,
                                      productName: snapshot.data?.value?.name,
                                      productImage: snapshot
                                          .data?.value?.images?[0].image,
                                      productQuantity: productQuantity,
                                      productPrice:
                                          snapshot.data?.value?.salePrice ??
                                              0.00,
                                      productColor:
                                          snapshot.data!.value!.colors!.isEmpty
                                              ? 'Null'
                                              : snapshot
                                                  .data
                                                  ?.value
                                                  ?.colors?[selectedColorIndex]
                                                  .hex,
                                      productSize:
                                          snapshot.data!.value!.sizes!.isEmpty
                                              ? 'Null'
                                              : snapshot
                                                  .data
                                                  ?.value
                                                  ?.sizes?[selectedSizeIndex]
                                                  .name);
                                  ref
                                      .read(cartProvider.notifier)
                                      .addItem(cartItem);
                                  ref
                                      .read(cartItemUiProvider.notifier)
                                      .addUiItem(cartUi);
                                  EasyLoading.showSuccess('Added To Cart');
                                  setState(() {});
                                } else {
                                  const CartScreen().launch(context);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Container(
                                  height: 55.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: const Color(0xFFFFE8CE),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        !isAdded ? 'Add To Cart' : 'Go To Cart',
                                        style: kTextStyle.copyWith(
                                            color: kMainColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (ref.read(cartProvider.notifier).checkCart(
                                        snapshot.data?.value?.id ?? 10,
                                        snapshot.data!.value!.sizes!.isEmpty
                                            ? 'Null'
                                            : snapshot
                                                    .data
                                                    ?.value
                                                    ?.sizes?[selectedSizeIndex]
                                                    .name ??
                                                'Null',
                                        snapshot.data!.value!.colors!.isEmpty
                                            ? 'Null'
                                            : snapshot
                                                    .data
                                                    ?.value
                                                    ?.colors?[
                                                        selectedColorIndex]
                                                    .hex ??
                                                'Null') ==
                                    false) {
                                  Cart cartItem = Cart(
                                      id: snapshot.data?.value?.id ?? 'Null',
                                      price: snapshot.data?.value?.salePrice ??
                                          0.0,
                                      quantity: productQuantity,
                                      size: snapshot.data!.value!.sizes!.isEmpty
                                          ? 'Null'
                                          : snapshot.data?.value
                                              ?.sizes?[selectedSizeIndex].name,
                                      color:
                                          snapshot.data!.value!.colors!.isEmpty
                                              ? 'Null'
                                              : snapshot
                                                  .data
                                                  ?.value
                                                  ?.colors?[selectedColorIndex]
                                                  .hex,
                                      shippingCost:
                                          snapshot.data?.value?.shippingCost ??
                                              'Null',
                                      estimatedShippingDays: snapshot
                                              .data
                                              ?.value
                                              ?.details
                                              ?.estimatedShippingDays ??
                                          'Null',
                                      productPriceTotal:
                                          snapshot.data?.value?.salePrice *
                                                  productQuantity ??
                                              'Null');
                                  CartItemUi cartUi = CartItemUi(
                                      id: snapshot.data?.value?.id ?? 0,
                                      productName: snapshot.data?.value?.name,
                                      productImage: snapshot
                                          .data?.value?.images?[0].image,
                                      productQuantity: productQuantity,
                                      productPrice:
                                          snapshot.data?.value?.salePrice ??
                                              0.00,
                                      productColor:
                                          snapshot.data!.value!.colors!.isEmpty
                                              ? 'Null'
                                              : snapshot
                                                  .data
                                                  ?.value
                                                  ?.colors?[selectedColorIndex]
                                                  .hex,
                                      productSize:
                                          snapshot.data!.value!.sizes!.isEmpty
                                              ? 'Null'
                                              : snapshot
                                                  .data
                                                  ?.value
                                                  ?.sizes?[selectedSizeIndex]
                                                  .name);
                                  ref
                                      .read(cartProvider.notifier)
                                      .addItem(cartItem);
                                  ref
                                      .read(cartItemUiProvider.notifier)
                                      .addUiItem(cartUi);
                                  const CartScreen().launch(context);
                                } else {
                                  const CartScreen().launch(context);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: Container(
                                  height: 55.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: kMainColor,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Buy Now',
                                        style: kTextStyle.copyWith(
                                            color: kWhiteColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        currencyIcon +
                                            (snapshot.data?.value?.salePrice
                                                    .toString() ??
                                                '${currencyIcon}9.99'),
                                        style: kTextStyle.copyWith(
                                            color: kWhiteColor, fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: CarouselSlider.builder(
                        itemCount: snapshot.data?.value?.images?.length ?? 10,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                snapshot.data?.value?.images![index].image
                                        .toString() ??
                                    '',
                                height: 380,
                                fit: BoxFit.cover,
                              ),
                            ],
                          );
                        },
                        options: CarouselOptions(
                          height: 400,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                currencyIcon +
                                    (snapshot.data?.value?.salePrice
                                            .toString() ??
                                        '9.99'),
                                style: kTextStyle.copyWith(
                                    color: kMainColor, fontSize: 18.0),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                currencyIcon +
                                    (snapshot.data?.value?.unitPrice
                                            .toString() ??
                                        '9.99'),
                                style: kTextStyle.copyWith(
                                    color: kGreyTextColor,
                                    fontSize: 12.0,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: Icon(Icons.share),
                                color: kGreyTextColor,
                                onPressed: () => shareProductLink(
                                    "Some Title", "www.google.com"),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text(
                                (snapshot.data?.value?.name.toString() ??
                                    'T-Shirt'),
                                style: kTextStyle.copyWith(fontSize: 18.0),
                                maxLines: 2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              RatingBarWidget(
                                onRatingChanged: null,
                                rating: 4.7,
                                size: 12.0,
                              ),
                              Text(
                                '(4.7)',
                                style: kTextStyle.copyWith(
                                    color: kGreyTextColor, fontSize: 10.0),
                              ),
                            ],
                          ).visible(false),
                          // Row(
                          //   children: [
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           'Color',
                          //           style: kTextStyle,
                          //         ).visible(snapshot
                          //                 .data?.value?.colors?.isNotEmpty ??
                          //             false),
                          //         SizedBox(
                          //           width: context.width() / 1.5,
                          //           child: HorizontalList(
                          //             spacing: 0,
                          //             itemCount: snapshot
                          //                     .data?.value?.colors?.length ??
                          //                 10,
                          //             itemBuilder: (_, i) {
                          //               return Padding(
                          //                 padding:
                          //                     const EdgeInsets.only(right: 4.0),
                          //                 child: Container(
                          //                   padding: const EdgeInsets.all(3.0),
                          //                   decoration: BoxDecoration(
                          //                     borderRadius:
                          //                         BorderRadius.circular(30.0),
                          //                     border: Border.all(
                          //                         color: selectedColorIndex == i
                          //                             ? kBlackColor
                          //                             : kWhiteColor),
                          //                   ),
                          //                   child: CircleAvatar(
                          //                     backgroundColor: Color(int.parse(
                          //                         snapshot.data!.value!
                          //                             .colors![i].hex!
                          //                             .replaceAll(
                          //                                 '#', '0xFF'))),
                          //                     radius: 12.0,
                          //                   ).onTap(
                          //                     () {
                          //                       setState(() {
                          //                         selectedColorIndex = i;
                          //                       });
                          //                     },
                          //                     highlightColor: context.cardColor,
                          //                   ),
                          //                 ),
                          //               );
                          //             },
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //     const Spacer(),
                          //     Container(
                          //       padding: const EdgeInsets.all(4.0),
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(10.0),
                          //         border: Border.all(
                          //             color: const Color(0xFFE9E9E9)),
                          //       ),
                          //       child: Column(
                          //         children: [
                          //           const Icon(
                          //             Icons.minimize_rounded,
                          //             color: kTitleColor,
                          //           ).onTap(() {
                          //             setState(() {
                          //               productQuantity > 1
                          //                   ? productQuantity--
                          //                   : productQuantity == 1;
                          //             });
                          //           }),
                          //           const SizedBox(
                          //             height: 6.0,
                          //           ),
                          //           Text(
                          //             productQuantity.toString(),
                          //             style: kTextStyle.copyWith(
                          //                 color: kMainColor, fontSize: 18.0),
                          //           ),
                          //           const SizedBox(
                          //             height: 4.0,
                          //           ),
                          //           const Icon(
                          //             Icons.add,
                          //             color: kTitleColor,
                          //           ).onTap(() {
                          //             setState(() {
                          //               productQuantity < 10
                          //                   ? productQuantity++
                          //                   : productQuantity = 10;
                          //               if (productQuantity == 10) {
                          //                 toast(
                          //                     'You can\'t buy more than 10 products');
                          //               }
                          //             });
                          //           }),
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Size',
                                    style: kTextStyle,
                                  ).visible(
                                      snapshot.data?.value?.sizes?.isNotEmpty ??
                                          false),
                                  HorizontalList(
                                    spacing: 0,
                                    itemCount:
                                        snapshot.data?.value?.sizes?.length ??
                                            10,
                                    itemBuilder: (_, i) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4.0),
                                        child: Container(
                                          padding: const EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(color: kBgColor),
                                            color: selectedSizeIndex == i
                                                ? kMainColor
                                                : kWhiteColor,
                                          ),
                                          child: Text(
                                            snapshot.data?.value?.sizes![i]
                                                    .name ??
                                                '',
                                            style: kTextStyle.copyWith(
                                              color: selectedSizeIndex == i
                                                  ? kWhiteColor
                                                  : kTitleColor,
                                            ),
                                          ),
                                        ).onTap(
                                          () {
                                            setState(() {
                                              selectedSizeIndex = i;
                                            });
                                          },
                                          highlightColor: context.cardColor,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: description
                                          ? kMainColor
                                          : kWhiteColor,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Description',
                                  style: kTextStyle.copyWith(
                                      color: description
                                          ? kTitleColor
                                          : kGreyTextColor),
                                ),
                              ).onTap(() {
                                setState(() {
                                  description = !description;
                                });
                              }),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: !description
                                          ? kMainColor
                                          : kWhiteColor,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Reviews',
                                  style: kTextStyle.copyWith(
                                      color: !description
                                          ? kTitleColor
                                          : kGreyTextColor),
                                ),
                              ).visible(false).onTap(() {
                                setState(() {
                                  description = !description;
                                });
                              }),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              snapshot.data?.value?.description.toString() ??
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit pharetra eu ut ut enim laoreet. Scel eri sque vitae, dui tortor tortor.',
                              style: kTextStyle,
                              maxLines: 5,
                            ).visible(description),
                          ),
                          Card(
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: kWhiteColor,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const CircleAvatar(
                                    backgroundColor: kMainColor,
                                    backgroundImage:
                                        AssetImage('images/pd1.png'),
                                  ),
                                  title: Text(
                                    'Ibne Riead',
                                    style: kTextStyle,
                                  ),
                                  subtitle: RatingBarWidget(
                                    onRatingChanged: null,
                                    rating: 5.0,
                                    size: 12.0,
                                  ),
                                  trailing: Text(
                                    '2 Days Ago',
                                    style: kTextStyle.copyWith(
                                        color: kGreyTextColor, fontSize: 14.0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    // snapshot.data?.value?.
                                    //                 .toString()??
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit pharetra eu ut ut enim laoreet. Scel eri sque vitae, dui tortor tortor.',
                                    style: kTextStyle,
                                    maxLines: 5,
                                  ),
                                ),
                              ],
                            ),
                          ).visible(!description),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
