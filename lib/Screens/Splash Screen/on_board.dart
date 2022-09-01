import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

import '../../../GlobalComponents/button_global.dart';
import '../Authentication/signin.dart';
import '../Home%20Screen/home.dart';
import '../../constant.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;
  String buttonText = 'Next';
  bool isLastPage = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setToken() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      prefs.setString('username', 'Guest');
      prefs.setString('token', 'Not Found');
    });
    const Home().launch(context);
  }

  List<Map<String, dynamic>> sliderList = [
    {
      "icon": 'images/new_onboard_1.png',
      "title": 'Welcome to Event App',
      "description": 'Lorem ipsum dolor sit amet, consectetuer adipisci elit',
    },
    {
      "icon": 'images/new_onboard_2.png',
      "title": 'Find Your Fa vorite Item Here',
      "description": 'Lorem ipsum dolor sit amet, consectetuer adipisci elit',
    },
    {
      "icon": 'images/new_onboard_3.png',
      "title": 'Best Shopping Experience',
      "description": 'Lorem ipsum dolor sit amet, consectetuer adipisci elit',
    },
  ];

  @override
  void initState() {
    // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      EasyLoading.showSuccess('Notification Allowed');
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              height: context.height() / 1.5,
              width: context.width(),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    itemCount: sliderList.length,
                    controller: pageController,
                    onPageChanged: (int index) =>
                        setState(() => currentIndexPage = index),
                    itemBuilder: (_, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(sliderList[index]['icon'],
                              width: context.width(), height: 340),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              sliderList[index]['title'].toString(),
                              style: kTextStyle.copyWith(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // ignore: sized_box_for_whitespace
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            // ignore: sized_box_for_whitespace
                            child: Container(
                              width: context.width(),
                              child: Text(
                                sliderList[index]['description'].toString(),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                                style: kTextStyle.copyWith(
                                  color: kGreyTextColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            DotIndicator(
              currentDotSize: 15,
              dotSize: 6,
              pageController: pageController,
              pages: sliderList,
              indicatorColor: kMainColor,
              unselectedIndicatorColor: Colors.grey,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: setToken,
                    child: Text(
                      'Skip',
                      style: kTextStyle.copyWith(color: kGreyTextColor),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.linearToEaseOut);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: kMainColor,
                      ),
                      child: Center(
                        child: Text(
                          'Next',
                          style: kTextStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).visible(currentIndexPage < 2),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ButtonGlobal(
                buttontext: 'Get Started',
                buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
                onPressed: () async {
                  bool isConnected =
                      await SimpleConnectionChecker.isConnectedToInternet();
                  if (isConnected) {
                    const SignIn().launch(context, isNewTask: true);
                  } else {
                    EasyLoading.showError(
                        'Please check your internet connection',
                        duration: const Duration(seconds: 5));
                  }
                },
              ),
            ).visible(currentIndexPage == 2),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
