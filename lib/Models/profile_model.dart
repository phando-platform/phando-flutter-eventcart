/// success : true
/// message : "Loaded Successfully"
/// value : {"customer":{"id":18,"first_name":"Prince","last_name":"Mahmud","address":"","mobile":"1767432522","username":"mahmud","email":"mah@mud.com","image":"https://my-bazar.maantheme.com/frontend/img/users/","gender":null,"dob":null},"orders":[{"id":49,"seller_id":1,"user_id":18,"order_id":13,"order_stat":2,"product_id":4,"sale_price":null,"qty":5,"color":"red","size":"XL","discount":null,"tax":null,"shipping_cost":null,"total_shipping_cost":null,"total_price":null,"grand_total":null,"currency_id":13,"exchange_rate":87,"estimated_shipping_days":null,"created_at":"2022-06-01T12:32:37.000000Z","updated_at":"2022-06-01T12:32:37.000000Z"}],"billing":{"id":9,"user_id":18,"first_name":"Prince","last_name":"Mahmud","address_1":"Kamrangirchar","post_code":"1215","user_city":"Dhaka","country_id":20,"mobile":"1767432522","email":null,"is_active":1,"created_at":"2022-06-01T12:16:00.000000Z","updated_at":"2022-06-01T12:16:00.000000Z","deleted_at":null,"country":{"id":20,"name":"BANGLADESH","nick_name":"Bangladesh","iso_no":"BD","iso3_no":"BGD","num_code":50,"phone_code":"880","is_active":1,"created_at":null,"updated_at":"2020-10-09T09:34:40.000000Z"}},"shipping":{"id":6,"user_id":18,"shipping_name":"Prince Mahmud","address_line_one":"Kamrangirchar","address_line_two":"Lalbag","shipping_mobile":"01767432558","shipping_email":null,"shipping_town":"dhaka","shipping_post":"1205","shipping_country_id":19,"note":null,"created_at":"2022-06-01T12:15:55.000000Z","updated_at":"2022-06-02T05:05:48.000000Z","country":{"id":19,"name":"BAHRAIN","nick_name":"Bahrain","iso_no":"BH","iso3_no":"BHR","num_code":48,"phone_code":"973","is_active":1,"created_at":null,"updated_at":"2020-10-09T09:34:40.000000Z"}},"country":{"id":20,"name":"BANGLADESH","nick_name":"Bangladesh","iso_no":"BD","iso3_no":"BGD","num_code":50,"phone_code":"880","is_active":1,"created_at":null,"updated_at":"2020-10-09T09:34:40.000000Z"}}

class ProfileModel {
  ProfileModel({
    bool? success,
    String? message,
    Value? value,
  }) {
    _success = success;
    _message = message;
    _value = value;
  }

