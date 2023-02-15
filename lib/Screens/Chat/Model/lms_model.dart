import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

class LMSModel {
  String? title;
  String? subTitle;
  String? image;
  IconData? icon;
  bool? isCheckList;
  Color? color;

  LMSModel(
      {this.title,
      this.subTitle,
      this.image,
      this.color,
      this.isCheckList = false,
      this.icon});
}

class LMSInboxData {
  int? id;
  String? message;

  LMSInboxData({this.id, this.message});
}
