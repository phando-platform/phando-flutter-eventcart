import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:timeline_tile/timeline_tile.dart';

import './manage_order.dart';
import '../../Models/order_list_model.dart';
import '../../Models/order_timelines_model.dart';
import '../../Services/api_manager.dart';
import '../../constant.dart';

class DeliveryStatus extends StatefulWidget {
  const DeliveryStatus({Key? key, required this.details, required this.orderId})
      : super(key: key);
  final Details details;
  final String orderId;

  @override
  _DeliveryStatusState createState() => _DeliveryStatusState();
}

class _DeliveryStatusState extends State<DeliveryStatus> {
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String token = '';

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
          'Delivery Status',
          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<OrderTimelinesModel>(
          future: _apiManager.getDeliveryStatus(widget.details.id!, token),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              List<Valuet> values = snapshot.data!.value!.reversed.toList();
              int last = values.length;
              String lastUpdate = values.length == last
                  ? values[last - 1].status!.name.toString()
                  : '';
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: context.width() * 2,
                      height: 60.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            TimelineTile(
                              axis: TimelineAxis.horizontal,
                              alignment: TimelineAlign.manual,
                              lineXY: 0.3,
                              isFirst: true,
                              indicatorStyle: const IndicatorStyle(
                                  indicator: Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                                  color: Colors.green,
                                  padding: EdgeInsets.only(right: 4.0)),
                              endChild: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    values[0].status?.name ?? 'Confirmed',
                                    style: kTextStyle.copyWith(
                                        color: kGreyTextColor),
                                  ),
                                ],
                              ),
                              beforeLineStyle: const LineStyle(
                                color: Colors.green,
                              ),
                            ),
                            TimelineTile(
                              axis: TimelineAxis.horizontal,
                              alignment: TimelineAlign.manual,
                              lineXY: 0.3,
                              indicatorStyle: IndicatorStyle(
                                  indicator: Icon(
                                    values.length > 1
                                        ? Icons.check_circle
                                        : FeatherIcons.xCircle,
                                    color: Colors.green,
                                  ),
                                  color: Colors.green,
                                  padding: const EdgeInsets.only(right: 4.0)),
                              endChild: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    values.length > 1
                                        ? values[1].status!.name.toString()
                                        : 'Processing',
                                    style: kTextStyle.copyWith(
                                        color: kGreyTextColor),
                                  ),
                                ],
                              ),
                              beforeLineStyle: const LineStyle(
                                color: Colors.green,
                              ),
                            ),
                            TimelineTile(
                              axis: TimelineAxis.horizontal,
                              alignment: TimelineAlign.manual,
                              lineXY: 0.3,
                              indicatorStyle: IndicatorStyle(
                                  indicator: Icon(
                                    values.length > 2
                                        ? Icons.check_circle
                                        : FeatherIcons.xCircle,
                                    color: Colors.green,
                                  ),
                                  color: Colors.green,
                                  padding: const EdgeInsets.only(right: 4.0)),
                              endChild: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    values.length > 2
                                        ? values[2].status!.name.toString()
                                        : 'Picked',
                                    style: kTextStyle.copyWith(
                                        color: kGreyTextColor),
                                  ),
                                ],
                              ),
                              beforeLineStyle: const LineStyle(
                                color: Colors.green,
                              ),
                            ),
                            TimelineTile(
                              axis: TimelineAxis.horizontal,
                              alignment: TimelineAlign.manual,
                              lineXY: 0.3,
                              indicatorStyle: IndicatorStyle(
                                  indicator: Icon(
                                    values.length > 3
                                        ? Icons.check_circle
                                        : FeatherIcons.xCircle,
                                    color: Colors.green,
                                  ),
                                  color: Colors.green,
                                  padding: const EdgeInsets.only(right: 4.0)),
                              endChild: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    values.length > 3
                                        ? values[3].status!.name.toString()
                                        : 'Shipped',
                                    style: kTextStyle.copyWith(
                                        color: kGreyTextColor),
                                  ),
                                ],
                              ),
                              beforeLineStyle: const LineStyle(
                                color: Colors.green,
                              ),
                            ),
                            TimelineTile(
                              axis: TimelineAxis.horizontal,
                              alignment: TimelineAlign.manual,
                              lineXY: 0.3,
                              isLast: true,
                              indicatorStyle: IndicatorStyle(
                                  indicator: Icon(
                                    values.length == last && values.length > 4
                                        ? Icons.check_circle
                                        : FeatherIcons.xCircle,
                                    color: Colors.green,
                                  ),
                                  color: Colors.green,
                                  padding: const EdgeInsets.only(right: 4.0)),
                              endChild: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    values.length == last && values.length > 4
                                        ? values[last - 1]
                                            .status!
                                            .name
                                            .toString()
                                        : 'Delivered',
                                    style: kTextStyle.copyWith(
                                        color: kGreyTextColor),
                                  ),
                                ],
                              ),
                              beforeLineStyle: const LineStyle(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        width: context.width(),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0)),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            TimelineTile(
                              alignment: TimelineAlign.manual,
                              lineXY: 0.3,
                              isFirst: true,
                              indicatorStyle: const IndicatorStyle(
                                  indicator: Icon(
                                    Icons.check_circle,
                                    color: kMainColor,
                                  ),
                                  color: kMainColor,
                                  padding: EdgeInsets.only(bottom: 4.0)),
                              startChild: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      values[0]
                                              .orderStatDatetime
                                              ?.substring(0, 10) ??
                                          ' ',
                                      style: kTextStyle,
                                    ),
                                    Text(
                                      values[0]
                                              .orderStatDatetime
                                              ?.substring(12, 16) ??
                                          ' ',
                                      style: kTextStyle.copyWith(
                                          color: kGreyTextColor,
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              ),
                              endChild: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      values[0].status?.name ?? 'Confirmed',
                                      style: kTextStyle.copyWith(
                                          color: kTitleColor),
                                    ),
                                    Text(
                                      values[0].orderStatDesc ?? ' ',
                                      style: kTextStyle.copyWith(
                                          color: kGreyTextColor),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                              beforeLineStyle: const LineStyle(
                                color: kMainColor,
                              ),
                            ),
                            TimelineTile(
                              alignment: TimelineAlign.manual,
                              lineXY: 0.3,
                              indicatorStyle: IndicatorStyle(
                                  indicator: Icon(
                                    values.length > 1
                                        ? Icons.check_circle
                                        : FeatherIcons.xCircle,
                                    color: kMainColor,
                                  ),
                                  color: kMainColor,
                                  padding: const EdgeInsets.only(bottom: 4.0)),
                              startChild: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      values.length > 1
                                          ? values[1]
                                              .orderStatDatetime!
                                              .substring(0, 10)
                                          : ' ',
                                      style: kTextStyle,
                                    ),
                                    Text(
                                      values.length > 1
                                          ? values[1]
                                              .orderStatDatetime!
                                              .substring(12, 16)
                                          : ' ',
                                      style: kTextStyle.copyWith(
                                          color: kGreyTextColor,
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              ),
                              endChild: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      values.length > 1
                                          ? values[1].status!.name.toString()
                                          : 'Processing',
                                      style: kTextStyle.copyWith(
                                          color: kTitleColor),
                                    ),
                                    Text(
                                      values.length > 1
                                          ? values[1].orderStatDesc.toString()
                                          : ' ',
                                      style: kTextStyle.copyWith(
                                          color: kGreyTextColor),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                              beforeLineStyle: const LineStyle(
                                color: kMainColor,
                              ),
                            ),
                            TimelineTile(
                              alignment: TimelineAlign.manual,
                              lineXY: 0.3,
                              indicatorStyle: IndicatorStyle(
                                  indicator: Icon(
                                    values.length > 2
                                        ? Icons.check_circle
                                        : FeatherIcons.xCircle,
                                    color: kMainColor,
                                  ),
                                  color: kMainColor,
                                  padding: const EdgeInsets.only(bottom: 4.0)),
                              startChild: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      values.length > 2
                                          ? values[2]
                                              .orderStatDatetime!
                                              .substring(0, 10)
                                          : ' ',
                                      style: kTextStyle,
                                    ),
                                    Text(
                                      values.length > 2
                                          ? values[2]
                                              .orderStatDatetime!
                                              .substring(12, 16)
                                          : ' ',
                                      style: kTextStyle.copyWith(
                                          color: kGreyTextColor,
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              ),
                              endChild: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      values.length > 2
                                          ? values[2].status!.name.toString()
                                          : 'Picked',
                                      style: kTextStyle.copyWith(
                                          color: kTitleColor),
                                    ),
                                    Text(
                                      values.length > 2
                                          ? values[2].orderStatDesc.toString()
                                          : ' ',
                                      style: kTextStyle.copyWith(
                                          color: kGreyTextColor),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                              beforeLineStyle: const LineStyle(
                                color: kMainColor,
                              ),
                            ),
                            TimelineTile(
                              alignment: TimelineAlign.manual,
                              lineXY: 0.3,
                              indicatorStyle: IndicatorStyle(
                                  indicator: Icon(
                                    values.length > 3
                                        ? Icons.check_circle
                                        : FeatherIcons.xCircle,
                                    color: kMainColor,
                                  ),
                                  color: kMainColor,
                                  padding: const EdgeInsets.only(bottom: 4.0)),
                              startChild: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      values.length > 3
                                          ? values[3]
                                              .orderStatDatetime!
                                              .substring(0, 10)
                                          : ' ',
                                      style: kTextStyle,
                                    ),
                                    Text(
                                      values.length > 3
                                          ? values[3]
                                              .orderStatDatetime!
                                              .substring(12, 16)
                                          : ' ',
                                      style: kTextStyle.copyWith(
                                          color: kGreyTextColor,
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              ),
                              endChild: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      values.length > 3
                                          ? values[3].status!.name.toString()
                                          : 'Shipped',
                                      style: kTextStyle.copyWith(
                                          color: kTitleColor),
                                    ),
                                    Text(
                                      values.length > 3
                                          ? values[3].orderStatDesc.toString()
                                          : ' ',
                                      style: kTextStyle.copyWith(
                                          color: kGreyTextColor),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                              beforeLineStyle: const LineStyle(
                                color: kMainColor,
                              ),
                            ),
                            TimelineTile(
                              alignment: TimelineAlign.manual,
                              lineXY: 0.3,
                              isLast: true,
                              indicatorStyle: IndicatorStyle(
                                  indicator: Icon(
                                    values.length == last && values.length > 4
                                        ? Icons.check_circle
                                        : FeatherIcons.xCircle,
                                    color: kMainColor,
                                  ),
                                  color: kMainColor,
                                  padding: const EdgeInsets.only(bottom: 4.0)),
                              startChild: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      values.length == last && values.length > 4
                                          ? values[last - 1]
                                              .orderStatDatetime!
                                              .substring(0, 10)
                                          : ' ',
                                      style: kTextStyle,
                                    ),
                                    Text(
                                      values.length == last && values.length > 4
                                          ? values[last - 1]
                                              .orderStatDatetime!
                                              .substring(12, 16)
                                          : ' ',
                                      style: kTextStyle.copyWith(
                                          color: kGreyTextColor,
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              ),
                              endChild: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      values.length == last && values.length > 4
                                          ? values[last - 1]
                                              .status!
                                              .name
                                              .toString()
                                          : 'Delivered',
                                      style: kTextStyle.copyWith(
                                          color: kTitleColor),
                                    ),
                                    Text(
                                      values.length == last && values.length > 4
                                          ? values[last - 1]
                                              .orderStatDesc
                                              .toString()
                                          : ' ',
                                      style: kTextStyle.copyWith(
                                          color: kGreyTextColor),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                              beforeLineStyle: const LineStyle(
                                color: kMainColor,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            ListTile(
                              /* leading: Image.network(
                                widget.details.product?.images?[0].image ?? '',
                                height: 60.0,
                                width: 60.0,
                              ),*/
                              /*title: Text(
                                widget.details.product?.name ?? '',
                                style: kTextStyle.copyWith(color: kTitleColor),
                              ),*/
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    Text(
                                      currencyIcon +
                                          widget.details.salePrice.toString(),
                                      style: kTextStyle.copyWith(
                                          color: kMainColor),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFDFF5E8),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: Text(
                                        'Manage Order',
                                        style: kTextStyle.copyWith(
                                            color: const Color(0xFF13B249)),
                                      ).onTap(() {
                                        ManageOrder(
                                          details: widget.details,
                                          orderId: widget.orderId,
                                        ).launch(context);
                                      }),
                                    ).visible(lastUpdate != 'CANCELLED'),
                                    Container(
                                      padding: const EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        color: Colors.red.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: Text(
                                        'Cancelled',
                                        style: kTextStyle.copyWith(
                                            color: Colors.red),
                                      ),
                                    ).visible(lastUpdate == 'CANCELLED'),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
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
          }),
    );
  }
}
