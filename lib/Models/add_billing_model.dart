/// success : true
/// message : "Billing address has been updated"
/// value : {"id":5,"user_id":5,"first_name":"Prince","last_name":"Mahmud","address_1":"road 2, house 4, basundhara","post_code":"234","user_city":"dha","country_id":4,"mobile":"3453456","email":null,"is_active":1,"created_at":"2022-06-01T09:12:17.000000Z","updated_at":"2022-06-01T09:14:11.000000Z","deleted_at":null}

class AddBillingModel {
  AddBillingModel({
    bool? success,
    String? message,
    Value? value,
  }) {
    _success = success;
    _message = message;
    _value = value;
  }

  AddBillingModel.fromJson(dynamic json) {
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

/// id : 5
/// user_id : 5
/// first_name : "Prince"
/// last_name : "Mahmud"
/// address_1 : "road 2, house 4, basundhara"
/// post_code : "234"
/// user_city : "dha"
/// country_id : 4
/// mobile : "3453456"
/// email : null
/// is_active : 1
/// created_at : "2022-06-01T09:12:17.000000Z"
/// updated_at : "2022-06-01T09:14:11.000000Z"
/// deleted_at : null

class Value {
  Value({
    int? id,
    int? userId,
    String? firstName,
    String? lastName,
    String? address1,
    String? postCode,
    String? userCity,
    dynamic countryId,
    String? mobile,
    dynamic email,
    int? isActive,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
  }) {
    _id = id;
    _userId = userId;
    _firstName = firstName;
    _lastName = lastName;
    _address1 = address1;
    _postCode = postCode;
    _userCity = userCity;
    _countryId = countryId;
    _mobile = mobile;
    _email = email;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
  }

  Value.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _address1 = json['address_1'];
    _postCode = json['post_code'];
    _userCity = json['user_city'];
    _countryId = json['country_id'];
    _mobile = json['mobile'];
    _email = json['email'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }

  int? _id;
  int? _userId;
  String? _firstName;
  String? _lastName;
  String? _address1;
  String? _postCode;
  String? _userCity;
  dynamic _countryId;
  String? _mobile;
  dynamic _email;
  int? _isActive;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;

  int? get id => _id;

  int? get userId => _userId;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get address1 => _address1;

  String? get postCode => _postCode;

  String? get userCity => _userCity;

  dynamic get countryId => _countryId;

  String? get mobile => _mobile;

  dynamic get email => _email;

  int? get isActive => _isActive;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['address_1'] = _address1;
    map['post_code'] = _postCode;
    map['user_city'] = _userCity;
    map['country_id'] = _countryId;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }
}
