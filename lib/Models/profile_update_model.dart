/// success : true
/// message : "Profile has been updated"
/// value : {"id":18,"first_name":"Hedley","last_name":"user","address":"","mobile":"8801711306359","username":"mahmud","email":"mah@mud.com","image":"https://my-bazar.maantheme.com/frontend/img/users/","gender":"1","dob":"2011-11-10T18:00:00.000000Z"}

class ProfileUpdateModel {
  ProfileUpdateModel({
      bool? success, 
      String? message, 
      Value? value,}){
    _success = success;
    _message = message;
    _value = value;
}

  ProfileUpdateModel.fromJson(dynamic json) {
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

/// id : 18
/// first_name : "Hedley"
/// last_name : "user"
/// address : ""
/// mobile : "8801711306359"
/// username : "mahmud"
/// email : "mah@mud.com"
/// image : "https://my-bazar.maantheme.com/frontend/img/users/"
/// gender : "1"
/// dob : "2011-11-10T18:00:00.000000Z"

class Value {
  Value({
      int? id, 
      String? firstName, 
      String? lastName, 
      String? address, 
      String? mobile, 
      String? username, 
      String? email, 
      String? image, 
      String? gender, 
      String? dob,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _address = address;
    _mobile = mobile;
    _username = username;
    _email = email;
    _image = image;
    _gender = gender;
    _dob = dob;
}

  Value.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _address = json['address'];
    _mobile = json['mobile'];
    _username = json['username'];
    _email = json['email'];
    _image = json['image'];
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
  String? _image;
  String? _gender;
  String? _dob;

  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get address => _address;
  String? get mobile => _mobile;
  String? get username => _username;
  String? get email => _email;
  String? get image => _image;
  String? get gender => _gender;
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
    map['image'] = _image;
    map['gender'] = _gender;
    map['dob'] = _dob;
    return map;
  }

}