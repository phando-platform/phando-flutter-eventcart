/// success : true
/// message : "Loaded Successfully"
/// value : {"id":4,"user_id":4,"first_name":"Prince","last_name":"Mahmud","address_1":"test","post_code":"5880","user_city":null,"country_id":1,"mobile":"12345678","email":"a@a.com","is_active":1,"created_at":"2022-05-30T06:22:50.000000Z","updated_at":"2022-05-30T06:22:50.000000Z","deleted_at":null,"country":{"id":1,"name":"AFGHANISTAN","nick_name":"Afghanistan","iso_no":"AF","iso3_no":"AFG","num_code":4,"phone_code":"93","is_active":1,"created_at":null,"updated_at":"2020-10-09T09:34:40.000000Z"}}

class BillingInfoModel {
  BillingInfoModel({
    bool? success,
    String? message,
    Value? value,
  }) {
    _success = success;
    _message = message;
    _value = value;
  }

  BillingInfoModel.fromJson(dynamic json) {
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

/// id : 4
/// user_id : 4
/// first_name : "Prince"
/// last_name : "Mahmud"
/// address_1 : "test"
/// post_code : "5880"
/// user_city : null
/// country_id : 1
/// mobile : "12345678"
/// email : "a@a.com"
/// is_active : 1
/// created_at : "2022-05-30T06:22:50.000000Z"
/// updated_at : "2022-05-30T06:22:50.000000Z"
/// deleted_at : null
/// country : {"id":1,"name":"AFGHANISTAN","nick_name":"Afghanistan","iso_no":"AF","iso3_no":"AFG","num_code":4,"phone_code":"93","is_active":1,"created_at":null,"updated_at":"2020-10-09T09:34:40.000000Z"}

class Value {
  Value({
    int? id,
    int? userId,
    String? firstName,
    String? lastName,
    String? address1,
    String? postCode,
    dynamic userCity,
    dynamic countryId,
    String? mobile,
    String? email,
    int? isActive,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
    Country? country,
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
    _country = country;
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
    _country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
  }

  int? _id;
  int? _userId;
  String? _firstName;
  String? _lastName;
  String? _address1;
  String? _postCode;
  dynamic _userCity;
  dynamic _countryId;
  String? _mobile;
  String? _email;
  int? _isActive;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  Country? _country;

  int? get id => _id;

  int? get userId => _userId;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get address1 => _address1;

  String? get postCode => _postCode;

  dynamic get userCity => _userCity;

  dynamic get countryId => _countryId;

  String? get mobile => _mobile;

  String? get email => _email;

  int? get isActive => _isActive;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  dynamic get deletedAt => _deletedAt;

  Country? get country => _country;

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
    if (_country != null) {
      map['country'] = _country?.toJson();
    }
    return map;
  }
}

/// id : 1
/// name : "AFGHANISTAN"
/// nick_name : "Afghanistan"
/// iso_no : "AF"
/// iso3_no : "AFG"
/// num_code : 4
/// phone_code : "93"
/// is_active : 1
/// created_at : null
/// updated_at : "2020-10-09T09:34:40.000000Z"

class Country {
  Country({
    int? id,
    String? name,
    String? nickName,
    String? isoNo,
    String? iso3No,
    int? numCode,
    String? phoneCode,
    int? isActive,
    dynamic createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _nickName = nickName;
    _isoNo = isoNo;
    _iso3No = iso3No;
    _numCode = numCode;
    _phoneCode = phoneCode;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Country.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _nickName = json['nick_name'];
    _isoNo = json['iso_no'];
    _iso3No = json['iso3_no'];
    _numCode = json['num_code'];
    _phoneCode = json['phone_code'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _name;
  String? _nickName;
  String? _isoNo;
  String? _iso3No;
  int? _numCode;
  String? _phoneCode;
  int? _isActive;
  dynamic _createdAt;
  String? _updatedAt;

  int? get id => _id;

  String? get name => _name;

  String? get nickName => _nickName;

  String? get isoNo => _isoNo;

  String? get iso3No => _iso3No;

  int? get numCode => _numCode;

  String? get phoneCode => _phoneCode;

  int? get isActive => _isActive;

  dynamic get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['nick_name'] = _nickName;
    map['iso_no'] = _isoNo;
    map['iso3_no'] = _iso3No;
    map['num_code'] = _numCode;
    map['phone_code'] = _phoneCode;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
