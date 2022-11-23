import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Models/profile_model.dart';
import './order_list.dart';
import '../../Screens/Profile/personal_settings.dart';
import '../../constant.dart';
import '../../GlobalComponents/button_global.dart';
import '../../Services/api_manager.dart';
import '../Authentication/add_billing.dart';
import '../Authentication/signin.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String token = '';
  int wishLength = 0;
  int? country;
  String? mobile;
  String? strUserImage;

  Future<void> getToken() async {
    SharedPreferences preferences = await _prefs;

    setState(() {
      token = preferences.getString('token') ?? "";
      country = preferences.getInt('country');
      mobile = preferences.getString('phone');
      strUserImage = preferences.getString('userImage') ??
          "https://cdn-icons-png.flaticon.com/512/149/149071.png";
      print(country);
      print(mobile);
    });
    final wish = await _apiManager.wishList(token);
    final value = await _apiManager.getProfileInfo(token);
    setState(() {
      wishLength = wish.value?.data?.length ?? 0;
    });
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  Future logout() async {
    final SharedPreferences prefsOut = await _prefs;
    prefsOut.setBool('autoLogin', false);
    prefsOut.setString('token', '');
    prefsOut.setString('username', '');
    const SignIn().launch(context, isNewTask: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Profile',
          style: kTextStyle.copyWith(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: FutureBuilder<ProfileModel>(
        future: _apiManager.getProfileInfo(token),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.value?.shipping == null) {
              return Center(
                child: SizedBox(
                    height: 60.0,
                    child: ButtonGlobal(
                        buttontext: 'Add Shipping Id',
                        buttonDecoration:
                            kButtonDecoration.copyWith(color: kMainColor),
                        onPressed: () => AddBilling(
                              country: country,
                              mobile: mobile,
                              status: 3,
                            ).launch(context))),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: context.width(),
                    padding: const EdgeInsets.all(20.0),
                    color: kMainColor,
                    child: Column(
                      children: [
                        ClipOval(
                          child: Image.network(
                            strUserImage ?? "strUserImage",
                            fit: BoxFit.cover,
                            width: 90.0,
                            height: 90.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          snapshot.data?.value?.customer?.firstName ??
                              ' ' ' ' +
                                  snapshot.data!.value!.customer!.lastName!,
                          style: kTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          snapshot.data!.value!.customer!.mobile!,
                          style: kTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    width: context.width(),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFE911B),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              wishLength.toString(),
                              style: kTextStyle.copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'WishList',
                              style: kTextStyle.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              snapshot.data!.value!.orders!.length.toString(),
                              style: kTextStyle.copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Orders',
                              style: kTextStyle.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '05',
                              style: kTextStyle.copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'FAQ',
                              style: kTextStyle.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'General Settings',
                      style: kTextStyle,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      PersonalSettings(
                        firstName:
                            snapshot.data?.value?.customer?.firstName ?? '',
                        lastName:
                            snapshot.data?.value?.customer?.lastName ?? '',
                        mobile: snapshot.data?.value?.customer?.mobile ?? '',
                        email: snapshot.data?.value?.customer?.email ?? '',
                      ).launch(context);
                    },
                    leading: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF6ED),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(
                        Icons.settings_outlined,
                        color: kMainColor,
                      ),
                    ),
                    title: Text(
                      'Personal Setting',
                      style: kTextStyle,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: kGreyTextColor,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      toast('Coming soon');
                    },
                    leading: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF6ED),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(
                        Icons.price_change_outlined,
                        color: kMainColor,
                      ),
                    ),
                    title: Text(
                      'Coupon',
                      style: kTextStyle,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: kGreyTextColor,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      OrderList(
                        page: 1,
                      ).launch(context);
                    },
                    leading: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF6ED),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: kMainColor,
                      ),
                    ),
                    title: Text(
                      'My Orders',
                      style: kTextStyle,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: kGreyTextColor,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      toast('Coming soon');
                    },
                    leading: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF6ED),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(
                        Icons.payment_outlined,
                        color: kMainColor,
                      ),
                    ),
                    title: Text(
                      'Payment Method',
                      style: kTextStyle,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: kGreyTextColor,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      toast('Coming soon');
                    },
                    leading: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF6ED),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(
                        Icons.language_rounded,
                        color: kMainColor,
                      ),
                    ),
                    title: Text(
                      'Language',
                      style: kTextStyle,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: kGreyTextColor,
                    ),
                  ),
                  ListTile(
                    onTap: () => logout(),
                    leading: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF6ED),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(
                        Icons.logout,
                        color: kMainColor,
                      ),
                    ),
                    title: Text(
                      'Logout',
                      style: kTextStyle,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: kGreyTextColor,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: SizedBox(
                  height: 60.0,
                  child: ButtonGlobal(
                      buttontext: 'Add Shipping Id',
                      buttonDecoration:
                          kButtonDecoration.copyWith(color: kMainColor),
                      onPressed: () => AddBilling(
                              country: country, mobile: mobile, status: 3)
                          .launch(context))),
            );

            /*return const Center(

              child: CircularProgressIndicator(),
            );*/
          }
        },
      ),
    );
  }
}
