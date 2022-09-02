import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/product_data.dart';
import '../../Models/trends_model.dart';
import './home_screen.dart';
import './product_details.dart';
import '../../GlobalComponents/button_global.dart';
import '../../Services/api_manager.dart';
import '../../constant.dart';
import 'home.dart';

class BestDeals extends StatefulWidget {
  const BestDeals({Key? key}) : super(key: key);

  @override
  _BestDealsState createState() => _BestDealsState();
}

class _BestDealsState extends State<BestDeals> {
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: kBlackColor),
        title: Text(
          'Best Deals',
          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<TrendsModel>(
          future: _apiManager.trendList(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == null) {
                return Column(
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
                      'No best deals found',
                      style: kTextStyle.copyWith(
                          color: kTitleColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ButtonGlobal(
                        buttontext: 'Shop another',
                        buttonDecoration:
                            kButtonDecoration.copyWith(color: kMainColor),
                        onPressed: () => const Home().launch(context)),
                  ],
                );
              }
              return GridView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7,
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: snapshot.data?.value?.data?.length ?? 10,
                itemBuilder: (_, i) {
                  return ProductCard(
                    productData: ProductData(
                      productTitle:
                          snapshot.data?.value?.data?[i].name.toString() ??
                              'Null',
                      productPrice: snapshot.data?.value?.data?[i].purchasePrice
                              .toString() ??
                          'Null',
                      productDiscount:
                          snapshot.data?.value?.data?[i].discount.toString() ??
                              'Null',
                      productRating:
                          snapshot.data?.value?.data?[i].id.toString() ??
                              'Null',
                      productImage: snapshot
                              .data?.value?.data?[i].images?[0].image
                              .toString() ??
                          'Null',
                      productDescription: snapshot
                              .data?.value?.data?[i].description
                              .toString() ??
                          'Null',
                    ),
                    onBookMarkPressed: () async {
                      try {
                        EasyLoading.show(status: 'Adding...');
                        final SharedPreferences prefs = await _prefs;
                        final wishlist = await _apiManager.addToWishList(
                            snapshot.data?.value?.data?[i].id.toString() ??
                                'null',
                            prefs.getString('token').toString());
                        if (wishlist.success == true) {
                          EasyLoading.showSuccess(wishlist.message.toString());
                        } else {
                          EasyLoading.showError(wishlist.message.toString());
                        }
                      } catch (e) {
                        toast(e.toString());
                      }
                    },
                  ).onTap(
                    () {
                      ProductDetails(
                        productId: snapshot.data?.value?.data?[i].id,
                      ).launch(context);
                    },
                    highlightColor: context.cardColor,
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),

      // SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Container(
      //         alignment: Alignment.center,
      //         padding: const EdgeInsets.all(10.0),
      //         child: FutureBuilder<TrendsModel>(
      //             future: _apiManager.trendList(),
      //             builder: (BuildContext context, snapshot) {
      //               if (snapshot.hasData) {
      //                 if (snapshot.data == null) {
      //                   return Column(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       SvgPicture.asset(
      //                         'images/emptycart.svg',
      //                         height: context.height() / 2,
      //                         width: context.width(),
      //                       ),
      //                       const SizedBox(
      //                         height: 20.0,
      //                       ),
      //                       Text(
      //                         'No best deals found',
      //                         style: kTextStyle.copyWith(
      //                             color: kTitleColor,
      //                             fontSize: 20.0,
      //                             fontWeight: FontWeight.bold),
      //                       ),
      //                       const SizedBox(
      //                         height: 20.0,
      //                       ),
      //                       ButtonGlobal(
      //                           buttontext: 'Shop another',
      //                           buttonDecoration: kButtonDecoration.copyWith(
      //                               color: kMainColor),
      //                           onPressed: () => const Home().launch(context)),
      //                     ],
      //                   );
      //                 }
      //                 return GridView.builder(
      //                   physics: const NeverScrollableScrollPhysics(),
      //                   shrinkWrap: true,
      //                   gridDelegate:
      //                       const SliverGridDelegateWithFixedCrossAxisCount(
      //                     childAspectRatio: 0.7,
      //                     crossAxisCount: 2,
      //                     mainAxisSpacing: 5.0,
      //                   ),
      //                   itemCount: snapshot.data?.value?.data?.length ?? 10,
      //                   itemBuilder: (_, i) {
      //                     return ProductCard(
      //                       productData: ProductData(
      //                         productTitle: snapshot.data?.value?.data?[i].name
      //                                 .toString() ??
      //                             'Null',
      //                         productPrice: snapshot
      //                                 .data?.value?.data?[i].purchasePrice
      //                                 .toString() ??
      //                             'Null',
      //                         productDiscount: snapshot
      //                                 .data?.value?.data?[i].discount
      //                                 .toString() ??
      //                             'Null',
      //                         productRating: snapshot.data?.value?.data?[i].id
      //                                 .toString() ??
      //                             'Null',
      //                         productImage: snapshot
      //                                 .data?.value?.data?[i].images?[0].image
      //                                 .toString() ??
      //                             'Null',
      //                         productDescription: snapshot
      //                                 .data?.value?.data?[i].description
      //                                 .toString() ??
      //                             'Null',
      //                       ),
      //                       onBookMarkPressed: () async {
      //                         try {
      //                           EasyLoading.show(status: 'Adding...');
      //                           final SharedPreferences prefs = await _prefs;
      //                           final wishlist =
      //                               await _apiManager.addToWishList(
      //                                   snapshot.data?.value?.data?[i].id
      //                                           .toString() ??
      //                                       'null',
      //                                   prefs.getString('token').toString());
      //                           if (wishlist.success == true) {
      //                             EasyLoading.showSuccess(
      //                                 wishlist.message.toString());
      //                           } else {
      //                             EasyLoading.showError(
      //                                 wishlist.message.toString());
      //                           }
      //                         } catch (e) {
      //                           toast(e.toString());
      //                         }
      //                       },
      //                     ).onTap(
      //                       () {
      //                         ProductDetails(
      //                           productId: snapshot.data?.value?.data?[i].id,
      //                         ).launch(context);
      //                       },
      //                       highlightColor: context.cardColor,
      //                     );
      //                   },
      //                 );
      //               } else {
      //                 return Center(child: CircularProgressIndicator());
      //               }
      //             }),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
