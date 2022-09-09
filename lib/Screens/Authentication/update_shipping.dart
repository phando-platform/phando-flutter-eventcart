import 'package:event_app/Screens/Checkout/order_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/button_global.dart';
import '../../Services/api_manager.dart';
import '../../constant.dart';
import '../Profile/profile_screen.dart';

// ignore: must_be_immutable
class UpdateShipping extends StatefulWidget {
  UpdateShipping(
      {Key? key,
      required this.shipping,
      this.isBilling = false,
      this.isProfile = false,
      this.callback})
      : super(key: key);
  ShippingUpdate shipping;
  bool isBilling;
  bool isProfile;
  VoidCallback? callback;

  @override
  _UpdateShippingState createState() => _UpdateShippingState();
}

class _UpdateShippingState extends State<UpdateShipping> {
  TextEditingController fullNameOneController = TextEditingController();
  TextEditingController addressOneController = TextEditingController();
  TextEditingController addressTwoController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    fullNameOneController.text = widget.shipping.fullName.toString();
    addressOneController.text = widget.shipping.addressOne.toString();
    addressTwoController.text = widget.shipping.addressTwo.toString();
    cityController.text = widget.shipping.town.toString();
    postalController.text = widget.shipping.postCode.toString();
    mobileController.text = widget.shipping.mobile.toString();
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
          widget.isBilling ? 'Billing Address' : 'Shipping Address',
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
              const SizedBox(
                height: 50.0,
              ),
              Text(
                'Update Shipping Address',
                style: kTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Text(
                'Please Update your delivery Location',
                style:
                    kTextStyle.copyWith(color: kGreyTextColor, fontSize: 14.0),
              ),
              const SizedBox(
                height: 50.0,
              ),
              AppTextField(
                textFieldType: TextFieldType.NAME,
                controller: fullNameOneController,
                decoration: InputDecoration(
                  labelText: 'Full name',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: 'Enter Your Full Name',
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
                // ignore: deprecated_member_use
                textFieldType: TextFieldType.ADDRESS,
                controller: addressOneController,
                decoration: InputDecoration(
                  labelText: 'Address Line 1',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: 'Enter Your Full Address',
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
                // ignore: deprecated_member_use
                textFieldType: TextFieldType.ADDRESS,
                controller: addressTwoController,
                decoration: InputDecoration(
                  labelText: 'Address Line 2',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: 'Enter Your Full Address',
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
                controller: cityController,
                decoration: InputDecoration(
                  labelText: 'City',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: 'Enter Your City',
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
                controller: postalController,
                decoration: InputDecoration(
                  labelText: 'Post Code',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: 'Enter Your Post Code',
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
                textFieldType: TextFieldType.PHONE,
                controller: mobileController,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: 'Enter Your Mobile Number',
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
              ButtonGlobal(
                buttontext: 'Update',
                buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
                onPressed: () async {
                  if (addressOneController.text.isEmpty) {
                    toast("Please input your Address to Signup");
                  } else if (cityController.text.isEmpty) {
                    toast("Please input your city to signup");
                  } else if (fullNameOneController.text.isEmpty) {
                    toast("Please input your Full name to signup");
                  } else if (postalController.text.isEmpty) {
                    toast("Please input your post code to signup");
                  } else if (addressOneController.text.isNotEmpty &&
                      cityController.text.isNotEmpty &&
                      postalController.text.isNotEmpty) {
                    try {
                      EasyLoading.show(status: 'Setting Address...');
                      final SharedPreferences prefs = await _prefs;
                      String token = prefs.getString('token') ?? '';
                      if (token == '') {
                        EasyLoading.showError('Token Not Found');
                      } else {
                        if (widget.isBilling) {
                          final billing = await _apiManager.setBillingInfo(
                            token.toString(),
                            addressOneController.text.toString(),
                            widget.shipping.mobile.toString(),
                            cityController.text.toString(),
                            postalController.text.toString(),
                            widget.shipping.countryId.toString(),
                          );
                          if (billing.success == true) {
                            EasyLoading.showSuccess(
                                'Billing Address Successfully Saved');

                            OrderReview().launch(context);
                          } else {
                            EasyLoading.showError(billing.message.toString());
                          }
                        } else {
                          final shipping = await _apiManager.setShippingInfo(
                            token.toString(),
                            fullNameOneController.text.toString(),
                            addressOneController.text.toString(),
                            addressTwoController.text.toString(),
                            cityController.text.toString(),
                            postalController.text.toString(),
                            widget.shipping.countryId.toString(),
                            mobileController.text.toString(),
                          );

                          if (shipping.success == true) {
                            EasyLoading.showSuccess(
                                'Shipping Address Successfully Saved');

                            if (widget.isProfile)
                              ProfileScreen().launch(context);
                            else
                              OrderReview().launch(context);
                          } else {
                            EasyLoading.showError(shipping.message.toString());
                          }
                        }
                      }
                    } catch (e) {
                      EasyLoading.showError(e.toString() + 'Catch');
                      // Navigator.pop(context);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShippingUpdate {
  String? fullName;
  String? addressOne;
  String? addressTwo;
  String? postCode;
  String? town;
  String? countryId;
  String? mobile;

  ShippingUpdate(
      {this.fullName,
      this.addressOne,
      this.addressTwo,
      this.countryId,
      this.town,
      this.postCode,
      this.mobile});
}
