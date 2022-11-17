import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_app/Screens/Home%20Screen/home.dart';
import 'package:event_app/Screens/Home%20Screen/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/product_data.dart';
import '../../Models/home_model.dart';
import '../../Models/trends_model.dart';
import './product_details.dart';
import '../../Services/api_manager.dart';
import '../../constant.dart';
import 'home_screen.dart';

class CategoryProduct extends StatefulWidget {
   CategoryProduct(
      {Key? key,
      required this.subCatModel,
      required this.clickIndex,
      required this.catId,
      required this.page,
      required this.catName})
      : super(key: key);
   int catId, page,clickIndex;
   String catName;
   HomeModel? subCatModel;

  @override
  _CategoryProductState createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  int selectedIndex = 0;
  int subCatListSize = 0;
  String strProdcuts = '';
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {

    getProduct();
    super.initState();
  }

  bool isLoading = false;
  getProduct() async {
    subCatListSize=widget.subCatModel?.value?.category?.data?[widget.clickIndex].subcat?.length??0;
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
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()),
                  ModalRoute.withName("/Home"));
            }),
        title: Text(
          widget.catName,
          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if(subCatListSize!=0)
              Visibility(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30,bottom: 10),
                          child: Text(
                            "Sub Category",
                            style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      /*Sub Cat work*/
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.7,
                          crossAxisCount: 2,
                          mainAxisSpacing: 1.0,
                        ),
                        itemCount: widget.subCatModel?.value?.category?.data?[widget.clickIndex].subcat?.length ?? 10,
                        itemBuilder: (_, i) {
                          return GestureDetector(
                            onTap: ()async{

                              widget.catId=widget.subCatModel?.value?.category?.data?[widget.clickIndex].subcat?[i].id??0;
                              widget.page=1;
                              final value = await _apiManager.categoryProduct(widget.catId, widget.page);
                              Fluttertoast.showToast(msg: "Please wait products are loading..");
                              setState(() {
                                strProdcuts='Products';
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 20,left: 20),
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

                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                          ),
                                          child: Image(
                                            image: CachedNetworkImageProvider(widget.subCatModel?.value?.category?.data?[widget.clickIndex].subcat?[i].icon??''),
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
                                          widget.subCatModel?.value?.category?.data?[widget.clickIndex].subcat?[i].name??'Null',
                                          style: kTextStyle,
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )
              ),
               Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30,bottom: 5),
                child: Text(
                  strProdcuts,
                  style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
             Container(
              padding: const EdgeInsets.all(10.0),
              child: FutureBuilder<TrendsModel>(
                  future: _apiManager.categoryProduct(widget.catId, widget.page),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
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
                                    final SharedPreferences prefs = await _prefs;
                                    final wishlist = await _apiManager.addToWishList(snapshot.data?.value?.data![i].id.toString() ?? 'null', prefs.getString('token').toString());
                                    if (wishlist.success == true) {
                                      EasyLoading.showSuccess(wishlist.message.toString());

                                    } else {
                                      print(wishlist.message.toString());
                                      if(wishlist.message.toString()=="Unprocessable Content"){
                                        EasyLoading.showError("Product Already Added");
                                      }
                                      else{
                                        EasyLoading.showError(wishlist.message.toString());
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
                                  subCatModel: widget.subCatModel,
                                  clickIndex: widget.clickIndex,
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
