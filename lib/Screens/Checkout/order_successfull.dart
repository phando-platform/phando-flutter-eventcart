import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:nb_utils/nb_utils.dart';
import '../../GlobalComponents/button_global.dart';
import '../../Screens/Home%20Screen/home.dart';
import '../../Screens/Profile/order_list.dart';
import '../../constant.dart';

// ignore: must_be_immutable
class OrderSuccessful extends StatefulWidget {
  OrderSuccessful({Key? key, required this.orderNumber}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  var orderNumber;
  @override
  _OrderSuccessfulState createState() => _OrderSuccessfulState();
}

class _OrderSuccessfulState extends State<OrderSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/check.png'),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Order Placed Successfully',
              style: kTextStyle,
            ),
            const SizedBox(
              height: 10.0,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Order id: ',
                    style: kTextStyle.copyWith(
                        fontSize: 14.0, color: kGreyTextColor),
                  ),
                  TextSpan(
                    text: widget.orderNumber,
                    style:
                        kTextStyle.copyWith(fontSize: 14.0, color: kMainColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            ButtonGlobal(
              buttontext: 'View Order',
              buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
              onPressed: () {
                OrderList(
                  page: 1,
                ).launch(context);
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Back to Home',
              style: kTextStyle.copyWith(color: kGreyTextColor),
            ).onTap(() => const Home().launch(context)),
          ],
        ),
      ),
    );
  }
}
