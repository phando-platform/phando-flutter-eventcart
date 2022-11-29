import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/button_global.dart';
import '../../Models/order_list_model.dart';
import '../../Models/profile_model.dart';
import '../../Services/api_manager.dart';
import '../../constant.dart';
import '../Home Screen/home.dart';

class ManageOrder extends StatefulWidget {
  const ManageOrder({Key? key, required this.details, required this.orderId})
      : super(key: key);
  final Details details;
  final String orderId;

  @override
  _ManageOrderState createState() => _ManageOrderState();
}

class _ManageOrderState extends State<ManageOrder> {
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String token = '';
  final TextEditingController reasonController = TextEditingController();

  Future<void> getToken() async {
    SharedPreferences preferences = await _prefs;
    setState(() {
      token = preferences.getString('token')!;
    });
  }

  void showPopUp() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.close,
                        color: kMainColor,
                        size: 20.0,
                      ).onTap(() => finish(context)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: reasonController,
                      keyboardType: TextInputType.text,
                      maxLines: 5,
                      decoration: kInputDecoration.copyWith(
                        hintText: 'Enter The reason of cancellation',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                  ButtonGlobal(
                      buttontext: 'Cancel Order',
                      buttonDecoration:
                          kButtonDecoration.copyWith(color: kMainColor),
                      onPressed: () async {
                        try {
                          EasyLoading.show(status: 'Cancelling');
                          final cancel = await _apiManager.cancelOrder(
                            token: token,
                            orderDetailsId: widget.details.id.toString(),
                            description: widget.details.id.toString(),
                            reason: reasonController.text,
                            orderId: widget.orderId,
                            productId: widget.details.productId.toString(),
                          );
                          if (cancel?.success == true) {
                            EasyLoading.showSuccess(cancel!.message.toString());
                            const Home().launch(context);
                          } else {
                            EasyLoading.showError(cancel!.message.toString());
                          }
                        } catch (e) {
                          EasyLoading.showError(e.toString());
                        }
                      }),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    getToken();
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
          'Manage Order',
          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<ProfileModel>(
        future: _apiManager.getProfileInfo(token),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipping Address',
                    style: kTextStyle.copyWith(fontSize: 18.0),
                  ),
                  Text(
                    '${snapshot.data?.value?.shipping?.shippingName ?? ''} - ${snapshot.data?.value?.shipping?.addressLineOne ?? ''} ,${snapshot.data?.value?.shipping?.addressLineTwo ?? ''} , ${snapshot.data?.value?.shipping?.shippingTown ?? ''}  ,${snapshot.data?.value?.shipping?.country?.name ?? ''} , ${snapshot.data?.value?.shipping?.shippingPost ?? ''} - ${snapshot.data?.value?.shipping?.shippingMobile ?? ''} ',
                    style: kTextStyle.copyWith(color: kGreyTextColor),
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        /* leading: Image.network(
                            widget.details.product!.images![0].image!),*/
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*Text(
                              widget.details.product!.name!,
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),*/
                            Row(
                              children: [
                                Text(
                                  '#INV${widget.orderId} ${widget.details.id.toString()}',
                                  style: kTextStyle.copyWith(
                                      color: kGreyTextColor),
                                ),
                                const Spacer(),
                                Text(
                                  '\$${widget.details.salePrice.toString()}',
                                  style: kTextStyle.copyWith(color: kMainColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: kBgColor,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  'Cancel',
                                  style: kTextStyle.copyWith(color: kRedColor),
                                ).onTap(() => showPopUp()),
                              ),
                              const Spacer(),
                              Text(
                                widget.details.createdAt?.substring(0, 10) ??
                                    '',
                                style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
