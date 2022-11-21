import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../GlobalComponents/category_data.dart';
import '../../GlobalComponents/product_data.dart';
import '../../Models/home_model.dart';
import './best_deals.dart';
import './category_list.dart';
import './category_product.dart';
import './popular_products.dart';
import './product_details.dart';
import './search_result.dart';
import '../../Services/api_manager.dart';
import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';
import 'home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  final ApiManager _apiManager = ApiManager();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;
  HomeModel? homeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: kBlackColor),
        /*leading: Image.asset('images/drawer.png'),*/
        title: Image.asset('images/logo.png', width: 115),
        actions: [
          Image.asset('images/notification.png'),
        ],
      ),
      body: FutureBuilder<HomeModel>(
          future: _apiManager.getHome(),
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
                      'No product found in this shop',
                      style: kTextStyle.copyWith(
                          color: kTitleColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ButtonGlobal(
                        buttontext: 'Reload App',
                        buttonDecoration:
                            kButtonDecoration.copyWith(color: kMainColor),
                        onPressed: () => const Home().launch(context)),
                  ],
                );
              }
              return RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: () {
                  return Future(() {
                    setState(() {});
                  });
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF7F5F2),
                                    borderRadius: BorderRadius.circular(12)),
                                child: AppTextField(
                                  controller: searchController,
                                  textFieldType: TextFieldType.NAME,
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(
                                      Icons.search,
                                      color: kTitleColor,
                                    ).onTap(() => SearchResult(
                                          query: searchController.text,
                                          page: 1,
                                        ).launch(context)),
                                    border: InputBorder.none,
                                    fillColor: const Color(0xFFF7F5F2),
                                    contentPadding: const EdgeInsets.all(10.0),
                                    hintText: 'Search',
                                  ),
                                  onFieldSubmitted: (str) {
                                    SearchResult(
                                      query: str,
                                      page: 1,
                                    ).launch(context);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Center(
                        child: CarouselSlider.builder(
                          itemCount: snapshot.data?.value?.banners?.length ?? 0,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            return Container(
                              width: context.width(),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    snapshot.data?.value?.banners![itemIndex]
                                            .image
                                            .toString() ??
                                        '',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: context.width() / 2,
                                        child: Text(
                                          snapshot
                                                  .data
                                                  ?.value
                                                  ?.banners![itemIndex]
                                                  .subTitle ??
                                              '',
                                          style: kTextStyle.copyWith(
                                              color: kWhiteColor,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 2,
                                        )),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        /* color: kMainColor.withOpacity(0.5),*/
                                      ),
                                      child: Text(
                                        snapshot
                                                .data
                                                ?.value
                                                ?.banners![itemIndex]
                                                .offerTitle ??
                                            '',
                                        style: kTextStyle.copyWith(
                                            color: kWhiteColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).onTap(
                              () {
                                CategoryProduct(
                                  catName: snapshot.data?.value
                                          ?.banners![itemIndex].subTitle ??
                                      "NA",
                                  subCatModel: HomeModel(),
                                  clickIndex: 0,
                                  catId: snapshot.data?.value
                                          ?.banners![itemIndex].categoryId ??
                                      2,
                                  page: 1,
                                ).launch(context);
                              },
                              highlightColor: context.cardColor,
                            );
                          },
                          options: CarouselOptions(
                            height: 200,
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
                      //Banner Slider
                      const SizedBox(
                        height: 20.0,
                      ),
                      //Categories Section
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Categories',
                              style: kTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                CategoryList(
                                  subCatModel: snapshot.data,
                                ).launch(context);
                              },
                              child: Text(
                                'See All',
                                style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      HorizontalList(
                        spacing: 0,
                        // itemCount: snapshot.data?.value?.category?.data?.length ?? 10,
                        itemCount: 2,
                        itemBuilder: (_, i) {
                          return CategoryCard(
                            categoryData: CategoryData(
                              catTitle: snapshot
                                      .data?.value?.category?.data?[i].name ??
                                  'Null',
                              catIcon: snapshot
                                      .data?.value?.category?.data?[i].banner
                                      .toString() ??
                                  'https://i.imgur.com/FPAXyqE.jpeg',
                            ),
                          ).onTap(
                            () {
                              print(snapshot.data?.value?.category?.data?[i]
                                  .subcat?.length);
                              CategoryProduct(
                                subCatModel: snapshot.data,
                                clickIndex: i,
                                catName: snapshot
                                        .data?.value?.category?.data?[i].name ??
                                    "NA",
                                catId: snapshot
                                        .data?.value?.category?.data?[i].id ??
                                    2,
                                /*subCat: snapshot.data?.value?.category?.data?[i].subcat,*/
                                page: 1,
                              ).launch(context);
                            },
                            highlightColor: context.cardColor,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      //Flash Deals Section
                      /* Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Flash Sales',
                              style: kTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            SlideCountdownSeparated(
                              duration: const Duration(hours: 2),
                              decoration: BoxDecoration(
                                  color: kTitleColor,
                                  borderRadius: BorderRadius.circular(4.0)),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                // const CategoryScreen().launch(context);
                              },
                              child: Text(
                                'See All',
                                style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                              ).visible(false),
                            ),
                          ],
                        ),
                      ).visible(snapshot.data?.value?.flashSale?.isNotEmpty ?? false),
                      HorizontalList(
                        spacing: 10,
                        itemCount:
                            snapshot.data?.value?.flashSale?.length ?? 10,
                        itemBuilder: (_, i) {
                          return DiscountProductCard(
                            productData: ProductData(
                              productTitle: snapshot
                                      .data?.value?.flashSale![i].name
                                      .toString() ??
                                  'Null',
                              productPrice: snapshot
                                      .data?.value?.flashSale![i].purchasePrice
                                      .toString() ??
                                  'Null',
                              productDiscount: snapshot
                                      .data?.value?.flashSale![i].discount
                                      .toString() ??
                                  'Null',
                              productRating: snapshot
                                      .data?.value?.flashSale![i].id
                                      .toString() ??
                                  'Null',
                              productImage: snapshot.data?.value?.flashSale![i]
                                      .images?[0].image
                                      .toString() ??
                                  'Null',
                              productDescription: snapshot
                                      .data?.value?.flashSale![i].description
                                      .toString() ??
                                  'Null',
                            ),
                            onBookMarkPressed: () async {
                              try {
                                EasyLoading.show(status: 'Adding...');
                                final SharedPreferences prefs = await _prefs;
                                final wishlist =
                                    await _apiManager.addToWishList(
                                        snapshot.data?.value?.flashSale![i].id
                                                .toString() ??
                                            'null',
                                        prefs.getString('token').toString());
                                if (wishlist.success == true) {
                                  EasyLoading.showSuccess(wishlist.message.toString());
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()),
                                      ModalRoute.withName("/Home"));

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
                                productId:
                                    snapshot.data?.value?.flashSale![i].id,
                              ).launch(context);
                            },
                            highlightColor: context.cardColor,
                          );
                        },
                      ),*/
                      const SizedBox(
                        height: 10.0,
                      ),
                      //Best Deals Section
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Best Selling',
                              style: kTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                const BestDeals().launch(context);
                              },
                              child: Text(
                                'See All',
                                style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      HorizontalList(
                        spacing: 0,
                        itemCount: 2,
                        itemBuilder: (_, i) {
                          return ProductCard(
                            productData: ProductData(
                              productTitle: snapshot
                                      .data?.value?.trendsProducts![i].name
                                      .toString() ??
                                  'Null',
                              productPrice: snapshot
                                      .data?.value?.trendsProducts![i].salePrice
                                      .toString() ??
                                  'Null',
                              productDiscount: snapshot
                                      .data?.value?.trendsProducts![i].unitPrice
                                      .toString() ??
                                  'Null',
                              productRating: snapshot
                                      .data?.value?.trendsProducts![i].id
                                      .toString() ??
                                  'Null',
                              productImage: snapshot.data?.value
                                      ?.trendsProducts![i].images?[0].image
                                      .toString() ??
                                  'Null',
                              productDescription: snapshot.data?.value
                                      ?.trendsProducts![i].description
                                      .toString() ??
                                  'Null',
                            ),
                            onBookMarkPressed: () async {
                              try {
                                EasyLoading.show(status: 'Adding...');
                                final SharedPreferences prefs = await _prefs;
                                final wishlist =
                                    await _apiManager.addToWishList(
                                        snapshot.data?.value?.trendsProducts![i]
                                                .id
                                                .toString() ??
                                            'null',
                                        prefs.getString('token').toString());
                                if (wishlist.success == true) {
                                  EasyLoading.showSuccess(
                                      wishlist.message.toString());
                                } else {
                                  EasyLoading.showError('Already Added');
                                }
                              } catch (e) {
                                toast(e.toString());
                              }
                            },
                          ).onTap(
                            () {
                              ProductDetails(
                                productId:
                                    snapshot.data?.value?.trendsProducts![i].id,
                              ).launch(context);
                            },
                            highlightColor: context.cardColor,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Popular Products',
                              style: kTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                const PopularProduct().launch(context);
                              },
                              child: Text(
                                'See All',
                                style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.7,
                            crossAxisCount: 2,
                            mainAxisSpacing: 5.0,
                          ),
                          itemCount:
                              snapshot.data?.value?.popularProducts?.length ??
                                  10,
                          itemBuilder: (_, i) {
                            return ProductCard(
                              productData: ProductData(
                                productTitle: snapshot
                                        .data?.value?.popularProducts?[i].name
                                        .toString() ??
                                    'Null',
                                productPrice: snapshot.data?.value
                                        ?.popularProducts?[i].salePrice
                                        .toString() ??
                                    'Null',
                                productDiscount: snapshot.data?.value
                                        ?.popularProducts?[i].unitPrice
                                        .toString() ??
                                    'Null',
                                productRating: snapshot
                                        .data?.value?.popularProducts?[i].id
                                        .toString() ??
                                    'Null',
                                productImage: snapshot.data?.value
                                        ?.popularProducts?[i].images?[0].image
                                        .toString() ??
                                    'Null',
                                productDescription: snapshot.data?.value
                                        ?.popularProducts?[i].description
                                        .toString() ??
                                    'Null',
                              ),
                              onBookMarkPressed: () async {
                                try {
                                  EasyLoading.show(status: 'Adding...');
                                  final SharedPreferences prefs = await _prefs;
                                  final wishlist =
                                      await _apiManager.addToWishList(
                                          snapshot.data?.value
                                                  ?.popularProducts?[i].id
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
                                  productId: snapshot
                                      .data?.value?.popularProducts?[i].id,
                                ).launch(context);
                              },
                              highlightColor: context.cardColor,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

// ignore: must_be_immutable
class DiscountProductCard extends StatelessWidget {
  DiscountProductCard(
      {Key? key, required this.productData, required this.onBookMarkPressed})
      : super(key: key);
  final ProductData productData;

  // ignore: prefer_typing_uninitialized_variables
  var onBookMarkPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 200.0,
        minWidth: 150.0,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                  ),
                  child: Image.network(
                    productData.productImage,
                    width: 150,
                    height: 150.0,
                  ),
                ),
                Image.asset('images/badge.png'),
                Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: Text(
                    '-${productData.productDiscount.toInt() / 100}',
                    style:
                        kTextStyle.copyWith(color: kWhiteColor, fontSize: 10.0),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
                productData.productTitle,
                style: kTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: Row(
                children: [
                  Text(
                    currencyIcon + productData.productPrice,
                    style:
                        kTextStyle.copyWith(color: kMainColor, fontSize: 18.0),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    currencyIcon + productData.productPrice,
                    style: kTextStyle.copyWith(
                        color: kGreyTextColor,
                        fontSize: 12.0,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  ProductCard(
      {Key? key, required this.productData, required this.onBookMarkPressed})
      : super(key: key);
  final ProductData productData;

  // ignore: prefer_typing_uninitialized_variables
  var onBookMarkPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10, left: 10),
          child: Card(
            elevation: 0.0,
            color: kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      child: Image(
                        image: CachedNetworkImageProvider(
                            productData.productImage),
                        height: 160.0,
                        width: 160,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: const CircleAvatar(
                        backgroundColor: kWhiteColor,
                        radius: 15.0,
                        child: Center(
                            child: Icon(
                          Icons.favorite_border_outlined,
                          color: kMainColor,
                        )),
                      ).onTap(onBookMarkPressed),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  child: Container(
                    width: 150,
                    child: Text(
                      productData.productTitle,
                      style: kTextStyle,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
                  child: Row(
                    children: [
                      RatingBarWidget(
                        activeColor: const Color(0xFFFACA51),
                        onRatingChanged: null,
                        rating: productData.productRating.toDouble(),
                        size: 12.0,
                      ),
                      Text(
                        '(${productData.productRating})',
                        style: kTextStyle.copyWith(
                            color: kGreyTextColor, fontSize: 10.0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                  child: Row(
                    children: [
                      Text(
                        currencyIcon + productData.productPrice,
                        style: kTextStyle.copyWith(
                            color: kMainColor, fontSize: 18.0),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        currencyIcon + productData.productDiscount,
                        style: kTextStyle.copyWith(
                            color: kGreyTextColor,
                            fontSize: 12.0,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.categoryData}) : super(key: key);
  final CategoryData categoryData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Card(
        elevation: 0.0,
        color: kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  child: Image(
                    image: CachedNetworkImageProvider(categoryData.catIcon),
                    height: 160.0,
                    width: 160,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Container(
                width: 150,
                child: Text(
                  categoryData.catTitle,
                  style: kTextStyle,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    /*return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Image.network(
            categoryData.catIcon,
            height: 90.0,
            width: 90.0,
            fit: BoxFit.cover,
          ),
          // SvgPicture.network(categoryData.catIcon),
          const SizedBox(
            height: 5.0,
          ),
          SizedBox(
            width: 80.0,
            child: Text(
              categoryData.catTitle,
              style: kTextStyle,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );*/
  }
}
