import 'dart:convert';

class RazorPayModel {
  final String orderId;
  final String razorpayKey;
  RazorPayModel({
    required this.orderId,
    required this.razorpayKey,
  });

  Map<String, dynamic> toMap() {
    return {
      'order_id': orderId,
      'RAZORPAY_KEY': razorpayKey,
    };
  }

  factory RazorPayModel.fromMap(Map<String, dynamic> map) {
    return RazorPayModel(
      orderId: map['order_id'] ?? '',
      razorpayKey: map['RAZORPAY_KEY'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RazorPayModel.fromJson(String source) => RazorPayModel.fromMap(json.decode(source));
}
