// To parse this JSON data, do
//
//     final checkRazorEnable = checkRazorEnableFromJson(jsonString);

import 'dart:convert';

CheckRazorEnable checkRazorEnableFromJson(String str) =>
    CheckRazorEnable.fromJson(json.decode(str));

String checkRazorEnableToJson(CheckRazorEnable data) =>
    json.encode(data.toJson());

class CheckRazorEnable {
  CheckRazorEnable({
    this.success,
    this.message,
    this.value,
  });

  bool? success;
  String? message;
  Value? value;

  factory CheckRazorEnable.fromJson(Map<String, dynamic> json) =>
      CheckRazorEnable(
        success: json["success"],
        message: json["message"],
        value: json["value"] == null ? null : Value.fromJson(json["value"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "value": value?.toJson(),
      };
}

class Value {
  Value({
    this.payment,
  });

  Payment? payment;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        payment:
            json["payment"] == null ? null : Payment.fromJson(json["payment"]),
      );

  Map<String, dynamic> toJson() => {
        "payment": payment?.toJson(),
      };
}

class Payment {
  Payment({
    this.id,
    this.name,
    this.configuration,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? configuration;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        name: json["name"],
        configuration: json["configuration"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "configuration": configuration,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
