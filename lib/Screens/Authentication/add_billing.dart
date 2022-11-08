import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/button_global.dart';
import '../../Services/api_manager.dart';
import '../../Services/cart_item_notifier.dart';
import '../../Services/cart_notifier.dart';
import '../../constant.dart';
import '../Home Screen/home.dart';

// ignore: must_be_immutable
class AddBilling extends StatefulWidget {
  AddBilling({Key? key, required this.country, required this.mobile,required this.status})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  var mobile, country,status;

  @override
  _AddBillingState createState() => _AddBillingState();
}

class _AddBillingState extends State<AddBilling> {
  TextEditingController fullNameOneController = TextEditingController();
  TextEditingController addressOneController = TextEditingController();
  TextEditingController addressTwoController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalController = TextEditingController();
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, ref, watch) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            'Shipping Address',
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
                  'Add Shipping Address',
                  style: kTextStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Text(
                  'Please add your delivery Location',
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
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                  ],
                  textFieldType: TextFieldType.PHONE,
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
                ButtonGlobal(
                  buttontext: 'Add Shipping',
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
                    } else if (postalController.text.length < 5) {
                      toast("Postal code less than 5");
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
                          final shipping = await _apiManager.setShippingInfo(
                            token.toString(),
                            fullNameOneController.text.toString(),
                            addressOneController.text.toString(),
                            addressTwoController.text.isEmpty
                                ? 'N/A'
                                : addressTwoController.text.toString(),
                            cityController.text.toString(),
                            postalController.text.toString(),
                            "104", /*India*/
                            //  widget.country.toString(),
                            widget.mobile.toString(),
                          );

                          print("shipping response");
                          print(shipping.success);
                          final billing = await _apiManager.setBillingInfo(
                              token.toString(),
                              addressOneController.text.toString(),
                              widget.mobile.toString(),
                              cityController.text.toString(),
                              postalController.text.toString(),
                              "104");
                          /* widget.country.toString());*/
                          print("billing response");
                          print(billing.success);
                          if (billing.success == true &&
                              shipping.success == true) {
                            final SharedPreferences prefs = await _prefs;
                            prefs.setString('postal_Code', postalController.text.toString() ?? '000000');
                            prefs.setString('user_city', cityController.text.toString() ?? 'xyz');
                            prefs.setString('add_one', addressOneController.text.toString() ?? 'xyz');
                            prefs.setString('add_two', addressTwoController.text.toString() ?? 'xyz');
                            EasyLoading.showSuccess(
                                'Shipping Address Successfully Saved');

                           if(widget.status==1){
                             ref.read(cartProvider).cartItems.clear();
                             ref.read(cartItemUiProvider).cartItemUis.clear();
                           }




                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()),
                                ModalRoute.withName("/Home"));
                          } else {
                            EasyLoading.showError(billing.message.toString());
                            print(shipping.toString());
                            print(widget.mobile);
                            print(widget.country);
                          }
                        }
                      } catch (e) {
                        EasyLoading.showError(e.toString() + 'Catch');
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );

      });

    }
}
