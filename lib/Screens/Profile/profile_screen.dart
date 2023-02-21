import 'package:event_app/Screens/Home%20Screen/wish_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

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
  late String strUserImage;

  Future<void> getToken() async {
    SharedPreferences preferences = await _prefs;

    setState(() {
      token = preferences.getString('token') ?? "";
      country = preferences.getInt('country');
      mobile = preferences.getString('phone');
      strUserImage = "https://cdn-icons-png.flaticon.com/512/149/149071.png";
    });
    final wish = await _apiManager.wishList(token);
    final value = await _apiManager.getProfileInfo(token);
    setState(() {
      wishLength = wish.value?.data?.length ?? 0;
    });
  }

  List<String> policyList = [
    'Contact Us',
    'Privacy Policy',
    'Return Policy',
    'Cancellation Policy',
  ];

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
                            snapshot.data!.value!.customer!.image
                                    .toString()
                                    .contains(".jpg")
                                ? snapshot.data!.value!.customer!.image
                                    .toString()
                                : strUserImage,
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
                        InkWell(
                          onTap: () {
                            const WishList().launch(context);
                          },
                          child: Column(
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
                        ),
                        InkWell(
                          onTap: () {
                            OrderList(
                              page: 1,
                            ).launch(context);
                          },
                          child: Column(
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
                        ),
                        InkWell(
                          onTap: () async {
                            final _url = Uri.parse(
                              'https://eventcart.co.in/faq',
                            );
                            if (!await launchUrl(
                              _url,
                              mode: LaunchMode.inAppWebView,
                            )) {
                              Fluttertoast.showToast(
                                msg: 'Could not launch $_url',
                              );
                            }
                          },
                          child: Column(
                            children: [
                              const Icon(
                                Icons.question_answer,
                                color: Colors.white,
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    onTap: () {
                      PersonalSettings(
                        userName:
                            snapshot.data?.value?.customer?.username ?? '',
                        firstName:
                            snapshot.data?.value?.customer?.firstName ?? '',
                        lastName:
                            snapshot.data?.value?.customer?.lastName ?? '',
                        mobile: snapshot.data?.value?.customer?.mobile ?? '',
                        email: snapshot.data?.value?.customer?.email ?? '',
                        imageUrl: snapshot.data?.value?.customer?.image ??
                            'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                      ).launch(context).then((value) {
                        setState(() {});
                      });
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
                  // ListTile(
                  //   onTap: () {
                  //     toast('Coming soon');
                  //   },
                  //   leading: Container(
                  //     padding: const EdgeInsets.all(5.0),
                  //     decoration: BoxDecoration(
                  //       color: const Color(0xFFFFF6ED),
                  //       borderRadius: BorderRadius.circular(10.0),
                  //     ),
                  //     child: const Icon(
                  //       Icons.price_change_outlined,
                  //       color: kMainColor,
                  //     ),
                  //   ),
                  //   title: Text(
                  //     'Coupon',
                  //     style: kTextStyle,
                  //   ),
                  //   trailing: const Icon(
                  //     Icons.arrow_forward_ios,
                  //     color: kGreyTextColor,
                  //   ),
                  // ),
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
                  // ListTile(
                  //   onTap: () {
                  //     toast('Coming soon');
                  //   },
                  //   leading: Container(
                  //     padding: const EdgeInsets.all(5.0),
                  //     decoration: BoxDecoration(
                  //       color: const Color(0xFFFFF6ED),
                  //       borderRadius: BorderRadius.circular(10.0),
                  //     ),
                  //     child: const Icon(
                  //       Icons.payment_outlined,
                  //       color: kMainColor,
                  //     ),
                  //   ),
                  //   title: Text(
                  //     'Payment Method',
                  //     style: kTextStyle,
                  //   ),
                  //   trailing: const Icon(
                  //     Icons.arrow_forward_ios,
                  //     color: kGreyTextColor,
                  //   ),
                  // ),
                  // ListTile(
                  //   onTap: () {
                  //     toast('Coming soon');
                  //   },
                  //   leading: Container(
                  //     padding: const EdgeInsets.all(5.0),
                  //     decoration: BoxDecoration(
                  //       color: const Color(0xFFFFF6ED),
                  //       borderRadius: BorderRadius.circular(10.0),
                  //     ),
                  //     child: const Icon(
                  //       Icons.language_rounded,
                  //       color: kMainColor,
                  //     ),
                  //   ),
                  //   title: Text(
                  //     'Language',
                  //     style: kTextStyle,
                  //   ),
                  //   trailing: const Icon(
                  //     Icons.arrow_forward_ios,
                  //     color: kGreyTextColor,
                  //   ),
                  // ),

                  ...List.generate(
                    4,
                    (index) => ListTile(
                      onTap: () async {
                        if (policyList[index] == 'Contact Us') {
                          final _url = Uri.parse(
                            'https://eventcart.co.in/page/support',
                          );
                          if (!await launchUrl(
                            _url,
                            mode: LaunchMode.inAppWebView,
                          )) {
                            Fluttertoast.showToast(
                              msg: 'Could not launch $_url',
                            );
                          }
                        } else if (policyList[index] == 'Privacy Policy') {
                          final _url = Uri.parse(
                            'https://eventcart.co.in/page/privacy-n-policy',
                          );
                          if (!await launchUrl(
                            _url,
                            mode: LaunchMode.inAppWebView,
                          )) {
                            Fluttertoast.showToast(
                              msg: 'Could not launch $_url',
                            );
                          }
                        } else if (policyList[index] == 'Return Policy') {
                          final _url = Uri.parse(
                            'https://eventcart.co.in/page/order-n-returns',
                          );
                          if (!await launchUrl(
                            _url,
                            mode: LaunchMode.inAppWebView,
                          )) {
                            Fluttertoast.showToast(
                              msg: 'Could not launch $_url',
                            );
                          }
                        } else if (policyList[index] == 'Cancellation Policy') {
                          final _url = Uri.parse(
                            'https://eventcart.co.in/page/cancellation_policy',
                          );
                          if (!await launchUrl(
                            _url,
                            mode: LaunchMode.inAppWebView,
                          )) {
                            Fluttertoast.showToast(
                              msg: 'Could not launch $_url',
                            );
                          }
                        }
                      },
                      leading: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF6ED),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Icon(
                          index == 0
                              ? Icons.contact_phone
                              : index == 1
                                  ? Icons.privacy_tip
                                  : index == 2
                                      ? Icons.u_turn_left
                                      : Icons.cancel,
                          color: kMainColor,
                        ),
                      ),
                      title: Text(
                        policyList[index],
                        style: kTextStyle,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: kGreyTextColor,
                      ),
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
                  ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.warning,
                                          color: kMainColor,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Warning',
                                          style: TextStyle(
                                            color: kMainColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Are you sure you want to proceed with your account deletion?',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.red),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                kMainColor,
                                              ),
                                            ),
                                            child: const Text(
                                              'Cancle',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              try {
                                                Navigator.pop(context);
                                                EasyLoading.show();
                                                final result = await _apiManager
                                                    .deleteProfile(
                                                  token: token,
                                                  mobileNumber: int.parse(
                                                      snapshot
                                                              .data
                                                              ?.value
                                                              ?.customer
                                                              ?.mobile ??
                                                          '0000000000'),
                                                  email: snapshot.data?.value
                                                      ?.customer?.email,
                                                  uid: (snapshot.data?.value
                                                          ?.customer?.id ??
                                                      0000000000),
                                                  reason: null,
                                                );
                                                if (result) {
                                                  // Navigator.pop(context);
                                                  await logout();
                                                } else {
                                                  // Navigator.pop(context);
                                                  EasyLoading.showError(
                                                    'Failed to delete your account!\nPlease try again later.',
                                                  );
                                                }
                                              } catch (error, stackTrace) {
                                                log(stackTrace.toString());
                                                log(error.toString());
                                                Navigator.pop(context);
                                                EasyLoading.showError(
                                                  error.toString(),
                                                );
                                              }
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                kMainColor,
                                              ),
                                            ),
                                            child: const Text(
                                              'Delete Account',
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    leading: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF6ED),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(
                        Icons.delete,
                        color: kMainColor,
                      ),
                    ),
                    title: Text(
                      'Delete Account',
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
