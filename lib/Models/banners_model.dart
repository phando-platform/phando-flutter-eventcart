/// success : true
/// message : "Loaded Successfully"
/// value : [{"id":8,"category_id":5,"title":"Prime Mall","offer_title":"45% OFF","sub_title":"Winter Fashion Collection","image":"https://my-bazar.maantheme.com/uploads/banners/EyuMRBrHtHqX7bSJx4rkEygBjviWpxT9iCnPHip1.png","target":"_self","type":"banner","description":"BEST COLLECTION BEST DEAL BEST COLLECTION BEST MALL","expire_at":"2025-06-06 22:00:00","is_active":1,"publish_stat":1,"total_click":0,"created_at":"2022-02-05T17:51:33.000000Z","updated_at":"2022-02-16T04:59:36.000000Z","deleted_at":null},{"id":6,"category_id":5,"title":"Power Thursday","offer_title":"20% OFF","sub_title":"Happy Shopping Happy Life","image":"https://my-bazar.maantheme.com/uploads/banners/z4uUksILqtx3hEMKuvLBfD9ntD1Ar8Jz5TBlSPkz.png","target":"_self","type":"banner","description":"Happy Shopping, Happy Life Happy Shopping, Happy Life Happy Shopping, Happy Life","expire_at":"2028-12-20 23:00:00","is_active":1,"publish_stat":1,"total_click":0,"created_at":"2021-12-21T08:47:13.000000Z","updated_at":"2022-02-16T05:11:38.000000Z","deleted_at":null},{"id":5,"category_id":7,"title":"Prime mall","offer_title":"FREE","sub_title":"Makeup Collection Makeup Collection Makeup Collection Makeup Collection","image":"https://my-bazar.maantheme.com/uploads/banners/aPYMlzZICoW5KrMkonUR8W7SdCpouXUVujCrbhJE.jpg","target":"_self","type":"banner","description":null,"expire_at":"2025-01-30 23:00:00","is_active":1,"publish_stat":1,"total_click":0,"created_at":"2021-11-25T04:55:58.000000Z","updated_at":"2022-01-26T09:26:26.000000Z","deleted_at":"2022-01-26 15:26:26"},{"id":2,"category_id":5,"title":"Best Deal","offer_title":"30% OFF","sub_title":"Best Deal Super Collection","image":"https://my-bazar.maantheme.com/uploads/banners/p1Yq2xoHLlhEarlsM72I9EG4uQvu79Gy31NXUie3.png","target":"_self","type":"banner","description":"Best Deal Collection Best Deal  Collection Best Deal Super Collection","expire_at":"2025-01-29 23:00:00","is_active":1,"publish_stat":1,"total_click":0,"created_at":"2021-11-25T04:47:52.000000Z","updated_at":"2022-02-03T03:16:45.000000Z","deleted_at":null},{"id":1,"category_id":5,"title":"Happy shop","offer_title":"Free Shipping","sub_title":"Happy shop Best Quality","image":"https://my-bazar.maantheme.com/uploads/banners/lUqi4iG3v1fPZAVHDfzUpvb3tY2pLdKSxeRUYHrk.png","target":"_parent","type":"banner","description":"Best Deal Super Collection Best Deal Super Collection Best Deal Super Collection","expire_at":"2025-12-04 23:00:00","is_active":1,"publish_stat":1,"total_click":0,"created_at":"2021-11-25T04:40:07.000000Z","updated_at":"2022-02-03T03:28:47.000000Z","deleted_at":null}]

class BannersModel {
  BannersModel({
      bool? success, 
      String? message, 
      List<Value>? value,}){
    _success = success;
    _message = message;
    _value = value;
}

  BannersModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['value'] != null) {
      _value = [];
      json['value'].forEach((v) {
        _value?.add(Value.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  List<Value>? _value;

  bool? get success => _success;
  String? get message => _message;
  List<Value>? get value => _value;

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

/// id : 8
/// category_id : 5
/// title : "Prime Mall"
/// offer_title : "45% OFF"
/// sub_title : "Winter Fashion Collection"
/// image : "https://my-bazar.maantheme.com/uploads/banners/EyuMRBrHtHqX7bSJx4rkEygBjviWpxT9iCnPHip1.png"
/// target : "_self"
/// type : "banner"
/// description : "BEST COLLECTION BEST DEAL BEST COLLECTION BEST MALL"
/// expire_at : "2025-06-06 22:00:00"
/// is_active : 1
/// publish_stat : 1
/// total_click : 0
/// created_at : "2022-02-05T17:51:33.000000Z"
/// updated_at : "2022-02-16T04:59:36.000000Z"
/// deleted_at : null

class Value {
  Value({
      int? id, 
      int? categoryId, 
      String? title, 
      String? offerTitle, 
      String? subTitle, 
      String? image, 
      String? target, 
      String? type, 
      String? description, 
      String? expireAt, 
      int? isActive, 
      int? publishStat, 
      int? totalClick, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt,}){
    _id = id;
    _categoryId = categoryId;
    _title = title;
    _offerTitle = offerTitle;
    _subTitle = subTitle;
    _image = image;
    _target = target;
    _type = type;
    _description = description;
    _expireAt = expireAt;
    _isActive = isActive;
    _publishStat = publishStat;
    _totalClick = totalClick;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
}

  Value.fromJson(dynamic json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _title = json['title'];
    _offerTitle = json['offer_title'];
    _subTitle = json['sub_title'];
    _image = json['image'];
    _target = json['target'];
    _type = json['type'];
    _description = json['description'];
    _expireAt = json['expire_at'];
    _isActive = json['is_active'];
    _publishStat = json['publish_stat'];
    _totalClick = json['total_click'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }
  int? _id;
  int? _categoryId;
  String? _title;
  String? _offerTitle;
  String? _subTitle;
  String? _image;
  String? _target;
  String? _type;
  String? _description;
  String? _expireAt;
  int? _isActive;
  int? _publishStat;
  int? _totalClick;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;

  int? get id => _id;
  int? get categoryId => _categoryId;
  String? get title => _title;
  String? get offerTitle => _offerTitle;
  String? get subTitle => _subTitle;
  String? get image => _image;
  String? get target => _target;
  String? get type => _type;
  String? get description => _description;
  String? get expireAt => _expireAt;
  int? get isActive => _isActive;
  int? get publishStat => _publishStat;
  int? get totalClick => _totalClick;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_id'] = _categoryId;
    map['title'] = _title;
    map['offer_title'] = _offerTitle;
    map['sub_title'] = _subTitle;
    map['image'] = _image;
    map['target'] = _target;
    map['type'] = _type;
    map['description'] = _description;
    map['expire_at'] = _expireAt;
    map['is_active'] = _isActive;
    map['publish_stat'] = _publishStat;
    map['total_click'] = _totalClick;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}