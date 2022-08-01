import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/product_data.dart';
import './product_details.dart';
import '../../GlobalComponents/button_global.dart';
import '../../Models/popular_products_model.dart';
import '../../Services/api_manager.dart';
import '../../constant.dart';
import 'home.dart';
import 'home_screen.dart';

class PopularProduct extends StatefulWidget {
  const PopularProduct({Key? key}) : super(key: key);

  @override
  _PopularProductState createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
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
          'Popular products',
          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: FutureBuilder<PopularProductsModel>(
                  future: _apiManager.popularList(),
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
                              'No item found as Popular Products',
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
                                buttonDecoration: kButtonDecoration.copyWith(
                                    color: kMainColor),
                                onPressed: () => const Home().launch(context)),
                          ],
                        );
                      }
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.7,
                          crossAxisCount: 2,
                          mainAxisSpacing: 5.0,
                        ),
                        itemCount: snapshot.data?.value?.length ?? 10,
                        itemBuilder: (_, i) {
                          return ProductCard(
                            productData: ProductData(
                              productTitle:
                                  snapshot.data?.value?[i].name.toString() ??
                                      'Null',
                              productPrice: snapshot
                                      .data?.value?[i].purchasePrice
                                      .toString() ??
                                  'Null',
                              productDiscount: snapshot.data?.value?[i].discount
                                      .toString() ??
                                  'Null',
                              productRating:
                                  snapshot.data?.value?[i].id.toString() ??
                                      'Null',
                              productImage: snapshot
                                      .data?.value?[i].images?[0].image
                                      .toString() ??
                                  'Null',
                              productDescription: snapshot
                                      .data?.value?[i].description
                                      .toString() ??
                                  'Null',
                            ),
                            onBookMarkPressed: () async {
                              try {
                                EasyLoading.show(status: 'Adding...');
                                final SharedPreferences prefs = await _prefs;
                                final wishlist =
                                    await _apiManager.addToWishList(
                                        snapshot.data?.value?[i].id
                                                .toString() ??
                                            'null',
                                        prefs.getString('token').toString());
                                if (wishlist.success == true) {
                                  EasyLoading.showSuccess(
                                      wishlist.message.toString());
                                } else {
                                  EasyLoading.showError(
                                      wishlist.message.toString());
                                }
                              } catch (e) {
                                toast(e.toString());
                              }
                            },
                          ).onTap(
                            () {
                              ProductDetails(
                                productId: snapshot.data?.value?[i].id,
                              ).launch(context);
                            },
                            highlightColor: context.cardColor,
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
