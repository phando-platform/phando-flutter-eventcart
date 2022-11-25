import 'dart:convert';

class BookOrderBodyModel {
  final String orderType;
  final String orderNo;
  final String paymentStatus;
  final String pickupVendor;
  final String pickVendorPhoneNo;
  final String pickVendorAddress;
  final String pickVendorCity;
  final String pickVendorState;
  final String pickVendorPinCode;
  final String customerName;
  final String customerCity;
  final String customerState;
  final String zipCode;
  final String customerAddress;
  final String customerMobileNo;
  final String collectibleAmount;
  final String declaredValue;
  final String billableWeight;
  final String phyWeight;
  final String provider;
  final String orderID;
  final String isCod;
  final String courierCharges;
  final int rateId;
  final String productJson;
  final String customerEmail;
  final String tax;
  final String bP;
  final String cDiscount;
  final String ctoP;
  BookOrderBodyModel({
    required this.orderType,
    required this.orderNo,
    required this.paymentStatus,
    this.pickupVendor = 'Event Cart',
    this.pickVendorPhoneNo = '854432212',
    this.pickVendorAddress = 'B-153, Sector-63, Noida',
    this.pickVendorCity = 'Noida',
    this.pickVendorState = 'Uttar Pradesh',
    this.pickVendorPinCode = '110096',
    required this.customerName,
    required this.customerCity,
    required this.customerState,
    required this.zipCode,
    required this.customerAddress,
    required this.customerEmail,
    required this.customerMobileNo,
    required this.collectibleAmount,
    required this.declaredValue,
    this.billableWeight = '1',
    this.phyWeight = '1',
    required this.provider,
    required this.orderID,
    required this.isCod,
    required this.courierCharges,
    required this.rateId,
    required this.productJson,
    this.tax = '0',
    this.bP = '0',
    required this.cDiscount,
    this.ctoP = '0',
  });

  Map<String, dynamic> toMap() {
    return {
      'OrderType': orderType.toString(),
      'OrderNo': orderNo.toString(),
      'PaymentStatus': paymentStatus.toString(),
      'PickupVendor': pickupVendor.toString(),
      'PickVendorPhoneNo': pickVendorPhoneNo.toString(),
      'PickVendorAddress': pickVendorAddress.toString(),
      'PickVendorCity': pickVendorCity.toString(),
      'PickVendorState': pickVendorState.toString(),
      'PickVendorPinCode': pickVendorPinCode.toString(),
      'CustomerName': customerName.toString(),
      'CustomerCity': customerCity.toString(),
      'CustomerState': customerState.toString(),
      'ZipCode': zipCode.toString(),
      'CustomerAddress': customerAddress.toString(),
      'CustomerMobileNo': customerMobileNo.toString(),
      'CollectibleAmount': collectibleAmount.toString(),
      'DeclaredValue': declaredValue.toString(),
      'BillableWeight': billableWeight.toString(),
      'PhyWeight': phyWeight.toString(),
      'Provider': provider.toString(),
      'OrderID': orderID.toString(),
      'IsCod': isCod.toString(),
      'CourierCharges': courierCharges.toString(),
      'RateId': rateId.toString(),
      'ProductJson': productJson.toString(),
      'CustomerEmail': customerEmail.toString(),
      'Tax': tax.toString(),
      'BP': bP.toString(),
      'CDiscount': cDiscount.toString(),
      'CtoP': ctoP.toString(),
    };
  }

  String toJson() => json.encode(toMap());
}
