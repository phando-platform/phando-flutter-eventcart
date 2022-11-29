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
      'status_date': statusDate,
      'status_time': statusTime,
      'status': status,
      'location': location,
      'status_comment': comment,
      'status_code': statusCode,
    };
  }

  factory TrackingOrderResponseModel.fromMap(Map<String, dynamic> map) {
    return TrackingOrderResponseModel(
      statusDate: map['status_date'] ?? '',
      statusTime: map['status_time'] ?? '',
      status: map['status'] ?? '',
      location: map['location'] ?? '',
      comment: map['status_comment'] ?? '',
      statusCode: map['status_code'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TrackingOrderResponseModel.fromJson(String source) =>
      TrackingOrderResponseModel.fromMap(json.decode(source));
}
