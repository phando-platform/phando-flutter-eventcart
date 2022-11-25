import 'dart:convert';

class TrackingOrderResponseModel {
  final String statusDate;
  final String statusTime;
  final String status;
  final String location;
  final String comment;
  final String statusCode;
  TrackingOrderResponseModel({
    required this.statusDate,
    required this.statusTime,
    required this.status,
    required this.location,
    required this.comment,
    required this.statusCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'StatusDate': statusDate,
      'StatusTime': statusTime,
      'Status': status,
      'Location': location,
      'Comment': comment,
      'StatusCode': statusCode,
    };
  }

  factory TrackingOrderResponseModel.fromMap(Map<String, dynamic> map) {
    return TrackingOrderResponseModel(
      statusDate: map['StatusDate'] ?? '',
      statusTime: map['StatusTime'] ?? '',
      status: map['Status'] ?? '',
      location: map['Location'] ?? '',
      comment: map['Comment'] ?? '',
      statusCode: map['StatusCode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TrackingOrderResponseModel.fromJson(String source) =>
      TrackingOrderResponseModel.fromMap(json.decode(source));
}
