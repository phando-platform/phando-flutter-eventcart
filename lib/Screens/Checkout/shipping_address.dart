import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/button_global.dart';
import './payment_method.dart';
import '../../constant.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({Key? key}) : super(key: key);

  @override
  _ShippingAddressState createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Enter Your Shipping Address',
                style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20.0,
              ),
              AppTextField(
                textFieldType: TextFieldType.NAME,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: 'Enter your full name',
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
                decoration: InputDecoration(
                  labelText: 'Street Address',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: 'Street No. 123',
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
                height: 60,
                child: FormField(
                  builder: (FormFieldState<dynamic> field) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Country',
                          labelStyle: kTextStyle.copyWith(
                            color: Colors.black,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE8E7E5),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      child: CountryCodePicker(
                        padding: const EdgeInsets.all(10.0),
                        onChanged: print,
                        initialSelection: 'IN',
                        showFlag: true,
                        showCountryOnly: true,
                        showOnlyCountryWhenClosed: true,
                        showDropDownButton: true,
                        alignLeft: true,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              AppTextField(
                textFieldType: TextFieldType.NAME,
                decoration: InputDecoration(
                  labelText: 'City',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: 'Enter your City',
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
                decoration: InputDecoration(
                  labelText: 'Postal Code',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: '123456',
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
                buttontext: 'Continue To Payment',
                buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
                onPressed: () {
                  const PaymentMethods().launch(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
