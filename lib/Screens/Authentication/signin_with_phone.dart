import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/button_global.dart';
import './phone_verification.dart';
import './signin.dart';
import '../../constant.dart';

class SignInWithMobile extends StatefulWidget {
  const SignInWithMobile({Key? key}) : super(key: key);

  @override
  _SignInWithMobileState createState() => _SignInWithMobileState();
}

class _SignInWithMobileState extends State<SignInWithMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            const SignIn().launch(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Image(
                image: AssetImage('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Text(
              'Register or Login with Mobile Number',
              style: kTextStyle.copyWith(color: kGreyTextColor),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 60.0,
              child: AppTextField(
                textFieldType: TextFieldType.PHONE,
                controller: TextEditingController(),
                enabled: true,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  labelText: 'Phone Number',
                  hintText: '1767 432556',
                  labelStyle: kTextStyle,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE8E7E5),
                    ),
                  ),
                  prefixIcon: CountryCodePicker(
                    padding: EdgeInsets.zero,
                    onChanged: print,
                    initialSelection: 'BD',
                    showFlag: true,
                    showDropDownButton: true,
                    alignLeft: false,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ButtonGlobal(
              buttontext: 'Next',
              buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
              onPressed: () {
                PhoneVerification(
                  email: 'null',
                ).launch(context);
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Login with Password',
              style: kTextStyle,
            ).onTap(() {
              const SignIn().launch(context);
            }),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Divider(
                    color: kGreyTextColor.withOpacity(0.2),
                  ),
                ),
                Text(
                  'or Continue with',
                  style: kTextStyle.copyWith(
                    color: kGreyTextColor,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: kGreyTextColor.withOpacity(0.2),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: const [
                Expanded(
                    child: Image(
                  image: AssetImage('images/fb.png'),
                )),
                Expanded(
                    child: Image(
                  image: AssetImage('images/google.png'),
                )),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
