import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart' hide log;

import '../../../GlobalComponents/button_global.dart';
import '../../constant.dart';
import '../../Services/api_manager.dart';
import '../Home Screen/home.dart';
import './sign_up.dart';
import './forgot_password.dart';
import 'add_billing.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with TickerProviderStateMixin {
  bool isChecked = true;
  bool isOtpSent = false;
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  int countryId = 104;
  late TabController tabController;

  Future<void> setToken() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      prefs.setString('username', 'Guest');
      prefs.setString('token', 'Not Found');
    });
    const Home().launch(context);
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);

    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    tabController.removeListener(() {});
    tabController.dispose();
    mobileController.dispose();
    otpController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Sign In',
          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Image(
                    image: AssetImage('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'Welcome Back',
                style: kTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Text(
                'Sign in to your account',
                style:
                    kTextStyle.copyWith(color: kGreyTextColor, fontSize: 14.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TabBar(
                        indicatorColor: kMainColor,
                        controller: tabController,
                        onTap: (value) {},
                        tabs: List.generate(
                          2,
                          (index) => Container(
                            alignment: Alignment.center,
                            height: 40,
                            child: Text(
                              index == 0 ? 'Email' : 'Mobile',
                              style: const TextStyle(
                                color: kMainColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60.0,
                                child: AppTextField(
                                  textFieldType: TextFieldType.EMAIL,
                                  controller: emailController,
                                  enabled: true,
                                  decoration: InputDecoration(
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: kMainColor),
                                    ),
                                    labelText: 'Username',
                                    hintText: 'Enter your username',
                                    labelStyle: kTextStyle,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFE8E7E5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              AppTextField(
                                textFieldType: TextFieldType.PASSWORD,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: kTextStyle,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: kMainColor),
                                  ),
                                  hintText: 'Enter password',
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE8E7E5),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 80,
                                child: AppTextField(
                                  textFieldType: TextFieldType.NUMBER,
                                  controller: mobileController,
                                  enabled: !isOtpSent,
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: kMainColor),
                                    ),
                                    labelText: 'Mobile Number',
                                    hintText: 'Enter your mobile number',
                                    labelStyle: kTextStyle,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFE8E7E5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (isOtpSent)
                                const SizedBox(
                                  height: 20.0,
                                ),
                              if (isOtpSent)
                                AppTextField(
                                  textFieldType: TextFieldType.PASSWORD,
                                  controller: otpController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 6,
                                  decoration: InputDecoration(
                                    labelText: 'OTP',
                                    labelStyle: kTextStyle,
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: kMainColor),
                                    ),
                                    hintText: 'Enter OTP',
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFE8E7E5),
                                      ),
                                    ),
                                  ),
                                ),
                              if (isOtpSent)
                                const SizedBox(
                                  height: 20.0,
                                ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: isChecked,
                      thumbColor: Colors.white,
                      activeColor: kMainColor,
                      onChanged: (bool value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    'Save Me',
                    style: kTextStyle.copyWith(color: kGreyTextColor),
                  ),
                  const Spacer(),
                  if (tabController.index == 0)
                    Text(
                      'Forgot Password?',
                      style: kTextStyle.copyWith(color: kGreyTextColor),
                    ).onTap(() {
                      const ForgotPassword().launch(context);
                    }),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              ButtonGlobal(
                buttontext: tabController.index == 0
                    ? 'Sign In'
                    : isOtpSent
                        ? 'Sign In'
                        : 'Send OTP',
                buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
                onPressed: () async {
                  if (tabController.index == 0) {
                    //! UserName Password flow
                    if (emailController.text.isEmpty) {
                      toast("Please input your username to login");
                    } else if (passwordController.text.isEmpty) {
                      toast("Please input your password to login");
                    } else if (passwordController.text.length < 6) {
                      toast("Password must be more than 6 characters");
                    } else if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty &&
                        passwordController.text.length > 5) {
                      try {
                        EasyLoading.show(status: 'Signin In...');
                        final login = await _apiManager.signInWithEmail(
                          emailController.text,
                          passwordController.text,
                        );
                        if (login.status == 'Success') {
                          EasyLoading.showSuccess(login.message.toString());
                          final SharedPreferences prefs = await _prefs;
                          print(login.accessToken);
                          print(login.customer?.firstName);
                          print(login.customer?.lastName);
                          print(login.customer?.email);
                          print(login.customer?.mobile);
                          print(login.customer?.username);

                          prefs.setString('token',
                              login.accessToken?.toString() ?? 'Guest');
                          prefs.setString('firstName',
                              login.customer?.firstName ?? 'Guest');
                          prefs.setString(
                              'lastName', login.customer?.lastName ?? 'Guest');
                          prefs.setString(
                              'email', login.customer?.email ?? 'Guest');
                          prefs.setString(
                              'phone', login.customer?.mobile ?? 'Guest');
                          prefs.setString(
                              'username', login.customer?.username ?? 'Guest');
                          prefs.setBool('autoLogin', isChecked);
                          String? detailFilled =
                              prefs.getString('detailedFilled');
                          countryId = prefs.getInt('country') ?? 0;

                          if (detailFilled == '1') {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                                ModalRoute.withName("/Home"));
                          } else {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddBilling(
                                        country: countryId,
                                        mobile: login.customer?.mobile,
                                        status: 1)),
                                ModalRoute.withName("/AddBilling"));
                          }
                        } else {
                          EasyLoading.showError(login.error.toString());
                        }
                      } catch (e) {
                        toast('Credentials doesn\'t match with our record');
                        EasyLoading.showError(e.toString());
                      }
                    }
                  } else {
                    //! Mobile otp verification flow
                    if (isOtpSent) {
                      if (otpController.text.isEmpty ||
                          otpController.text.length < 5) {
                        toast("Please enter valid otp");
                      } else {
                        EasyLoading.show(status: 'Signin In...');
                        try {
                          final login = await _apiManager.verifyMobileOtp(
                            mobileNumber: mobileController.text,
                            otp: otpController.text,
                          );
                          if (login.status == 'success') {
                            EasyLoading.showSuccess(login.message.toString());
                            final SharedPreferences prefs = await _prefs;
                            log(login.accessToken ?? '');
                            log(login.customer?.firstName ?? '');
                            log(login.customer?.lastName ?? '');
                            log(login.customer?.email ?? '');
                            log(login.customer?.mobile ?? '');
                            log(login.customer?.username ?? '');

                            prefs.setString(
                              'token',
                              login.accessToken ?? 'Guest',
                            );
                            prefs.setString(
                              'firstName',
                              login.customer?.firstName ?? 'Guest',
                            );
                            prefs.setString(
                              'lastName',
                              login.customer?.lastName ?? 'Guest',
                            );
                            prefs.setString(
                              'email',
                              login.customer?.email ?? 'Guest',
                            );
                            prefs.setString(
                              'phone',
                              login.customer?.mobile ?? 'Guest',
                            );
                            prefs.setString(
                              'username',
                              login.customer?.username ?? 'Guest',
                            );
                            prefs.setBool('autoLogin', isChecked);
                            String? detailFilled =
                                prefs.getString('detailedFilled');
                            countryId = prefs.getInt('country') ?? 0;

                            if (detailFilled == '1') {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()),
                                  ModalRoute.withName("/Home"));
                            } else {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddBilling(
                                          country: countryId,
                                          mobile: login.customer?.mobile,
                                          status: 1)),
                                  ModalRoute.withName("/AddBilling"));
                            }
                          } else if (login.status == 'error') {
                            EasyLoading.showError(login.message.toString());
                          } else {
                            EasyLoading.showError(login.error.toString());
                          }
                        } catch (error) {
                          log(error.toString());
                          toast('Credentials doesn\'t match with our record');
                          EasyLoading.showError(error.toString());
                        }
                      }
                    } else {
                      //! send otp flow
                      if (mobileController.text.length == 10) {
                        EasyLoading.show(status: 'Sending otp...');
                        final login = await _apiManager.sendOtp(
                          mobileNumber: mobileController.text,
                        );
                        if (login) {
                          isOtpSent = true;
                          EasyLoading.dismiss();
                          setState(() {});
                        } else {
                          EasyLoading.dismiss();
                          EasyLoading.showError('Something went wrong');
                        }
                      }
                    }
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: context.width(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  border: Border.all(color: kBorderColorTextField),
                ),
                child: Center(
                    child: Text(
                  'Continue as Guest',
                  style: kTextStyle.copyWith(
                    color: kTitleColor,
                    fontSize: 18.0,
                  ),
                )),
              ).onTap(setToken),
              const SizedBox(
                height: 30.0,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don\'t have an account? ',
                      style: kTextStyle.copyWith(
                        color: kGreyTextColor,
                      ),
                    ),
                    WidgetSpan(
                      child: Text(
                        'Sign Up',
                        style: kTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: kMainColor,
                        ),
                      ).onTap(() {
                        const SignUp().launch(context);
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
