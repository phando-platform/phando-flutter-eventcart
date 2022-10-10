import 'package:event_app/GlobalComponents/button_global.dart';
import 'package:event_app/Screens/Home%20Screen/home.dart';
import 'package:event_app/Screens/Home%20Screen/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/product_data.dart';
import '../../Models/trends_model.dart';
import './product_details.dart';
import '../../Services/api_manager.dart';
import '../../constant.dart';
import 'home_screen.dart';

class CategoryProduct extends StatefulWidget {
  const CategoryProduct(
      {Key? key,
      required this.catId,
      required this.page,
      required this.catName})
      : super(key: key);
  final int catId, page;
  final String catName;

  @override
  _CategoryProductState createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  int selectedIndex = 0;
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    getProduct();
    super.initState();
  }

  bool isLoading = false;
  getProduct() async {
    final value = await _apiManager.categoryProduct(widget.catId, widget.page);
    toast(value.message.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: kBlackColor),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()),
              //     ModalRoute.withName("/Home"));
            }),
        title: Text(
          widget.catName,
          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HorizontalList(
            //   spacing: 0,
            //   itemCount: catData.length,
            //   itemBuilder: (_, i) {
            //     return Padding(
            //       padding: const EdgeInsets.all(5.0),
            //       child: Container(
            //         padding: const EdgeInsets.all(10.0),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10.0),
            //           border: Border.all(color: kGreyTextColor.withOpacity(0.2),),
            //           color: selectedIndex == i ? kMainColor : kWhiteColor,
            //         ),
            //         child: Text(catData[i].catTitle,style: kTextStyle.copyWith(color: selectedIndex == i ? kWhiteColor : kTitleColor,),),
            //       ).onTap((){
            //         setState(() {
            //           selectedIndex = i;
            //         });
            //       }),
            //     );
            //   },
            // ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: FutureBuilder<TrendsModel>(
                  future:
                      _apiManager.categoryProduct(widget.catId, widget.page),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      if (snapshot.data?.value?.data?.length == 0) {
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
                              'No Category found',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            // ButtonGlobal(
                            //     buttontext: 'Reload App',
                            //     buttonDecoration: kButtonDecoration.copyWith(
                            //         color: kMainColor),
                            //     onPressed: () => const Home().launch(context)),
                          ],
                        );
                      }
                      return Column(
                        children: [
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.7,
                              crossAxisCount: 2,
                              mainAxisSpacing: 5.0,
                            ),
                            itemCount: snapshot.data?.value?.data?.length ?? 10,
                            itemBuilder: (_, i) {
                              return ProductCard(
                                productData: ProductData(
                                  productTitle: snapshot
                                          .data?.value?.data![i].name
                                          .toString() ??
                                      'Null',
                                  productPrice: snapshot
                                          .data?.value?.data![i].salePrice
                                          .toString() ??
                                      'Null',
                                  productDiscount: snapshot
                                          .data?.value?.data![i].unitPrice
                                          .toString() ??
                                      'Null',
                                  productRating: snapshot
                                          .data?.value?.data![i].id
                                          .toString() ??
                                      'Null',
                                  productImage: snapshot.data?.value?.data![i]
                                          .images?[0].image
                                          .toString() ??
                                      'Null',
                                  productDescription: snapshot
                                          .data?.value?.data![i].description
                                          .toString() ??
                                      'Null',
                                ),
                                onBookMarkPressed: () async {
                                  try {
                                    EasyLoading.show(status: 'Adding...');
                                    final SharedPreferences prefs =
                                        await _prefs;
                                    final wishlist =
                                        await _apiManager.addToWishList(
                                            snapshot.data?.value?.data![i].id
                                                    .toString() ??
                                                'null',
                                            prefs
                                                .getString('token')
                                                .toString());
                                    if (wishlist.success == true) {
                                      EasyLoading.showSuccess(
                                          wishlist.message.toString());
                                    } else {
                                      print(wishlist.message.toString());
                                      if (wishlist.message.toString() ==
                                          "Unprocessable Content") {
                                        EasyLoading.showError(
                                            "Product Already Added");
                                      } else {
                                        EasyLoading.showError(
                                            wishlist.message.toString());
                                      }
                                    }
                                  } catch (e) {
                                    toast(e.toString());
                                  }
                                },
                              ).onTap(
                                () {
                                  ProductDetails(
                                    productId:
                                        snapshot.data?.value?.data![i].id,
                                  ).launch(context);
                                },
                                highlightColor: context.cardColor,
                              );
                            },
                          ),
                          GestureDetector(
                              onTap: () {
                                int page = widget.page + 1;
                                CategoryProduct(
                                  catName: widget.catName,
                                  page: page,
                                  catId: widget.catId,
                                ).launch(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Show More Products',
                                  style:
                                      kTextStyle.copyWith(color: kTitleColor),
                                ).visible(snapshot.data!.value!.lastPage !=
                                    widget.page),
                              )),
                        ],
                      );
                    } else {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: kMainColor,
                      ));
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
