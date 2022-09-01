class OrderCreateResponse {
  bool? success;
  String? message;
  Value? value;

  OrderCreateResponse({this.success, this.message, this.value});

  OrderCreateResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    value = json['value'] != null ? new Value.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    return data;
  }
}

class Value {
  Customer? customer;
  List<Orders>? orders;
  Billing? billing;
  Shipping? shipping;
  Country? country;

  Value(
      {this.customer, this.orders, this.billing, this.shipping, this.country});

  Value.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
    billing =
    json['billing'] != null ? new Billing.fromJson(json['billing']) : null;
    shipping = json['shipping'] != null
        ? new Shipping.fromJson(json['shipping'])
        : null;
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    if (this.billing != null) {
      data['billing'] = this.billing!.toJson();
    }
    if (this.shipping != null) {
      data['shipping'] = this.shipping!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? firstName;
  String? lastName;
  String? address;
  String? mobile;
  String? username;
  String? email;
  String? image;
  Null? gender;
  Null? dob;

  Customer(
      {this.id,
        this.firstName,
        this.lastName,
        this.address,
        this.mobile,
        this.username,
        this.email,
        this.image,
        this.gender,
        this.dob});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    mobile = json['mobile'];
    username = json['username'];
    email = json['email'];
    image = json['image'];
    gender = json['gender'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['username'] = this.username;
    data['email'] = this.email;
    data['image'] = this.image;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    return data;
  }
}

class Orders {
  int? id;
  int? sellerId;
  int? userId;
  String? orderId;
  int? orderStat;
  int? productId;
  int? salePrice;
  int? qty;
  Null? color;
  Null? size;
  int? discount;
  int? tax;
  int? shippingCost;
  int? totalShippingCost;
  int? totalPrice;
  int? grandTotal;
  int? currencyId;
  double? exchangeRate;
  Null? estimatedShippingDays;
  String? createdAt;
  String? updatedAt;

  Orders(
      {this.id,
        this.sellerId,
        this.userId,
        this.orderId,
        this.orderStat,
        this.productId,
        this.salePrice,
        this.qty,
        this.color,
        this.size,
        this.discount,
        this.tax,
        this.shippingCost,
        this.totalShippingCost,
        this.totalPrice,
        this.grandTotal,
        this.currencyId,
        this.exchangeRate,
        this.estimatedShippingDays,
        this.createdAt,
        this.updatedAt});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    userId = json['user_id'];
    orderId = json['order_id'].toString();
    orderStat = json['order_stat'];
    productId = json['product_id'];
    salePrice = json['sale_price'];
    qty = json['qty'];
    color = json['color'];
    size = json['size'];
    discount = json['discount'];
    tax = json['tax'];
    shippingCost = json['shipping_cost'];
    totalShippingCost = json['total_shipping_cost'];
    totalPrice = json['total_price'];
    grandTotal = json['grand_total'];
    currencyId = json['currency_id'];
    exchangeRate = json['exchange_rate'];
    estimatedShippingDays = json['estimated_shipping_days'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seller_id'] = this.sellerId;
    data['user_id'] = this.userId;
    data['order_id'] = this.orderId;
    data['order_stat'] = this.orderStat;
    data['product_id'] = this.productId;
    data['sale_price'] = this.salePrice;
    data['qty'] = this.qty;
    data['color'] = this.color;
    data['size'] = this.size;
    data['discount'] = this.discount;
    data['tax'] = this.tax;
    data['shipping_cost'] = this.shippingCost;
    data['total_shipping_cost'] = this.totalShippingCost;
    data['total_price'] = this.totalPrice;
    data['grand_total'] = this.grandTotal;
    data['currency_id'] = this.currencyId;
    data['exchange_rate'] = this.exchangeRate;
    data['estimated_shipping_days'] = this.estimatedShippingDays;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Billing {
  int? id;
  int? userId;
  String? firstName;
  String? lastName;
  String? address1;
  String? postCode;
  String? userCity;
  int? countryId;
  String? mobile;
  Null? email;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Country? country;

  Billing(
      {this.id,
        this.userId,
        this.firstName,
        this.lastName,
        this.address1,
        this.postCode,
        this.userCity,
        this.countryId,
        this.mobile,
        this.email,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.country});

  Billing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address1 = json['address_1'];
    postCode = json['post_code'];
    userCity = json['user_city'];
    countryId = json['country_id'];
    mobile = json['mobile'];
    email = json['email'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['address_1'] = this.address1;
    data['post_code'] = this.postCode;
    data['user_city'] = this.userCity;
    data['country_id'] = this.countryId;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}

class Country {
  int? id;
  String? name;
  String? nickName;
  String? isoNo;
  String? iso3No;
  int? numCode;
  String? phoneCode;
  int? isActive;
  Null? createdAt;
  String? updatedAt;

  Country(
      {this.id,
        this.name,
        this.nickName,
        this.isoNo,
        this.iso3No,
        this.numCode,
        this.phoneCode,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nickName = json['nick_name'];
    isoNo = json['iso_no'];
    iso3No = json['iso3_no'];
    numCode = json['num_code'];
    phoneCode = json['phone_code'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nick_name'] = this.nickName;
    data['iso_no'] = this.isoNo;
    data['iso3_no'] = this.iso3No;
    data['num_code'] = this.numCode;
    data['phone_code'] = this.phoneCode;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Shipping {
  int? id;
  int? userId;
  String? shippingName;
  String? addressLineOne;
  String? addressLineTwo;
  String? shippingMobile;
  Null? shippingEmail;
  String? shippingTown;
  String? shippingPost;
  int? shippingCountryId;
  Null? note;
  String? createdAt;
  String? updatedAt;
  Country? country;

  Shipping(
      {this.id,
        this.userId,
        this.shippingName,
        this.addressLineOne,
        this.addressLineTwo,
        this.shippingMobile,
        this.shippingEmail,
        this.shippingTown,
        this.shippingPost,
        this.shippingCountryId,
        this.note,
        this.createdAt,
        this.updatedAt,
        this.country});

  Shipping.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shippingName = json['shipping_name'];
    addressLineOne = json['address_line_one'];
    addressLineTwo = json['address_line_two'];
    shippingMobile = json['shipping_mobile'];
    shippingEmail = json['shipping_email'];
    shippingTown = json['shipping_town'];
    shippingPost = json['shipping_post'];
    shippingCountryId = json['shipping_country_id'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['shipping_name'] = this.shippingName;
    data['address_line_one'] = this.addressLineOne;
    data['address_line_two'] = this.addressLineTwo;
    data['shipping_mobile'] = this.shippingMobile;
    data['shipping_email'] = this.shippingEmail;
    data['shipping_town'] = this.shippingTown;
    data['shipping_post'] = this.shippingPost;
    data['shipping_country_id'] = this.shippingCountryId;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}