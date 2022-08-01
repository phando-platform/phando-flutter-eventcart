/// success : true
/// error : "Password mismatch"
/// message : "Password has been updated"
/// value : ""

class ChangePasswordModel {
  ChangePasswordModel({
      bool? success, 
      String? error, 
      String? message, 
      String? value,}){
    _success = success;
    _error = error;
    _message = message;
    _value = value;
}

  ChangePasswordModel.fromJson(dynamic json) {
    _success = json['success'];
    _error = json['error'];
    _message = json['message'];
    _value = json['value'];
  }
  bool? _success;
  String? _error;
  String? _message;
  String? _value;

  bool? get success => _success;
  String? get error => _error;
  String? get message => _message;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['error'] = _error;
    map['message'] = _message;
    map['value'] = _value;
    return map;
  }

}