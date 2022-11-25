import 'dart:convert';

class DeliveryBodyModel {
  final int pinCode;
  final int productLenght;
  final int productWidth;
  final int productHeight;
  final double codAmount;
  final int wt;
  final String cT;
  final String billingCity;
  final String billingState;
  final String shippingLocalArea;
  final String shippingCity;
  final String shippingState;

  DeliveryBodyModel({
    required this.pinCode,
    this.productLenght = 0,
    this.productWidth = 0,
    this.productHeight = 0,
    required this.codAmount,
    this.wt = 1,
    this.cT = "S",
    this.billingCity = "Noida",
    this.billingState = 'Uttar pradesh',
    required this.shippingLocalArea,
    required this.shippingCity,
    required this.shippingState,
  });

  Map<String, dynamic> toMap() {
    return {
      'Pincode': pinCode.toString(),
      'L': productLenght.toString(),
      'W': productWidth.toString(),
      'H': productHeight.toString(),
      'CodAmount': codAmount.toString(),
      'Wt': wt.toString(),
      'CT': cT,
      'SCity': billingCity,
      'SState': billingState,
      'RLocalArea': shippingLocalArea,
      'RCity': shippingCity,
      'RState': shippingState,
    };
  }

  String toJson() => json.encode(toMap());

  DeliveryBodyModel copyWith({
    int? pinCode,
    int? productLenght,
    int? productWidth,
    int? productHeight,
    double? codAmount,
    int? wt,
    String? cT,
    String? billingCity,
    String? billingState,
    String? shippingLocalArea,
    String? shippingCity,
    String? shippingState,
  }) {
    return DeliveryBodyModel(
      pinCode: pinCode ?? this.pinCode,
      productLenght: productLenght ?? this.productLenght,
      productWidth: productWidth ?? this.productWidth,
      productHeight: productHeight ?? this.productHeight,
      codAmount: codAmount ?? this.codAmount,
      wt: wt ?? this.wt,
      cT: cT ?? this.cT,
      billingCity: billingCity ?? this.billingCity,
      billingState: billingState ?? this.billingState,
      shippingLocalArea: shippingLocalArea ?? this.shippingLocalArea,
      shippingCity: shippingCity ?? this.shippingCity,
      shippingState: shippingState ?? this.shippingState,
    );
  }
}
