import 'package:country_code_picker/country_code_picker.dart';
import 'package:event_app/GlobalComponents/form_errors_list.dart';
import 'package:event_app/Screens/Authentication/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/button_global.dart';
import './add_billing.dart';
import '../../Helpers/helper.functions.dart';
import '../../Services/api_manager.dart';
import '../../constant.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final ApiManager _apiManager = ApiManager();
  bool _showErrors = false;
  List _errorsList = [];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  // default country id = India
  int countryId = 104;
  String countryCode = "IN";
  bool otpVisible = false;
  String strOTP = '';

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    mobileController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    mobileController.addListener(() {
      print("value: ${mobileController.text}");
      String number = mobileController.text;
      if (number.length == 10) {
        otpVisible = true;
      } else {
        otpVisible = false;
      }

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Sign Up',
          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                'A New Journey Awaits',
                style: kTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Text(
                'Please sign up to continue browsing',
                style:
                    kTextStyle.copyWith(color: kGreyTextColor, fontSize: 14.0),
              ),
              const SizedBox(
                height: 50.0,
              ),
              AppTextField(
                textFieldType: TextFieldType.NAME,
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: 'Enter Your First Name',
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
              AppTextField(
                textFieldType: TextFieldType.NAME,
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: 'Enter Your Last Name',
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
              AppTextField(
                textFieldType: TextFieldType.NAME,
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: 'Enter Your Username',
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
              AppTextField(
                textFieldType: TextFieldType.EMAIL,
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: 'Enter Your Email Address',
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
              SizedBox(
                height: 70.0,
                child: AppTextField(
                  textFieldType: TextFieldType.PHONE,
                  controller: mobileController,
                  enabled: true,
                  maxLength: countryCode == "IN" ? 10 : null,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: kMainColor),
                    ),
                    labelText: 'Phone Number',
                    hintText: 'Enter your Phone Number',
                    labelStyle: kTextStyle,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFE8E7E5),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                // visible: otpVisible,
                visible: false,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 60.0,
                      child: AppTextField(
                        textFieldType: TextFieldType.NUMBER,
                        controller: otpController,
                        enabled: true,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kMainColor),
                          ),
                          labelText: 'OTP',
                          hintText: 'Enter your OTP',
                          labelStyle: kTextStyle,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE8E7E5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
              AppTextField(
                textFieldType: TextFieldType.PASSWORD,
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: 'Confirm password',
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
              if (_showErrors) FormErrorsList(_errorsList) else Container(),
              const SizedBox(
                height: 20.0,
              ),
              ButtonGlobal(
                  buttontext: 'Sign Up',
                  buttonDecoration:
                      kButtonDecoration.copyWith(color: kMainColor),
                  onPressed: _onFormSubmit),
            ],
          ),
        ),
      ),
    );
  }

  _onFormSubmit() async {
    print(mobileController.text);
    print(countryCode);

    if (firstNameController.text.length < 3) {
      toast("Please enter a valid First Name");
    } else if (lastNameController.text.length < 3) {
      toast("Please enter a valid Last Name");
    } else if (usernameController.text.length < 4) {
      toast("Username must have at least 4 characters");
    } else if (!isEmailValid(emailController.text)) {
      toast("Please add a valid Email ID");
    } else if (!isMobileValid(mobileController.text)) {
      toast("Please add a valid Mobile no.");
    } else if (!isPasswordValid(passwordController.text)) {
      toast("Password must have at least 8 characters.");
    } else if (confirmPasswordController.text == passwordController.text) {
      toast("Password and confirm password do not match.");
    } else if (mobileController.text.length == 10) {
      if (countryCode != "IN") {
        toast("Please Select Valid Country");
      } else {
        try {
          print("country");
          print(countries[countryId - 1]);
          EasyLoading.show(status: 'Signing Up...');
          final signUp = await _apiManager.signUpWithEmail(
              firstNameController.text,
              lastNameController.text,
              usernameController.text,
              emailController.text,
              mobileController.text,
              passwordController.text);
          if (signUp.status == 'Success') {
            // hide errors list
            // empty out errors list
            setState(() {
              _showErrors = true;
              _errorsList = [];
            });
            EasyLoading.showSuccess('Sign up Successful...');
            final SharedPreferences prefs = await _prefs;
            prefs.setString('token', signUp.accessToken?.toString() ?? 'Guest');
            prefs.setString('lastName', signUp.customer?.lastName ?? 'Guest');
            prefs.setString('email', signUp.customer?.email ?? 'Guest');
            prefs.setString('phone', signUp.customer?.mobile ?? 'Guest');
            prefs.setInt('country', countryId);
            prefs.setString('username', signUp.customer?.username ?? 'Guest');
            prefs.setBool('autoLogin', true);
            const SignIn().launch(context, isNewTask: true);
            /* Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AddBilling(
                country: countryId,
                mobile: mobileController.text,
                status: 1
            )),
                ModalRoute.withName("/AddBilling"));
*/

            /* AddBilling(
            country: countryId,
            mobile: mobileController.text,
          ).launch(context);*/
          } else {
            var errorsObj = signUp.errors as Map<String, dynamic>;

            // show errors list
            // set errorsList to received errors list
            setState(() {
              _showErrors = true;
              _errorsList = getErrorsList(errorsObj);
            });

            // hide any existing EasyLoding msg
            EasyLoading.dismiss();
          }
        } catch (e) {
          print(e.toString());
          EasyLoading.showError(e.toString());
        }
      }
    } else {
      try {
        print("country");
        print(countries[countryId - 1]);
        EasyLoading.show(status: 'Signing Up...');
        final signUp = await _apiManager.signUpWithEmail(
            firstNameController.text,
            lastNameController.text,
            usernameController.text,
            emailController.text,
            mobileController.text,
            passwordController.text);
        if (signUp.status == 'Success') {
          // hide errors list
          // empty out errors list
          setState(() {
            _showErrors = true;
            _errorsList = [];
          });
          EasyLoading.showSuccess('Please verify email to login');
          final SharedPreferences prefs = await _prefs;
          prefs.setString('token', signUp.accessToken?.toString() ?? 'Guest');
          prefs.setString('lastName', signUp.customer?.lastName ?? 'Guest');
          prefs.setString('email', signUp.customer?.email ?? 'Guest');
          prefs.setString('phone', signUp.customer?.mobile ?? 'Guest');
          prefs.setInt('country', countryId);
          prefs.setString('username', signUp.customer?.username ?? 'Guest');
          prefs.setBool('autoLogin', true);
          const SignIn().launch(context, isNewTask: true);
          /*Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AddBilling(
              country: countryId,
              mobile: mobileController.text,
              status: 1
          )
          ),
              ModalRoute.withName("/AddBilling"));*/

          /* AddBilling(
            country: countryId,
            mobile: mobileController.text,
          ).launch(context);*/
        } else {
          var errorsObj = signUp.errors as Map<String, dynamic>;

          // show errors list
          // set errorsList to received errors list
          setState(() {
            _showErrors = true;
            _errorsList = getErrorsList(errorsObj);
          });

          // hide any existing EasyLoding msg
          EasyLoading.dismiss();
        }
      } catch (e) {
        print(e.toString());
        EasyLoading.showError(e.toString());
      }
    }
  }
}
