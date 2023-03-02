import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
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
  AddBilling(
      {Key? key,
      required this.country,
      required this.mobile,
      required this.status})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  var mobile, country, status;

  @override
  _AddBillingState createState() => _AddBillingState();
}

class _AddBillingState extends State<AddBilling> {
  TextEditingController fullNameOneController = TextEditingController();
  TextEditingController addressOneController = TextEditingController();
  TextEditingController addressTwoController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<String> states = [];

  Future<void> getPrefilledData() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final email = _prefs.getString('email') ?? '';
    final firstName = _prefs.getString('firstName') ?? '';
    final lastName = _prefs.getString('lastName') ?? '';
    emailController.text = email;
    fullNameOneController.text = firstName + ' ' + lastName;
  }

  Future<void> getStates() async {
    try {
      final SharedPreferences prefs = await _prefs;
      String token = prefs.getString('token') ?? '';
      if (token == '') {
        EasyLoading.showError('Token Not Found');
      } else {
        final list = await _apiManager.getAvailableStatesList(token: token);
        states = list.value.map((e) => e.name).toList();
        if (states.isNotEmpty) stateController.text = states.first;
        setState(() {});
      }
    } catch (error) {
      log(error.toString());
      EasyLoading.showError(error.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getPrefilledData();
    getStates();
  }

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
                  style: kTextStyle.copyWith(
                      color: kGreyTextColor, fontSize: 14.0),
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
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 9) {
                      return "Length should be more than 8";
                    } else {
                      return null;
                    }
                  },
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
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      'Servicable States',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        // color: kMainColor,
                                      ),
                                    ),
                                  ),
                                  if (states.isEmpty)
                                    const Expanded(
                                      child: Center(
                                        child: Text(
                                          'No States Available\nPlease try again later!',
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  else
                                    ...states
                                        .map(
                                          (e) => ListTile(
                                            title: Text(e.toUpperCase()),
                                            trailing: Radio(
                                              value: e,
                                              groupValue: stateController.text,
                                              onChanged: (_) {
                                                stateController.text = e;
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        )
                                        .toList(),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: AppTextField(
                    enabled: false,
                    textFieldType: TextFieldType.NAME,
                    controller: stateController,
                    decoration: InputDecoration(
                      labelText: 'State',
                      labelStyle: kTextStyle,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kMainColor),
                      ),
                      hintText: 'Enter Your State',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE8E7E5),
                        ),
                      ),
                      disabledBorder: const OutlineInputBorder(
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
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: kTextStyle,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: kMainColor),
                    ),
                    hintText: 'Enter Your Email',
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
                  buttonDecoration:
                      kButtonDecoration.copyWith(color: kMainColor),
                  onPressed: () async {
                    if (addressOneController.text.isEmpty) {
                      toast("Please input your Address to Signup");
                    } else if (cityController.text.isEmpty) {
                      toast("Please input your city to signup");
                    } else if (fullNameOneController.text.isEmpty) {
                      toast("Please input your Full name to signup");
                    } else if (fullNameOneController.text.contains('Guest')) {
                      toast("Please input valid Full name to signup");
                    } else if (postalController.text.isEmpty) {
                      toast("Please input your post code to signup");
                    } else if (postalController.text.length < 5) {
                      toast("Postal code less than 5");
                    } else if (stateController.text.isEmpty) {
                      toast("Please input your state to signup");
                    } else if (emailController.text.isEmpty) {
                      toast("Please input your email to signup");
                    } else if (emailController.text.contains('Guest')) {
                      toast("Please input valid email to signup");
                    } else if (addressOneController.text.length < 26) {
                      toast("Length of Address line 1 should be more than 25");
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
                            token: token.toString(),
                            name: fullNameOneController.text.toString(),
                            address: addressOneController.text.toString(),
                            addressTwo: addressTwoController.text.isEmpty
                                ? 'N/A'
                                : addressTwoController.text.toString(),
                            city: cityController.text.toString(),
                            post: postalController.text.toString(),
                            countryId: "104",
                            /*India*/
                            //  widget.country.toString(),
                            mobile: widget.mobile.toString(),
                            email: emailController.text.toString(),
                            state: stateController.text.toString(),
                          );

                          print("shipping response");
                          print(shipping.success);
                          final billing = await _apiManager.setBillingInfo(
                            token: token.toString(),
                            address: addressOneController.text.toString(),
                            mobile: widget.mobile.toString(),
                            city: cityController.text.toString(),
                            post: postalController.text.toString(),
                            countryId: "104",
                            email: emailController.text.toString(),
                            state: stateController.text.toString(),
                          );
                          /* widget.country.toString());*/
                          print("billing response");
                          print(billing.success);
                          if (billing.success == true &&
                              shipping.success == true) {
                            await _prefs
                              ..setString(
                                'billing_postal_Code',
                                postalController.text,
                              )
                              ..setString(
                                'billing_user_city',
                                cityController.text,
                              )
                              ..setString(
                                'billing_user_state',
                                stateController.text,
                              )
                              ..setString(
                                'billing_add_one',
                                addressOneController.text,
                              )
                              ..setString(
                                'billing_add_two',
                                addressTwoController.text,
                              )
                              ..setString(
                                'billing_full_name',
                                fullNameOneController.text,
                              )
                              ..setString(
                                'billing_email',
                                emailController.text,
                              )
                              ..setString(
                                'shipping_postal_Code',
                                postalController.text,
                              )
                              ..setString(
                                'shipping_user_city',
                                cityController.text,
                              )
                              ..setString(
                                'shipping_user_state',
                                stateController.text,
                              )
                              ..setString(
                                'shipping_add_one',
                                addressOneController.text,
                              )
                              ..setString(
                                'shipping_add_two',
                                addressTwoController.text,
                              )
                              ..setString(
                                'shipping_full_name',
                                fullNameOneController.text,
                              )
                              ..setString(
                                'shipping_email',
                                emailController.text,
                              )
                              ..setString(
                                'detailedFilled',
                                "1",
                              );
                            EasyLoading.showSuccess(
                              'Shipping Address Successfully Saved',
                            );

                            if (widget.status == 1) {
                              ref.read(cartProvider).cartItems.clear();
                              ref.read(cartItemUiProvider).cartItemUis.clear();
                            }

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                              ModalRoute.withName("/Home"),
                            );
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
