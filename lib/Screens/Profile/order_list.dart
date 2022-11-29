import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart' hide log;

import 'package:event_app/Models/tracking_order/tracking_order_response_model.dart';

import '../../GlobalComponents/button_global.dart';
import '../../Models/order_list_model.dart';
import '../../Services/api_manager.dart';
import '../../constant.dart';
import '../Home Screen/home.dart';

// ignore: must_be_immutable
class OrderList extends StatefulWidget {
  OrderList({Key? key, required this.page}) : super(key: key);
  int page;

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<String> orderStatus = [
    'All Order',
    'Confirmed',
    'Canceled',
    'Shipped',
    'Delivered'
  ];
  int selectedIndex = 0;
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String token = '';
  bool isLoading = false;
  bool changed = false;

  Future<void> getToken() async {
    SharedPreferences preferences = await _prefs;
    setState(() {
      token = preferences.getString('token')!;
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
          'My Orders',
          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            FutureBuilder<OrderListModel>(
                future: _apiManager.orderList(token, widget.page),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.value!.data!.isNotEmpty) {
                      return Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  snapshot.data?.value?.data?.length ?? 1,
                              itemBuilder: (_, index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ListTile(
                                      leading: Image.network(
                                        snapshot.data?.value?.data?[index]
                                                .product?.images?[0].imageUrl ??
                                            '',
                                        cacheHeight: 200,
                                        cacheWidth: 200,
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data?.value?.data?[index]
                                                    .product?.name ??
                                                '',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '#${snapshot.data?.value?.data?[index].orderId ?? 'order Id'}',
                                                style: kTextStyle.copyWith(
                                                    color: kGreyTextColor),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '$currencyIcon ${snapshot.data?.value?.data?[index].grandTotal ?? 'Sale Price'}',
                                                style: kTextStyle.copyWith(
                                                  color: kMainColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 5,
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.all(
                                                    4.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: kBgColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  child: Text(
                                                    'x${snapshot.data?.value?.data?[index].qty ?? 'quantity'}',
                                                    style: kTextStyle.copyWith(
                                                      color: kRedColor,
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  DateFormat.yMMMd().format(
                                                    DateTime.parse(
                                                      snapshot
                                                              .data
                                                              ?.value
                                                              ?.data?[index]
                                                              .createdAt ??
                                                          DateTime.now()
                                                              .toIso8601String(),
                                                    ),
                                                  ),
                                                  style: kTextStyle.copyWith(
                                                      color: kGreyTextColor),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return Dialog(
                                                          backgroundColor:
                                                              kBgColor,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              20,
                                                            ),
                                                          ),
                                                          child:
                                                              _TrackOrderDialog(
                                                            manifestId: snapshot
                                                                    .data
                                                                    ?.value
                                                                    ?.data?[
                                                                        index]
                                                                    .menifestId
                                                                    .toString() ??
                                                                '',
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Text(
                                                    'Track Order',
                                                    style: kTextStyle.copyWith(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return Dialog(
                                                          backgroundColor:
                                                              kBgColor,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              20,
                                                            ),
                                                          ),
                                                          child:
                                                              _CancelOrderDialog(
                                                            menifestId: snapshot
                                                                    .data
                                                                    ?.value
                                                                    ?.data?[
                                                                        index]
                                                                    .menifestId
                                                                    .toString() ??
                                                                '',
                                                            token: token,
                                                            orderDetailsId: snapshot
                                                                    .data
                                                                    ?.value
                                                                    ?.data?[
                                                                        index]
                                                                    .id
                                                                    .toString() ??
                                                                '',
                                                            description: snapshot
                                                                    .data
                                                                    ?.value
                                                                    ?.data?[
                                                                        index]
                                                                    .id
                                                                    .toString() ??
                                                                '',
                                                            orderId: snapshot
                                                                    .data
                                                                    ?.value
                                                                    ?.data?[
                                                                        index]
                                                                    .orderId
                                                                    .toString() ??
                                                                '',
                                                            productId: snapshot
                                                                    .data
                                                                    ?.value
                                                                    ?.data?[
                                                                        index]
                                                                    .productId
                                                                    .toString() ??
                                                                '',
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Text(
                                                    'Cancel Order',
                                                    style: kTextStyle.copyWith(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                          GestureDetector(
                            onTap: () {
                              int page = widget.page + 1;
                              OrderList(page: page).launch(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'See Previous Orders',
                                style: kTextStyle.copyWith(color: kTitleColor),
                              ).visible(
                                snapshot.data!.value!.lastPage != widget.page,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'images/emptycart.svg',
                            height: context.height() / 2,
                            width: context.width(),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'You Haven\'t ordered any items yet',
                            style: kTextStyle.copyWith(
                                color: kTitleColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ButtonGlobal(
                              buttontext: 'Shop Now',
                              buttonDecoration:
                                  kButtonDecoration.copyWith(color: kMainColor),
                              onPressed: () => const Home().launch(context)),
                        ],
                      );
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }
}

enum TrackingStatus {
  loading,
  loaded,
  error,
}

enum CancellationStatus {
  initial,
  loading,
  loaded,
}

class _TrackOrderDialog extends StatefulWidget {
  const _TrackOrderDialog({
    Key? key,
    required this.manifestId,
  }) : super(key: key);

  final String manifestId;

  @override
  State<_TrackOrderDialog> createState() => _TrackOrderDialogState();
}

class _TrackOrderDialogState extends State<_TrackOrderDialog> {
  void getTackingDetails({
    required String menifestId,
  }) async {
    final ApiManager _apiManager = ApiManager();
    String token = '';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString('token') ?? "";
    try {
      _trackingDetails = await _apiManager.getTrackingDetails(
        menifestId: menifestId,
        token: token,
      );
      if (_trackingDetails != null) {
        _status = TrackingStatus.loaded;
      } else {
        _status = TrackingStatus.error;
        isError = 'Something went wrong!\nPlease try again later...';
      }
      setState(() {});
    } catch (error) {
      _status = TrackingStatus.error;
      isError = 'Something went wrong!\nPlease try again later...';
    }
  }

  @override
  void initState() {
    super.initState();
    getTackingDetails(menifestId: widget.manifestId);
  }

  TrackingStatus _status = TrackingStatus.loading;
  late TrackingOrderResponseModel? _trackingDetails;
  String isError = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: _status == TrackingStatus.loaded
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tracking Order',
                    style: kTextStyle.copyWith(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        if ((_trackingDetails?.statusDate ?? '').isNotEmpty)
                          _trackingStatusBuilder(
                            lable: 'Last Update:',
                            value: _trackingDetails?.statusDate ?? '',
                          ),
                        if ((_trackingDetails?.statusCode ?? '').isNotEmpty)
                          _trackingStatusBuilder(
                            lable: 'Status Code:',
                            value: _trackingDetails?.statusCode ?? '',
                          ),
                        if ((_trackingDetails?.comment ?? '').isNotEmpty)
                          _trackingStatusBuilder(
                            lable: 'Comment:',
                            value: _trackingDetails?.comment ?? '',
                          ),
                        if ((_trackingDetails?.location ?? '').isNotEmpty)
                          _trackingStatusBuilder(
                            lable: 'Location:',
                            value: _trackingDetails?.location ?? '',
                          ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(kMainColor),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Back'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: _status == TrackingStatus.loading
                  ? const CircularProgressIndicator(
                      color: kMainColor,
                    )
                  : _status == TrackingStatus.error
                      ? Column(
                          children: [
                            const Spacer(),
                            Text(
                              isError,
                              textAlign: TextAlign.center,
                              style: kTextStyle.copyWith(
                                color: Colors.red,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                kMainColor),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Back'),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      : null,
            ),
    );
  }

  Padding _trackingStatusBuilder({
    required String lable,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            lable,
            style: kTextStyle.copyWith(
              // fontSize: 18,
              color: kMainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: kTextStyle.copyWith(),
          ),
        ],
      ),
    );
  }
}

class _CancelOrderDialog extends StatefulWidget {
  const _CancelOrderDialog({
    Key? key,
    required this.menifestId,
    required this.token,
    required this.orderDetailsId,
    required this.description,
    required this.productId,
    required this.orderId,
  }) : super(key: key);

  final String menifestId;
  final String token;
  final String orderDetailsId;
  final String description;
  final String productId;
  final String orderId;

  @override
  State<_CancelOrderDialog> createState() => _CancelOrderDialogState();
}

class _CancelOrderDialogState extends State<_CancelOrderDialog> {
  void cancelOrder() async {
    final ApiManager _apiManager = ApiManager();
    setState(() {
      _status = CancellationStatus.loading;
    });
    final cancel = await _apiManager.cancelOrder(
      token: widget.token,
      orderDetailsId: widget.orderDetailsId.toString(),
      description: widget.description.toString(),
      reason: reasonController.text,
      orderId: widget.orderId,
      productId: widget.productId,
    );

    setState(() {
      _status = CancellationStatus.loaded;
      cancellationMessage = cancel?.message.toString() ??
          'Cannot cancel this order at the moment';
    });
  }

  bool isCancelSelected = false;
  CancellationStatus _status = CancellationStatus.initial;
  String cancellationMessage = '';
  TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isCancelSelected ? 350 : 200,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: _status == CancellationStatus.initial
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cancel Order',
                    style: kTextStyle.copyWith(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    isCancelSelected
                        ? 'Please provide a reason to cancel this order:'
                        : 'Are you sure you want to cancel this order?',
                    style: kTextStyle.copyWith(
                      fontSize: 14,
                      color: isCancelSelected ? Colors.red : kMainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (isCancelSelected)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: reasonController,
                        cursorColor: kMainColor,
                        maxLines: 6,
                        style: kTextStyle.copyWith(color: Colors.red),
                        decoration: InputDecoration(
                          hintText: 'Cancellation reason...',
                          hintStyle: kTextStyle.copyWith(
                            color: Colors.red,
                            fontSize: 13,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(kMainColor),
                          ),
                          onPressed: () {
                            if (isCancelSelected) {
                              if (reasonController.text.isEmpty) {
                                return toast(
                                  'Please provide cancellation reason!',
                                  bgColor: Colors.red,
                                );
                              }
                              cancelOrder();
                            } else {
                              isCancelSelected = !isCancelSelected;
                              setState(() {});
                            }
                          },
                          child: Text(
                            isCancelSelected ? 'Cancel this Order' : 'Proceed',
                          ),
                        ),
                      ),
                      if (!isCancelSelected)
                        const SizedBox(
                          width: 10,
                        ),
                      if (!isCancelSelected)
                        Expanded(
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(kMainColor),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Back',
                            ),
                          ),
                        ),
                    ],
                  )
                ],
              )
            : Center(
                child: _status == CancellationStatus.loading
                    ? const CircularProgressIndicator(
                        color: kMainColor,
                      )
                    : Column(
                        children: [
                          Text(
                            'Cancel Order',
                            style: kTextStyle.copyWith(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            cancellationMessage,
                            textAlign: TextAlign.center,
                            style: kTextStyle.copyWith(
                              color: Colors.red,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: const ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll(kMainColor),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Back'),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
              ),
      ),
    );
  }
}
