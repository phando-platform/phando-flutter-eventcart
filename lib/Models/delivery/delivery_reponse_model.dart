import 'dart:convert';

class DeliveryResponseModel {
  final bool success;
  final String message;
  final FinalAmount value;
  const DeliveryResponseModel({
    required this.success,
    required this.message,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'value': value.toMap(),
    };
  }

  factory DeliveryResponseModel.fromMap(Map<String, dynamic> map) {
    return DeliveryResponseModel(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      value: FinalAmount.fromMap(map['value']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryResponseModel.fromJson(String source) =>
      DeliveryResponseModel.fromMap(json.decode(source));
}

class FinalAmount {
  final double shippingCost;
  final double subtotal;
  final double grandTotal;
  const FinalAmount({
    required this.shippingCost,
    required this.subtotal,
    required this.grandTotal,
  });

  Map<String, dynamic> toMap() {
    return {
      'shippingCost': shippingCost,
      'subtotal': subtotal,
      'grandTotal': grandTotal,
    };
  }

  factory FinalAmount.fromMap(Map<String, dynamic> map) {
    return FinalAmount(
      shippingCost: map['shippingCost']?.toDouble() ?? 0.0,
      subtotal: map['subtotal']?.toDouble() ?? 0.0,
      grandTotal: map['grandTotal']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory FinalAmount.fromJson(String source) =>
      FinalAmount.fromMap(json.decode(source));
}
