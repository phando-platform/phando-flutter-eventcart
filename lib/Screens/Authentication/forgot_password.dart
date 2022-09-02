import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/button_global.dart';
import './phone_verification.dart';
import '../../Services/api_manager.dart';
import '../../constant.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  final ApiManager _apiManager = ApiManager();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Forgot Password',
          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                  labelText: 'Email Address',
                  hintText: 'Enter Your Email Address',
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
            const SizedBox(
              height: 20.0,
            ),
            ButtonGlobal(
              buttontext: 'Reset Password',
              buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
              onPressed: () async {
                if (emailController.text.isNotEmpty) {
                  try {
                    EasyLoading.show(status: 'Sending Otp...');
                    final sendOtp = await _apiManager
                        .resetPasswordWithEmail(emailController.text);
                    if (sendOtp.success == true) {
                      EasyLoading.showSuccess(sendOtp.message.toString());
                      PhoneVerification(
                        email: emailController.text,
                      ).launch(context);
                    } else {
                      // EasyLoading.showError(sendOtp.message.toString());
                      EasyLoading.showError(
                          'Reset Password email has been sent ');
                    }
                  } catch (e) {
                    EasyLoading.showError(
                        'Reset Password email has been sent ');
                    // EasyLoading.showError(e.toString());
                  }
                } else {
                  EasyLoading.showError('Please Enter a valid email');
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
