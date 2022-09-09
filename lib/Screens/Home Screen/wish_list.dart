import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/product_data.dart';
import '../../Models/wish_list_model.dart';
import '../../Screens/Authentication/signin.dart';
import './product_details.dart';
import '../../GlobalComponents/button_global.dart';
import '../../Services/api_manager.dart';
import '../../constant.dart';
import '../Authentication/sign_up.dart';
import 'home.dart';

class WishList extends StatefulWidget {
  VoidCallback callback;
  WishList({Key? key, required this.callback}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? token;
  String? username;
  Future<void> getToken() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      username = prefs.getString('username') ?? 'Guest';
      token = prefs.getString('token');
    });
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0.0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back).onTap(() => widget.callback()),
        iconTheme: const IconThemeData(color: kBlackColor),
        title: Text(
          'Wishlisted products',
          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future(() {
            EasyLoading.showSuccess("Please wait..");
            setState(() {});
          });
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 4.0,
              ),
              Text(
                'Swipe down to refresh page',
                style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: FutureBuilder<WishListModel>(
                    future: _apiManager.wishList(token ?? ''),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        if (snapshot.data!.value!.data!.isEmpty) {
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
                                'No Items in the wishlist',
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
                                  buttonDecoration: kButtonDecoration.copyWith(
                                      color: kMainColor),
                                  onPressed: () =>
                                      const Home().launch(context)),
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
                          itemCount: snapshot.data?.value?.data?.length ?? 10,
                          itemBuilder: (_, i) {
                            return WishListProductCard(
                              productData: ProductData(
                                productTitle: snapshot
                                        .data?.value?.data![i].product?.name
                                        .toString() ??
                                    'Null',
                                productPrice: snapshot.data?.value?.data![i]
                                        .product?.purchasePrice
                                        .toString() ??
                                    'Null',
                                productDiscount: snapshot
                                        .data?.value?.data![i].product?.discount
                                        .toString() ??
                                    'Null',
                                productRating: snapshot
                                        .data?.value?.data![i].product?.id
                                        .toString() ??
                                    'Null',
                                productImage: snapshot.data?.value?.data![i]
                                        .product?.images?[0].image
                                        .toString() ??
                                    'Null',
                                productDescription: snapshot.data?.value
                                        ?.data![i].product?.description
                                        .toString() ??
                                    'Null',
                              ),
                              onBookMarkPressed: () async {
                                try {
                                  EasyLoading.show(status: 'Removing...');
                                  final SharedPreferences prefs = await _prefs;
                                  final wishlist =
                                      await _apiManager.removeWishList(
                                          prefs.getString('token').toString(),
                                          snapshot.data?.value?.data![i].id
                                                  .toString() ??
                                              'null');
                                  if (wishlist.success == true) {
                                    setState(() {});
                                    EasyLoading.showSuccess(
                                        wishlist.message.toString());
                                  } else {
                                    setState(() {});
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
                                      .data?.value?.data![i].product?.id,
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
              ).visible(username != 'Guest'),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: RichText(
                    text: TextSpan(
                      style: kTextStyle.copyWith(
                          color: kMainColor, fontSize: 30.0),
                      children: [
                        TextSpan(
                            text: 'Please ',
                            style: kTextStyle.copyWith(color: kTitleColor)),
                        WidgetSpan(
                            child: Text(
                          'Sign In ',
                          style: kTextStyle.copyWith(
                              color: kMainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ).onTap(() {
                          const SignIn().launch(context, isNewTask: true);
                        })),
                        TextSpan(
                          text: 'or ',
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        WidgetSpan(
                            child: Text(
                          'Sign Up ',
                          style: kTextStyle.copyWith(
                              color: kMainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ).onTap(() {
                          const SignUp().launch(context, isNewTask: true);
                        })),
                        TextSpan(
                            text: 'to See Wishlist',
                            style: kTextStyle.copyWith(color: kTitleColor)),
                      ],
                    ),
                    textScaleFactor: 0.5,
                  ),
                ),
              ).visible(username == 'Guest'),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class WishListProductCard extends StatelessWidget {
  WishListProductCard(
      {Key? key, required this.productData, required this.onBookMarkPressed})
      : super(key: key);
  final ProductData productData;

  // ignore: prefer_typing_uninitialized_variables
  var onBookMarkPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
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
                child: Image(
                  image: CachedNetworkImageProvider(productData.productImage),
                  height: 140.0,
                  width: context.width() / 2,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: const CircleAvatar(
                  backgroundColor: kWhiteColor,
                  radius: 15.0,
                  child: Center(
                      child: Icon(
                    Icons.favorite,
                    color: kMainColor,
                  )),
                ).onTap(onBookMarkPressed),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              productData.productTitle,
              style: kTextStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
            child: Row(
              children: [
                RatingBarWidget(
                  onRatingChanged: null,
                  rating: productData.productRating.toDouble(),
                  size: 12.0,
                ),
                Text(
                  '\u{20B9}${productData.productRating}',
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
                  '\u{20B9}' + productData.productPrice,
                  style: kTextStyle.copyWith(color: kMainColor, fontSize: 18.0),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  '\u{20B9}' + productData.productPrice,
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
    );
  }
}
