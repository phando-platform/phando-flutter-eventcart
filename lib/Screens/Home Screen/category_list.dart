import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Models/category_model.dart';
import '../../GlobalComponents/button_global.dart';
import '../../Services/api_manager.dart';
import '../../constant.dart';
import 'category_product.dart';
import 'home.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  void initState() {
    super.initState();
  }

  final ApiManager _apiManager = ApiManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Categories',
          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<CategoryModel>(
          future: _apiManager.categoryList(),
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
                      'No Category found',
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
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data?.value?.data?.length ?? 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundColor: index % 2 == 0
                              ? kMainColor.withOpacity(0.1)
                              : Colors.green.withOpacity(0.1),
                          child: SvgPicture.network(
                            snapshot.data?.value?.data?[index].icon
                                    .toString() ??
                                'https://i.imgur.com/FPAXyqE.jpeg',
                            height: 30,
                            width: 30,
                            color: kMainColor,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          snapshot.data?.value?.data?[index].name.toString() ??
                              'Null',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                  ).onTap(
                    () {
                      CategoryProduct(
                        catName: snapshot.data?.value?.data?[index].name
                                .toString() ??
                            'NA',
                        catId: snapshot.data?.value?.data?[index].id ?? 2,
                        page: 1,
                      ).launch(context);
                    },
                    highlightColor: context.cardColor,
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
