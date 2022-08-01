/// success : true
/// message : "Loaded Successfully"
/// value : [{"order_stat":7,"order_stat_desc":"Your Order Has Been Cancelled","remarks":null,"order_stat_datetime":"2022-06-08T05:58:57.000000Z","status":{"id":7,"name":"CANCELLED"}},{"order_stat":6,"order_stat_desc":"Your Order Has Been Delivered","remarks":null,"order_stat_datetime":"2022-06-08T05:58:39.000000Z","status":{"id":6,"name":"DELIVERED"}},{"order_stat":5,"order_stat_desc":"Product Has been Shipped","remarks":null,"order_stat_datetime":"2022-06-08T05:56:43.000000Z","status":{"id":5,"name":"SHIPPED"}},{"order_stat":4,"order_stat_desc":"Order Picked","remarks":null,"order_stat_datetime":"2022-06-08T05:49:33.000000Z","status":{"id":4,"name":"PICKED"}},{"order_stat":3,"order_stat_desc":"Order Is Processing","remarks":null,"order_stat_datetime":"2022-06-08T05:48:49.000000Z","status":{"id":3,"name":"PROCESSING"}},{"order_stat":1,"order_stat_desc":"Order Is Pending","remarks":null,"order_stat_datetime":"2022-06-08T05:48:28.000000Z","status":{"id":1,"name":"PENDING"}},{"order_stat":2,"order_stat_desc":"Order placed via cash on delivery","remarks":"","order_stat_datetime":"2022-06-07T05:33:10.000000Z","status":{"id":2,"name":"CONFIRMED"}}]

class OrderTimelinesModel {
  OrderTimelinesModel({
      bool? success, 
      String? message,
      List<Valuet>? value,}){
    _success = success;
    _message = message;
    _value = value;
}

  OrderTimelinesModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['value'] != null) {
      _value = [];
      json['value'].forEach((v) {
        _value?.add(Valuet.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  List<Valuet>? _value;

  bool? get success => _success;
  String? get message => _message;
  List<Valuet>? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_value != null) {
      map['value'] = _value?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// order_stat : 7
/// order_stat_desc : "Your Order Has Been Cancelled"
/// remarks : null
/// order_stat_datetime : "2022-06-08T05:58:57.000000Z"
/// status : {"id":7,"name":"CANCELLED"}

class Valuet {
  Valuet({
      int? orderStat, 
      String? orderStatDesc, 
      dynamic remarks, 
      String? orderStatDatetime, 
      Status? status,}){
    _orderStat = orderStat;
    _orderStatDesc = orderStatDesc;
    _remarks = remarks;
    _orderStatDatetime = orderStatDatetime;
    _status = status;
}

  Valuet.fromJson(dynamic json) {
    _orderStat = json['order_stat'];
    _orderStatDesc = json['order_stat_desc'];
    _remarks = json['remarks'];
    _orderStatDatetime = json['order_stat_datetime'];
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  int? _orderStat;
  String? _orderStatDesc;
  dynamic _remarks;
  String? _orderStatDatetime;
  Status? _status;

  int? get orderStat => _orderStat;
  String? get orderStatDesc => _orderStatDesc;
  dynamic get remarks => _remarks;
  String? get orderStatDatetime => _orderStatDatetime;
  Status? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_stat'] = _orderStat;
    map['order_stat_desc'] = _orderStatDesc;
    map['remarks'] = _remarks;
    map['order_stat_datetime'] = _orderStatDatetime;
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    return map;
  }

}

/// id : 7
/// name : "CANCELLED"

class Status {
  Status({
      int? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Status.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;

  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}