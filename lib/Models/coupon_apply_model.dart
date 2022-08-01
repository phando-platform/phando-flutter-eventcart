/// success : true
/// message : "Code Verification Successful!"
/// coupon : {"id":1,"type":"product","code":"FREE10","details":{"min_buy":"1000","max_discount":"100","product_id":["75","76","92","282","283","84"]},"qty":100,"discount":20,"discount_type":"percent","start":"2022-06-04T18:00:00.000000Z","end":"2022-06-30T18:00:00.000000Z"}

class CouponApplyModel {
  CouponApplyModel({
      bool? success, 
      String? message, 
      Coupon? coupon,}){
    _success = success;
    _message = message;
    _coupon = coupon;
}

  CouponApplyModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _coupon = json['coupon'] != null ? Coupon.fromJson(json['coupon']) : null;
  }
  bool? _success;
  String? _message;
  Coupon? _coupon;

  bool? get success => _success;
  String? get message => _message;
  Coupon? get coupon => _coupon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_coupon != null) {
      map['coupon'] = _coupon?.toJson();
    }
    return map;
  }

}

/// id : 1
/// type : "product"
/// code : "FREE10"
/// details : {"min_buy":"1000","max_discount":"100","product_id":["75","76","92","282","283","84"]}
/// qty : 100
/// discount : 20
/// discount_type : "percent"
/// start : "2022-06-04T18:00:00.000000Z"
/// end : "2022-06-30T18:00:00.000000Z"

class Coupon {
  Coupon({
      int? id, 
      String? type, 
      String? code, 
      Details? details, 
      int? qty, 
      int? discount, 
      String? discountType, 
      String? start, 
      String? end,}){
    _id = id;
    _type = type;
    _code = code;
    _details = details;
    _qty = qty;
    _discount = discount;
    _discountType = discountType;
    _start = start;
    _end = end;
}

  Coupon.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _code = json['code'];
    _details = json['details'] != null ? Details.fromJson(json['details']) : null;
    _qty = json['qty'];
    _discount = json['discount'];
    _discountType = json['discount_type'];
    _start = json['start'];
    _end = json['end'];
  }
  int? _id;
  String? _type;
  String? _code;
  Details? _details;
  int? _qty;
  int? _discount;
  String? _discountType;
  String? _start;
  String? _end;

  int? get id => _id;
  String? get type => _type;
  String? get code => _code;
  Details? get details => _details;
  int? get qty => _qty;
  int? get discount => _discount;
  String? get discountType => _discountType;
  String? get start => _start;
  String? get end => _end;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['code'] = _code;
    if (_details != null) {
      map['details'] = _details?.toJson();
    }
    map['qty'] = _qty;
    map['discount'] = _discount;
    map['discount_type'] = _discountType;
    map['start'] = _start;
    map['end'] = _end;
    return map;
  }

}

/// min_buy : "1000"
/// max_discount : "100"
/// product_id : ["75","76","92","282","283","84"]

class Details {
  Details({
      String? minBuy, 
      String? maxDiscount, 
      List<String>? productId,}){
    _minBuy = minBuy;
    _maxDiscount = maxDiscount;
    _productId = productId;
}

  Details.fromJson(dynamic json) {
    _minBuy = json['min_buy'];
    _maxDiscount = json['max_discount'];
    _productId = json['product_id'] != null ? json['product_id'].cast<String>() : [];
  }
  String? _minBuy;
  String? _maxDiscount;
  List<String>? _productId;

  String? get minBuy => _minBuy;
  String? get maxDiscount => _maxDiscount;
  List<String>? get productId => _productId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['min_buy'] = _minBuy;
    map['max_discount'] = _maxDiscount;
    map['product_id'] = _productId;
    return map;
  }

}