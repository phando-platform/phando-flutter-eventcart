import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  int selectedIndex = 0;

  List<String> methods = [
    'images/paypal.png',
    'images/bkash.png',
    'images/ssl.png',
    'images/stripe.png',
    'images/paytm.png',
    'images/addpayment.png',
  ];
  // ignore: prefer_typing_uninitialized_variables
  var dialogContext;
  List<Color> colors = [
    const Color(0xFFE4F7FF),
    const Color(0xFFFFE8EE),
    const Color(0xFFEAEFF7),
    const Color(0xFFF0EFFF),
    const Color(0xFFE6F9FE),
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Payment Methods',
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
                'Choose a payment method',
                style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 2,
                  crossAxisCount: 2,
                  children: List.generate(
                    methods.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () => index == 5
                              ? showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    dialogContext = context;
                                    return SingleChildScrollView(
                                      child: Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        // ignore: sized_box_for_whitespace
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, bottom: 20.0),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Add New Card',
                                                  style: kTextStyle.copyWith(
                                                      color: kTitleColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                CreditCardWidget(
                                                  textStyle:
                                                      kTextStyle.copyWith(
                                                          fontSize: 10.0,
                                                          color: Colors.white),
                                                  cardNumber: cardNumber,
                                                  expiryDate: expiryDate,
                                                  cardHolderName:
                                                      cardHolderName,
                                                  cvvCode: cvvCode,
                                                  showBackView: isCvvFocused,
                                                  obscureCardNumber: true,
                                                  obscureCardCvv: true,
                                                  isHolderNameVisible: true,
                                                  cardBgColor: kMainColor,
                                                  isSwipeGestureEnabled: true,
                                                  onCreditCardWidgetChange:
                                                      (CreditCardBrand
                                                          creditCardBrand) {},
                                                ),
                                                CreditCardForm(
                                                  formKey: formKey,
                                                  // Required
                                                  onCreditCardModelChange:
                                                      onCreditCardModelChange,
                                                  // Required
                                                  obscureCvv: true,
                                                  obscureNumber: true,
                                                  cardNumber: cardNumber,
                                                  cvvCode: cvvCode,
                                                  isHolderNameVisible: true,
                                                  isCardNumberVisible: true,
                                                  isExpiryDateVisible: true,
                                                  cardHolderName:
                                                      cardHolderName,
                                                  expiryDate: expiryDate,
                                                  themeColor: Colors.blue,
                                                  textColor: kTitleColor,
                                                  cardNumberDecoration:
                                                      const InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText: 'Number',
                                                    hintText:
                                                        'XXXX XXXX XXXX XXXX',
                                                  ),
                                                  expiryDateDecoration:
                                                      const InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText: 'Expired Date',
                                                    hintText: 'XX/XX',
                                                  ),
                                                  cvvCodeDecoration:
                                                      const InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText: 'CVV',
                                                    hintText: 'XXX',
                                                  ),
                                                  cardHolderDecoration:
                                                      const InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText: 'Card Holder',
                                                  ),
                                                ),
                                                ButtonGlobal(
                                                    buttontext: 'Save Address',
                                                    buttonDecoration:
                                                        kButtonDecoration
                                                            .copyWith(
                                                                color:
                                                                    kMainColor),
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          dialogContext);
                                                    }),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                              : setState(() {
                                  selectedIndex = index;
                                }),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: colors[index]),
                            child: Center(
                              child: Image.asset(methods[index]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                  child: Text(
                'PayPal Amount Section',
                style: kTextStyle,
              )),
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
                  hintText: 'Maan Theme',
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
                  labelText: 'Amount',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: '\$130.00',
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
                decoration: InputDecoration(
                  labelText: 'Cardholder Name',
                  labelStyle: kTextStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                  ),
                  hintText: 'Maan Theme',
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
                buttontext: 'Review your order',
                buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
                onPressed: () {
                  // const OrderReview().launch(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
