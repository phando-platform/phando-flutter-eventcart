/// success : true
/// message : "Shipping address has been updated"
/// value : {"user_id":17,"address_line_one":"ds","address_line_two":"dha","shipping_post":"lagbugh","shipping_town":"dhaka","shipping_country_id":"13","shipping_name":"shipping","updated_at":"2022-06-01T11:42:05.000000Z","created_at":"2022-06-01T11:42:05.000000Z","id":5}

class AddShippingModel {
  AddShippingModel({
    bool? success,
    String? message,
    Value? value,
  }) {
    _success = success;
    _message = message;
    _value = value;
  }

  AddShippingModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _value = json['value'] != null ? Value.fromJson(json['value']) : null;
  }

  bool? _success;
  String? _message;
  Value? _value;

  bool? get success => _success;

  String? get message => _message;

  Value? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_value != null) {
      map['value'] = _value?.toJson();
    }
    return map;
  }
}

/// user_id : 17
/// address_line_one : "ds"
/// address_line_two : "dha"
/// shipping_post : "lagbugh"
/// shipping_town : "dhaka"
/// shipping_country_id : "13"
/// shipping_name : "shipping"
/// updated_at : "2022-06-01T11:42:05.000000Z"
/// created_at : "2022-06-01T11:42:05.000000Z"
/// id : 5

class Value {
  Value({
    int? userId,
    String? addressLineOne,
    String? addressLineTwo,
    String? shippingPost,
    String? shippingTown,
    String? shippingCountryId,
    String? shippingName,
    String? updatedAt,
    String? createdAt,
    int? id,
  }) {
    _userId = userId;
    _addressLineOne = addressLineOne;
    _addressLineTwo = addressLineTwo;
    _shippingPost = shippingPost;
    _shippingTown = shippingTown;
    _shippingCountryId = shippingCountryId;
    _shippingName = shippingName;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
  }

  Value.fromJson(dynamic json) {
    _userId = json['user_id'];
    _addressLineOne = json['address_line_one'];
    _addressLineTwo = json['address_line_two'];
    _shippingPost = json['shipping_post'];
    _shippingTown = json['shipping_town'];
    _shippingCountryId = json['shipping_country_id'];
    _shippingName = json['shipping_name'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }

  int? _userId;
  String? _addressLineOne;
  String? _addressLineTwo;
  String? _shippingPost;
  String? _shippingTown;
  String? _shippingCountryId;
  String? _shippingName;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  int? get userId => _userId;

  String? get addressLineOne => _addressLineOne;

  String? get addressLineTwo => _addressLineTwo;

  String? get shippingPost => _shippingPost;

  String? get shippingTown => _shippingTown;

  String? get shippingCountryId => _shippingCountryId;

  String? get shippingName => _shippingName;

  String? get updatedAt => _updatedAt;

  String? get createdAt => _createdAt;

  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['address_line_one'] = _addressLineOne;
    map['address_line_two'] = _addressLineTwo;
    map['shipping_post'] = _shippingPost;
    map['shipping_town'] = _shippingTown;
    map['shipping_country_id'] = _shippingCountryId;
    map['shipping_name'] = _shippingName;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }
}