  ProfileModel.fromJson(dynamic json) {
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

/// customer : {"id":18,"first_name":"Prince","last_name":"Mahmud","address":"","mobile":"1767432522","username":"mahmud","email":"mah@mud.com","image":"https://my-bazar.maantheme.com/frontend/img/users/","gender":null,"dob":null}
/// orders : [{"id":49,"seller_id":1,"user_id":18,"order_id":13,"order_stat":2,"product_id":4,"sale_price":null,"qty":5,"color":"red","size":"XL","discount":null,"tax":null,"shipping_cost":null,"total_shipping_cost":null,"total_price":null,"grand_total":null,"currency_id":13,"exchange_rate":87,"estimated_shipping_days":null,"created_at":"2022-06-01T12:32:37.000000Z","updated_at":"2022-06-01T12:32:37.000000Z"}]
/// billing : {"id":9,"user_id":18,"first_name":"Prince","last_name":"Mahmud","address_1":"Kamrangirchar","post_code":"1215","user_city":"Dhaka","country_id":20,"mobile":"1767432522","email":null,"is_active":1,"created_at":"2022-06-01T12:16:00.000000Z","updated_at":"2022-06-01T12:16:00.000000Z","deleted_at":null,"country":{"id":20,"name":"BANGLADESH","nick_name":"Bangladesh","iso_no":"BD","iso3_no":"BGD","num_code":50,"phone_code":"880","is_active":1,"created_at":null,"updated_at":"2020-10-09T09:34:40.000000Z"}}
/// shipping : {"id":6,"user_id":18,"shipping_name":"Prince Mahmud","address_line_one":"Kamrangirchar","address_line_two":"Lalbag","shipping_mobile":"01767432558","shipping_email":null,"shipping_town":"dhaka","shipping_post":"1205","shipping_country_id":19,"note":null,"created_at":"2022-06-01T12:15:55.000000Z","updated_at":"2022-06-02T05:05:48.000000Z","country":{"id":19,"name":"BAHRAIN","nick_name":"Bahrain","iso_no":"BH","iso3_no":"BHR","num_code":48,"phone_code":"973","is_active":1,"created_at":null,"updated_at":"2020-10-09T09:34:40.000000Z"}}
/// country : {"id":20,"name":"BANGLADESH","nick_name":"Bangladesh","iso_no":"BD","iso3_no":"BGD","num_code":50,"phone_code":"880","is_active":1,"created_at":null,"updated_at":"2020-10-09T09:34:40.000000Z"}

class Value {
  Value({
    Customer? customer,
    List<Orders>? orders,
    Billing? billing,
    Shipping? shipping,
    Country? country,
  }) {
    _customer = customer;
    _orders = orders;
    _billing = billing;
    _shipping = shipping;
    _country = country;
  }

  Value.fromJson(dynamic json) {
    _customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    if (json['orders'] != null) {
      _orders = [];
      json['orders'].forEach((v) {
        _orders?.add(Orders.fromJson(v));
      });
    }
    _billing =
        json['billing'] != null ? Billing.fromJson(json['billing']) : null;
    _shipping =
        json['shipping'] != null ? Shipping.fromJson(json['shipping']) : null;
    _country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
  }

  Customer? _customer;
  List<Orders>? _orders;
  Billing? _billing;
  Shipping? _shipping;
  Country? _country;

  Customer? get customer => _customer;

  List<Orders>? get orders => _orders;

  Billing? get billing => _billing;

  Shipping? get shipping => _shipping;

  Country? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    if (_orders != null) {
      map['orders'] = _orders?.map((v) => v.toJson()).toList();
    }
    if (_billing != null) {
      map['billing'] = _billing?.toJson();
    }
    if (_shipping != null) {
      map['shipping'] = _shipping?.toJson();
    }
    if (_country != null) {
      map['country'] = _country?.toJson();
    }
    return map;
  }
}

/// id : 20
/// name : "BANGLADESH"
/// nick_name : "Bangladesh"
/// iso_no : "BD"
/// iso3_no : "BGD"
/// num_code : 50
/// phone_code : "880"
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

/// id : 6
/// user_id : 18
/// shipping_name : "Prince Mahmud"
/// address_line_one : "Kamrangirchar"
/// address_line_two : "Lalbag"
/// shipping_mobile : "01767432558"
/// shipping_email : null
/// shipping_town : "dhaka"
/// shipping_post : "1205"
/// shipping_country_id : 19
/// note : null
/// created_at : "2022-06-01T12:15:55.000000Z"
/// updated_at : "2022-06-02T05:05:48.000000Z"
/// country : {"id":19,"name":"BAHRAIN","nick_name":"Bahrain","iso_no":"BH","iso3_no":"BHR","num_code":48,"phone_code":"973","is_active":1,"created_at":null,"updated_at":"2020-10-09T09:34:40.000000Z"}

class Shipping {
  Shipping({
    int? id,
    int? userId,
    String? shippingName,
    String? addressLineOne,
    String? addressLineTwo,
    String? shippingMobile,
    dynamic shippingEmail,
    String? shippingTown,
    String? shippingPost,
    int? shippingCountryId,
    dynamic note,
    String? createdAt,
    String? updatedAt,
    Countrys? country,
  }) {
    _id = id;
    _userId = userId;
    _shippingName = shippingName;
    _addressLineOne = addressLineOne;
    _addressLineTwo = addressLineTwo;
    _shippingMobile = shippingMobile;
    _shippingEmail = shippingEmail;
    _shippingTown = shippingTown;
    _shippingPost = shippingPost;
    _shippingCountryId = shippingCountryId;
    _note = note;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _country = country;
  }

  Shipping.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _shippingName = json['shipping_name'];
    _addressLineOne = json['address_line_one'];
    _addressLineTwo = json['address_line_two'];
    _shippingMobile = json['shipping_mobile'];
    _shippingEmail = json['shipping_email'];
    _shippingTown = json['shipping_town'];
    _shippingPost = json['shipping_post'];
    _shippingCountryId = json['shipping_country_id'];
    _note = json['note'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _country =
        json['country'] != null ? Countrys.fromJson(json['country']) : null;
  }

