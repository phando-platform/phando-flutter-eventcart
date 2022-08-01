import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../GlobalComponents/button_global.dart';
import '../../constant.dart';
import '../../Services/api_manager.dart';
import '../Home Screen/home.dart';
import './sign_up.dart';
import './forgot_password.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isChecked = true;
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> setToken() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      prefs.setString('username', 'Guest');
      prefs.setString('token', 'Not Found');
    });
    const Home().launch(context);
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
                height: 50.0,
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
                height: 50.0,
              ),
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
                buttontext: 'Sign In',
                buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
                onPressed: () async {
                  if (passwordController.text.length < 6) {
                    toast("Password must be more than 6 characters");
                  } else if (passwordController.text.isEmpty) {
                    toast("Please input your password to login");
                  } else if (emailController.text.isEmpty) {
                    toast("Please input your email to login");
                  } else if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      passwordController.text.length > 5) {
                    try {
                      EasyLoading.show(status: 'Signin In...');
                      final login = await _apiManager.signInWithEmail(
                          emailController.text, passwordController.text);
                      if (login.status == 'Success') {
                        EasyLoading.showSuccess(login.message.toString());
                        final SharedPreferences prefs = await _prefs;
                        print(login.accessToken);
                        print(login.customer?.firstName);
                        print(login.customer?.lastName);
                        print(login.customer?.email);
                        print(login.customer?.mobile);
                        print(login.customer?.username);

                        prefs.setString(
                            'token', login.accessToken?.toString() ?? 'Guest');
                        prefs.setString(
                            'firstName', login.customer?.firstName ?? 'Guest');
                        prefs.setString(
                            'lastName', login.customer?.lastName ?? 'Guest');
                        prefs.setString(
                            'email', login.customer?.email ?? 'Guest');
                        prefs.setString(
                            'phone', login.customer?.mobile ?? 'Guest');
                        prefs.setString(
                            'username', login.customer?.username ?? 'Guest');
                        prefs.setBool('autoLogin', isChecked);

                        print("User name: ");
                        // final SharedPreferences _prefs = await SharedPreferences.getInstance();

                        print(prefs.getString('firstName'));
                        print(prefs.getString('lastName'));
                        //const Home().launch(context);
                      } else {
                        EasyLoading.showError(login.error.toString());
                      }
                    } catch (e) {
                      toast('Credentials doesn\'t match with our record');
                      EasyLoading.showError(e.toString());
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
