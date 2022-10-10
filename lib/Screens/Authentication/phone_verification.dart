import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../GlobalComponents/button_global.dart';
import './signin.dart';

import '../../Services/api_manager.dart';
import '../../constant.dart';

// ignore: must_be_immutable
class PhoneVerification extends StatefulWidget {
  PhoneVerification({Key? key, required this.email}) : super(key: key);
  String email;

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  final ApiManager _apiManager = ApiManager();

  TextEditingController pin1Controller = TextEditingController();
  TextEditingController pin2Controller = TextEditingController();
  TextEditingController pin3Controller = TextEditingController();
  TextEditingController pin4Controller = TextEditingController();
  TextEditingController pin5Controller = TextEditingController();
  TextEditingController pin6Controller = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  bool isLoading = false;
  bool isVerified = false;

  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  late FocusNode pin5FocusNode;
  late FocusNode pin6FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
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
          isVerified ? 'Enter New Password' : 'Enter OTP',
          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              isVerified ? 'Enter New Password' : 'Enter OTP',
              style: kTextStyle.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 40.0),
            child: Text(
              isVerified
                  ? 'Please enter your new password'
                  : 'Please enter your one time code below to receive your new password.',
              style: kTextStyle.copyWith(
                color: kGreyTextColor,
              ),
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 50.0,
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  controller: pin1Controller,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: 50.0,
                child: TextFormField(
                  controller: pin2Controller,
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: 50.0,
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  controller: pin3Controller,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: 50.0,
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  controller: pin4Controller,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin5FocusNode),
                ),
              ),
              SizedBox(
                width: 50.0,
                child: TextFormField(
                  focusNode: pin5FocusNode,
                  obscureText: true,
                  controller: pin5Controller,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin6FocusNode),
                ),
              ),
              SizedBox(
                width: 50.0,
                child: TextFormField(
                  focusNode: pin6FocusNode,
                  obscureText: true,
                  controller: pin6Controller,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin6FocusNode.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ).visible(!isVerified),
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: AppTextField(
              textFieldType: TextFieldType.PASSWORD,
              controller: passwordEditingController,
              decoration: InputDecoration(
                labelText: 'Enter password',
                labelStyle: kTextStyle,
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  borderSide: BorderSide(color: kMainColor),
                ),
                hintText: 'Enter new password',
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  borderSide: BorderSide(
                    color: kBorderColorTextField,
                  ),
                ),
              ),
            ),
          ).visible(isVerified),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Text(
                    "Resend OTP",
                    style: kTextStyle,
                  ),
                ),
              )
              // ArgonTimerButton(
              //   initialTimer: 30,
              //   // Optional
              //   height: 50,
              //   width: MediaQuery.of(context).size.width,
              //   minWidth: MediaQuery.of(context).size.width,
              //   color: Colors.white,
              //   borderRadius: 0.0,
              //   elevation: 0.0,
              //   child: Text(
              //     "Resend OTP",
              //     style: kTextStyle,
              //   ),
              //   loader: (timeLeft) {
              //     return Text(
              //       "Try again in $timeLeft seconds",
              //       style: kTextStyle.copyWith(color: kGreyTextColor),
              //     );
              //   },
              //   onTap: (startTimer, btnState) async {
              //     if (btnState == ButtonState.Idle) {
              //       startTimer(30);
              //     }
              //     try {
              //       final sendOtp =
              //           await _apiManager.resetPasswordWithEmail(widget.email);
              //       if (sendOtp.success == true) {
              //         toast(sendOtp.message);
              //       } else {
              //         toast(sendOtp.message);
              //       }
              //     } catch (e) {
              //       toast(e.toString());
              //     }
              //   },
              // ),
              ).visible(!isVerified),
          const CircularProgressIndicator().visible(isLoading),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: ButtonGlobal(
                buttontext: 'Verify',
                buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
                onPressed: () async {
                  EasyLoading.show(status: 'Verifying Otp...');
                  try {
                    String code = pin1Controller.text +
                        pin2Controller.text +
                        pin3Controller.text +
                        pin4Controller.text +
                        pin5Controller.text +
                        pin6Controller.text;
                    final sendOtp =
                        await _apiManager.verifyOtp(widget.email, code);
                    if (sendOtp.success == true) {
                      EasyLoading.showSuccess(sendOtp.message.toString());
                      setState(() {
                        isVerified = true;
                      });
                    } else {
                      EasyLoading.showError(sendOtp.message.toString());
                    }
                  } catch (e) {
                    EasyLoading.showError(e.toString());
                  }
                }),
          ).visible(!isVerified),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: ButtonGlobal(
                buttontext: 'Set New Password',
                buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
                onPressed: () async {
                  EasyLoading.show(status: 'Setting New Password...');
                  try {
                    String code = pin1Controller.text +
                        pin2Controller.text +
                        pin3Controller.text +
                        pin4Controller.text +
                        pin5Controller.text +
                        pin6Controller.text;
                    final resetPass = await _apiManager.setNewPassword(
                        widget.email, code, passwordEditingController.text);
                    if (resetPass.success == true) {
                      EasyLoading.showSuccess(resetPass.message.toString());
                      const SignIn().launch(context, isNewTask: true);
                    } else {
                      EasyLoading.showError(resetPass.message.toString());
                    }
                  } catch (e) {
                    EasyLoading.showError(e.toString());
                  }
                }),
          ).visible(isVerified),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