  int? _id;
  int? _userId;
  String? _shippingName;
  String? _addressLineOne;
  String? _addressLineTwo;
  String? _shippingMobile;
  dynamic _shippingEmail;
  String? _shippingTown;
  String? _shippingPost;
  int? _shippingCountryId;
  dynamic _note;
  String? _createdAt;
  String? _updatedAt;
  Countrys? _country;

  int? get id => _id;

  int? get userId => _userId;

  String? get shippingName => _shippingName;

  String? get addressLineOne => _addressLineOne;

  String? get addressLineTwo => _addressLineTwo;

  String? get shippingMobile => _shippingMobile;

  dynamic get shippingEmail => _shippingEmail;

  String? get shippingTown => _shippingTown;

  String? get shippingPost => _shippingPost;

  int? get shippingCountryId => _shippingCountryId;

  dynamic get note => _note;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Countrys? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['shipping_name'] = _shippingName;
    map['address_line_one'] = _addressLineOne;
    map['address_line_two'] = _addressLineTwo;
    map['shipping_mobile'] = _shippingMobile;
    map['shipping_email'] = _shippingEmail;
    map['shipping_town'] = _shippingTown;
    map['shipping_post'] = _shippingPost;
    map['shipping_country_id'] = _shippingCountryId;
    map['note'] = _note;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_country != null) {
      map['country'] = _country?.toJson();
    }
    return map;
  }
}

/// id : 19
/// name : "BAHRAIN"
/// nick_name : "Bahrain"
/// iso_no : "BH"
/// iso3_no : "BHR"
/// num_code : 48
/// phone_code : "973"
/// is_active : 1
/// created_at : null
/// updated_at : "2020-10-09T09:34:40.000000Z"

