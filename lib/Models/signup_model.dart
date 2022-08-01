/// status : "Success"
/// message : "Registration Successful"
/// customer : {"id":15,"first_name":"Mahmudul","last_name":"Hasan","address":"","mobile":"01767543221","username":"alif","email":"alif@gmail.com","gender":null,"dob":null}
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNzM5MmMzYjZkMzk1NzQ4ZjhkMjQ4NjBlNmQzN2Y4Njc3ODJhYzEwMDA0ZDI3MDEwN2Q3MWU3OTJjMTkwZmI5NDhkNmU0OGYyNjc1YzNhMWIiLCJpYXQiOjE2NTAyNjA3NTIuNDM5NDc2MDEzMTgzNTkzNzUsIm5iZiI6MTY1MDI2MDc1Mi40Mzk0ODc5MzQxMTI1NDg4MjgxMjUsImV4cCI6MTY1MDM0NzE1Mi4zOTMxNDY5OTE3Mjk3MzYzMjgxMjUsInN1YiI6IjE1Iiwic2NvcGVzIjpbXX0.ji9TOTVOTbHw2UHiKp1-0Jp48qmxZEEMYPpI7n_ql6Wnctc5uEit2gZg2SSdBG5ROj4_AknZ801h84_DlVyAfkmIxmkuiDTL7YdCRfFiE1FXNe8hxIVNjjzq2E_1hGow5LDPwMASvtpMBrfXZef7NI545pI3S4qNdJ_buxJlL4dRbaCckNnw8D8ez-lpIksHtHE18r-HAxhwHbKD_xGwVkbCCHPywwwGXsC6GxSmFIvzZb2zrjDbbrpkfudLKZbrzdDV5ufwrdLZbJ3uq7xydHGGJTbxCpykCfXLGbfQa4NC1WqUzqjdJL-R8iZmGQoy4fXUMajk7wbxqueQR2q4SPQOY2YZcI8wE4ptWPYcgSJ-HH-IvOgpctOZjEA2QlNbh05LtX3EmAS-MwiitwCv5msyNugJBC-fUMNGYhF9cxcOyXAmKSpltiJXGwv6Ny4wxs1Yh-nLt60nwfbycFdrZ60kMlA_JG_HbCGKPZzvSSxz9jup_XDFvKFbstBR2twaP-h8CDJHdS7BEfijIesvD_1Jkdi4dbytDYZhnQIOeZsc-Xgcq0WPXMpBmnHYkkGyUD497z11H4webLSENowOg0T_e24pcjlAIAvozkmHl1846U3D5I8MLcDfenb19XGhwCtjw7aWxsKrUX2J8bpZ908kwAnHcLCtFugHuOI8nS8"
/// token_type : "Bearer"
/// expires_at : "2022-04-19 11:45:52"

class SignupModel {
  dynamic _status;
  String? _message;
  Customer? _customer;
  String? _accessToken;
  String? _tokenType;
  String? _expiresAt;
  dynamic _errors;

  SignupModel({
    dynamic status,
    String? message,
    Customer? customer,
    String? accessToken,
    String? tokenType,
    String? expiresAt,
    dynamic errors,
  }) {
    _status = status;
    _message = message;
    _customer = customer;
    _accessToken = accessToken;
    _tokenType = tokenType;
    _expiresAt = expiresAt;
    _errors = errors;
  }

  SignupModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _expiresAt = json['expires_at'];
    _errors = json['errors'];
  }

  dynamic get status => _status;
  String? get message => _message;
  Customer? get customer => _customer;
  String? get accessToken => _accessToken;
  String? get tokenType => _tokenType;
  String? get expiresAt => _expiresAt;
  dynamic get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    map['expires_at'] = _expiresAt;
    map['errors'] = _errors;
    return map;
  }
}

/// id : 15
/// first_name : "Mahmudul"
/// last_name : "Hasan"
/// address : ""
/// mobile : "01767543221"
/// username : "alif"
/// email : "alif@gmail.com"
/// gender : null
/// dob : null

class Customer {
  Customer({
    int? id,
    String? firstName,
    String? lastName,
    String? address,
    String? mobile,
    String? username,
    String? email,
    dynamic gender,
    dynamic dob,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _address = address;
    _mobile = mobile;
    _username = username;
    _email = email;
    _gender = gender;
    _dob = dob;
  }

  Customer.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _address = json['address'];
    _mobile = json['mobile'];
    _username = json['username'];
    _email = json['email'];
    _gender = json['gender'];
    _dob = json['dob'];
  }
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _address;
  String? _mobile;
  String? _username;
  String? _email;
  dynamic _gender;
  dynamic _dob;

  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get address => _address;
  String? get mobile => _mobile;
  String? get username => _username;
  String? get email => _email;
  dynamic get gender => _gender;
  dynamic get dob => _dob;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['address'] = _address;
    map['mobile'] = _mobile;
    map['username'] = _username;
    map['email'] = _email;
    map['gender'] = _gender;
    map['dob'] = _dob;
    return map;
  }
}
