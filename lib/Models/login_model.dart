/// status : "Success"
/// error : "User does not exist"
/// message : "Login Successful"
/// customer : {"id":1,"first_name":"Hedley","last_name":"Mckinney","address":"Rerum obcaecati aliq","mobile":"8801XXXXXXXXX","username":"customer","email":"customer@event.com","gender":1,"dob":"2000-08-30T18:00:00.000000Z"}
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTUxZDdhNGM4YTUyN2VkMWM0OWVkNGU2MmQ0ZTVmOGM3MWFkYjEzMjhmNTFjZWI0NTlmYmY5MzFmYjZjYWNhYjEwMjgxNzUzYWFmMDVjNDQiLCJpYXQiOjE2NTAxNzMyMDMuODI2MTg0MDM0MzQ3NTM0MTc5Njg3NSwibmJmIjoxNjUwMTczMjAzLjgyNjE5MzA5NDI1MzU0MDAzOTA2MjUsImV4cCI6MTY1MDI1OTYwMy43NzExNDcwMTI3MTA1NzEyODkwNjI1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.SrJYeOtYDEgQbIHs0Mjd0JjMDd076tj3FIXyNy7cdY4bCRYSlpvwZSgesHOI0oFYRPC00ZZ5vthZSAKr2Spo6PYjP2sX6taRzwVuQZwSE_uAs19BJKaHbSFNMh-RkaXno6DDJRlMAil2r14qrPjJzjV00I0pWq3U9cJkytuKjMxF9D7vCSYWBt_SnW7NBGj6DKn3LmnLvl1maUocNbC-3RrWFrpwKS04ITZRh1LeSYt08WN-wCHYGnQi4PGWmWAH_QP0l-uA21D5eJpXfNzBVggGDAo96LT3b32Nsw08ogOeKgSDblfsVRqvtvEGM8RxytrG83OhnIx9V-CnAhpHtEWYYIY01nX7liYXnNeBhxVkv2yyheR0jmcAvFuveBHgtKcCMX8GL3mYVdnTqUETlYQdXDr0qe27XmF_PkQebccdwFIT-nNwhkjqmUSWoRgPn6b9lANaHx3Kl0SVyryBD9hLPYpKIsymFsE7J4BJXYlLI4vRa6Xc4fRjd-abjAmL1wEhwDBUONbhIvLks1wACIfqtOVmalN3ZCW-V1BhANCTpnBJBFCnGjc7pIrhkXMNucUbTfScy3jDSdyoSIWH_lcbuhj2CfEJ3C9tpJPj7EIB9aVZRYbtkB6yBsw0bXG4IZyYA-Q3gXx7jAr4J1yp8OzbHJgLkPqct6FkgrCerZ4"
/// token_type : "Bearer"
/// expires_at : "2022-04-18 11:26:43"

class LoginModel {
  LoginModel({
    String? status,
    String? error,
    String? message,
    Customer? customer,
    String? accessToken,
    String? tokenType,
    String? expiresAt,
  }) {
    _status = status;
    _error = error;
    _message = message;
    _customer = customer;
    _accessToken = accessToken;
    _tokenType = tokenType;
    _expiresAt = expiresAt;
  }

  LoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _error = json['error'];
    _message = json['message'];
    _customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _expiresAt = json['expires_at'];
  }
  String? _status;
  String? _error;
  String? _message;
  Customer? _customer;
  String? _accessToken;
  String? _tokenType;
  String? _expiresAt;

  String? get status => _status;
  String? get error => _error;
  String? get message => _message;
  Customer? get customer => _customer;
  String? get accessToken => _accessToken;
  String? get tokenType => _tokenType;
  String? get expiresAt => _expiresAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['error'] = _error;
    map['message'] = _message;
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    map['expires_at'] = _expiresAt;
    return map;
  }
}

/// id : 1
/// first_name : "Hedley"
/// last_name : "Mckinney"
/// address : "Rerum obcaecati aliq"
/// mobile : "8801XXXXXXXXX"
/// username : "customer"
/// email : "customer@event.com"
/// gender : 1
/// dob : "2000-08-30T18:00:00.000000Z"

class Customer {
  Customer({
    int? id,
    String? firstName,
    String? lastName,
    String? address,
    String? mobile,
    String? username,
    String? email,
    int? gender,
    String? dob,
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
  int? _gender;
  String? _dob;

  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get address => _address;
  String? get mobile => _mobile;
  String? get username => _username;
  String? get email => _email;
  int? get gender => _gender;
  String? get dob => _dob;

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
