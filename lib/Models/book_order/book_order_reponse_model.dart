import 'dart:convert';

class BookOrderResponseModel {
  final int replyCode;
  final String replyMsg;
  final String awbNo;
  BookOrderResponseModel({
    required this.replyCode,
    required this.replyMsg,
    required this.awbNo,
  });

  Map<String, dynamic> toMap() {
    return {
      'ReplyCode': replyCode,
      'ReplyMsg': replyMsg,
      'AWBno': awbNo,
    };
  }

  factory BookOrderResponseModel.fromMap(Map<String, dynamic> map) {
    return BookOrderResponseModel(
      replyCode: map['ReplyCode']?.toInt() ?? 0,
      replyMsg: map['ReplyMsg'] ?? '',
      awbNo: map['AWBno'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BookOrderResponseModel.fromJson(String source) =>
      BookOrderResponseModel.fromMap(json.decode(source));
}
