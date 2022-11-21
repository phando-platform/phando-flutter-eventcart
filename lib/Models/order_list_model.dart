class OrderListModel {
  bool? success;
  String? message;
  Value? value;

  OrderListModel({this.success, this.message, this.value});

  OrderListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    value = json['value'] != null ? Value.fromJson(json['value']) : null;
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
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  int? nextPageUrl;
  String? path;
  int? perPage;
  int? prevPageUrl;
  int? to;
  int? total;

  Value(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Value.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  String? orderNo;
  int? discount;
  int? couponDiscount;
  int? tax;
  int? shippingCost;
  int? totalPrice;
  int? couponId;
  int? currencyId;
  int? exchangeRate;
  String? shippingName;
  String? shippingAddress1;
  String? shippingAddress2;
  String? shippingMobile;
  String? shippingEmail;
  String? shippingPost;
  String? shippingTown;
  int? shippingCountryId;
  String? shippingNote;
  String? paymentBy;
  int? userId;
  String? userFirstName;
  String? userLastName;
  String? userAddress1;
  String? userPostCode;
  String? userCity;
  int? userCountryId;
  String? userMobile;
  String? userEmail;
  String? createdAt;
  String? updatedAt;
  int? grandTotal;
  List<Details>? details;

  Data({
    this.id,
    this.orderNo,
    this.discount,
    this.couponDiscount,
    this.tax,
    this.shippingCost,
    this.totalPrice,
    this.couponId,
    this.currencyId,
    this.exchangeRate,
    this.shippingName,
    this.shippingAddress1,
    this.shippingAddress2,
    this.shippingMobile,
    this.shippingEmail,
    this.shippingPost,
    this.shippingTown,
    this.shippingCountryId,
    this.shippingNote,
    this.paymentBy,
    this.userId,
    this.userFirstName,
    this.userLastName,
    this.userAddress1,
    this.userPostCode,
    this.userCity,
    this.userCountryId,
    this.userMobile,
    this.userEmail,
    this.createdAt,
    this.updatedAt,
    this.details,
    this.grandTotal,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    discount = json['discount'];
    couponDiscount = json['coupon_discount'];
    tax = json['tax'];
    shippingCost = json['shipping_cost'];
    totalPrice = json['total_price'];
    couponId = json['coupon_id'];
    currencyId = json['currency_id'];
    exchangeRate = json['exchange_rate'];
    shippingName = json['shipping_name'];
    shippingAddress1 = json['shipping_address_1'];
    shippingAddress2 = json['shipping_address_2'];
    shippingMobile = json['shipping_mobile'];
    shippingEmail = json['shipping_email'];
    shippingPost = json['shipping_post'];
    shippingTown = json['shipping_town'];
    shippingCountryId = json['shipping_country_id'];
    shippingNote = json['shipping_note'];
    paymentBy = json['payment_by'];
    userId = json['user_id'];
    userFirstName = json['user_first_name'];
    userLastName = json['user_last_name'];
    userAddress1 = json['user_address_1'];
    userPostCode = json['user_post_code'];
    userCity = json['user_city'];
    userCountryId = json['user_country_id'];
    userMobile = json['user_mobile'];
    userEmail = json['user_email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    grandTotal = json['grand_total'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_no'] = this.orderNo;
    data['discount'] = this.discount;
    data['coupon_discount'] = this.couponDiscount;
    data['tax'] = this.tax;
    data['shipping_cost'] = this.shippingCost;
    data['total_price'] = this.totalPrice;
    data['coupon_id'] = this.couponId;
    data['currency_id'] = this.currencyId;
    data['exchange_rate'] = this.exchangeRate;
    data['shipping_name'] = this.shippingName;
    data['shipping_address_1'] = this.shippingAddress1;
    data['shipping_address_2'] = this.shippingAddress2;
    data['shipping_mobile'] = this.shippingMobile;
    data['shipping_email'] = this.shippingEmail;
    data['shipping_post'] = this.shippingPost;
    data['shipping_town'] = this.shippingTown;
    data['shipping_country_id'] = this.shippingCountryId;
    data['shipping_note'] = this.shippingNote;
    data['payment_by'] = this.paymentBy;
    data['user_id'] = this.userId;
    data['user_first_name'] = this.userFirstName;
    data['user_last_name'] = this.userLastName;
    data['user_address_1'] = this.userAddress1;
    data['user_post_code'] = this.userPostCode;
    data['user_city'] = this.userCity;
    data['user_country_id'] = this.userCountryId;
    data['user_mobile'] = this.userMobile;
    data['user_email'] = this.userEmail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int? id;
  int? sellerId;
  int? userId;
  int? orderId;
  int? orderStat;
  int? productId;
  int? salePrice;
  int? qty;
  String? color;
  int? size;
  int? discount;
  int? tax;
  int? shippingCost;
  int? totalShippingCost;
  int? totalPrice;
  int? grandTotal;
  int? currencyId;
  double? exchangeRate;
  int? estimatedShippingDays;
  String? createdAt;
  String? updatedAt;

  Details(
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

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    userId = json['user_id'];
    orderId = json['order_id'];
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

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