class Countrys {
  Countrys({
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

  Countrys.fromJson(dynamic json) {
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

/// id : 9
/// user_id : 18
/// first_name : "Prince"
/// last_name : "Mahmud"
/// address_1 : "Kamrangirchar"
/// post_code : "1215"
/// user_city : "Dhaka"
/// country_id : 20
/// mobile : "1767432522"
/// email : null
/// is_active : 1
/// created_at : "2022-06-01T12:16:00.000000Z"
/// updated_at : "2022-06-01T12:16:00.000000Z"
/// deleted_at : null
/// country : {"id":20,"name":"BANGLADESH","nick_name":"Bangladesh","iso_no":"BD","iso3_no":"BGD","num_code":50,"phone_code":"880","is_active":1,"created_at":null,"updated_at":"2020-10-09T09:34:40.000000Z"}

class Billing {
  Billing({
    int? id,
    int? userId,
    String? firstName,
    String? lastName,
    String? address1,
    String? postCode,
    String? userCity,
    int? countryId,
    String? mobile,
    dynamic email,
    int? isActive,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
    Countryb? country,
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

  Billing.fromJson(dynamic json) {
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
        json['country'] != null ? Countryb.fromJson(json['country']) : null;
  }

  int? _id;
  int? _userId;
  String? _firstName;
  String? _lastName;
  String? _address1;
  String? _postCode;
  String? _userCity;
  int? _countryId;
  String? _mobile;
  dynamic _email;
  int? _isActive;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  Countryb? _country;

  int? get id => _id;

  int? get userId => _userId;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get address1 => _address1;

  String? get postCode => _postCode;

  String? get userCity => _userCity;

  int? get countryId => _countryId;

  String? get mobile => _mobile;

  dynamic get email => _email;

  int? get isActive => _isActive;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  dynamic get deletedAt => _deletedAt;

  Countryb? get country => _country;

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

/// id : 20
/// name : "BANGLADESH"
/// nick_name : "Bangladesh"
/// iso_no : "BD"
/// iso3_no : "BGD"
/// num_code : 50
/// phone_code : "880"
/// is_active : 1
/// created_at : null
/// updated_at : "2020-10-09T09:34:40.000000Z"

class Countryb {
  Countryb({
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

  Countryb.fromJson(dynamic json) {
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

/// id : 49
/// seller_id : 1
/// user_id : 18
/// order_id : 13
/// order_stat : 2
/// product_id : 4
/// sale_price : null
/// qty : 5
/// color : "red"
/// size : "XL"
/// discount : null
/// tax : null
/// shipping_cost : null
/// total_shipping_cost : null
/// total_price : null
/// grand_total : null
/// currency_id : 13
/// exchange_rate : 87
/// estimated_shipping_days : null
/// created_at : "2022-06-01T12:32:37.000000Z"
/// updated_at : "2022-06-01T12:32:37.000000Z"

class Orders {
  Orders({
    int? id,
    int? sellerId,
    int? userId,
    int? orderId,
    int? orderStat,
    int? productId,
    dynamic salePrice,
    int? qty,
    String? color,
    String? size,
    dynamic discount,
    dynamic tax,
    dynamic shippingCost,
    dynamic totalShippingCost,
    dynamic totalPrice,
    dynamic grandTotal,
    int? currencyId,
    int? exchangeRate,
    dynamic estimatedShippingDays,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _sellerId = sellerId;
    _userId = userId;
    _orderId = orderId;
    _orderStat = orderStat;
    _productId = productId;
    _salePrice = salePrice;
    _qty = qty;
    _color = color;
    _size = size;
    _discount = discount;
    _tax = tax;
    _shippingCost = shippingCost;
    _totalShippingCost = totalShippingCost;
    _totalPrice = totalPrice;
    _grandTotal = grandTotal;
    _currencyId = currencyId;
    _exchangeRate = exchangeRate;
    _estimatedShippingDays = estimatedShippingDays;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Orders.fromJson(dynamic json) {
    _id = json['id'];
    _sellerId = json['seller_id'];
    _userId = json['user_id'];
    _orderId = json['order_id'];
    _orderStat = json['order_stat'];
    _productId = json['product_id'];
    _salePrice = json['sale_price'];
    _qty = json['qty'];
    _color = json['color'];
    _size = json['size'];
    _discount = json['discount'];
    _tax = json['tax'];
    _shippingCost = json['shipping_cost'];
    _totalShippingCost = json['total_shipping_cost'];
    _totalPrice = json['total_price'];
    _grandTotal = json['grand_total'];
    _currencyId = json['currency_id'];
    _exchangeRate = json['exchange_rate'];
    _estimatedShippingDays = json['estimated_shipping_days'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  int? _sellerId;
  int? _userId;
  int? _orderId;
  int? _orderStat;
  int? _productId;
  dynamic _salePrice;
  int? _qty;
  String? _color;
  String? _size;
  dynamic _discount;
  dynamic _tax;
  dynamic _shippingCost;
  dynamic _totalShippingCost;
  dynamic _totalPrice;
  dynamic _grandTotal;
  int? _currencyId;
  int? _exchangeRate;
  dynamic _estimatedShippingDays;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;

  int? get sellerId => _sellerId;

  int? get userId => _userId;

  int? get orderId => _orderId;

  int? get orderStat => _orderStat;

  int? get productId => _productId;

  dynamic get salePrice => _salePrice;

  int? get qty => _qty;

  String? get color => _color;

  String? get size => _size;

  dynamic get discount => _discount;

  dynamic get tax => _tax;

  dynamic get shippingCost => _shippingCost;

  dynamic get totalShippingCost => _totalShippingCost;

  dynamic get totalPrice => _totalPrice;

  dynamic get grandTotal => _grandTotal;

  int? get currencyId => _currencyId;

  int? get exchangeRate => _exchangeRate;

  dynamic get estimatedShippingDays => _estimatedShippingDays;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['seller_id'] = _sellerId;
    map['user_id'] = _userId;
    map['order_id'] = _orderId;
    map['order_stat'] = _orderStat;
    map['product_id'] = _productId;
    map['sale_price'] = _salePrice;
    map['qty'] = _qty;
    map['color'] = _color;
    map['size'] = _size;
    map['discount'] = _discount;
    map['tax'] = _tax;
    map['shipping_cost'] = _shippingCost;
    map['total_shipping_cost'] = _totalShippingCost;
    map['total_price'] = _totalPrice;
    map['grand_total'] = _grandTotal;
    map['currency_id'] = _currencyId;
    map['exchange_rate'] = _exchangeRate;
    map['estimated_shipping_days'] = _estimatedShippingDays;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

/// id : 18
/// first_name : "Prince"
/// last_name : "Mahmud"
/// address : ""
/// mobile : "1767432522"
/// username : "mahmud"
/// email : "mah@mud.com"
/// image : "https://my-bazar.maantheme.com/frontend/img/users/"
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
    String? image,
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
    _image = image;
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
  dynamic _gender;
  dynamic _dob;

  int? get id => _id;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get address => _address;

  String? get mobile => _mobile;

  String? get username => _username;

  String? get email => _email;

  String? get image => _image;

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
    map['image'] = _image;
    map['gender'] = _gender;
    map['dob'] = _dob;
    return map;
  }
}
