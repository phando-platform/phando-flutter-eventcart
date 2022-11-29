import 'dart:convert';

class OrderCreateModel {
  OrderCreateModel({
    String? couponDiscount,
    String? totalShipping,
    String? total,
    String? subTotal,
    String? couponId,
    String? shippingAddressId,
    String? billingAddressId,
    String? paymentBy,
    Currency? currency,
    List<Carts>? cart,
  }) {
    _couponDiscount = couponDiscount;
    _totalShipping = totalShipping;
    _total = total;
    _subTotal = subTotal;
    _couponId = couponId;
    _shippingAddressId = shippingAddressId;
    _billingAddressId = billingAddressId;
    _paymentBy = paymentBy;
    _currency = currency;
    _cart = cart;
  }

  OrderCreateModel.fromJson(dynamic json) {
    _couponDiscount = json['coupon_discount'];
    _totalShipping = json['totalShipping'];
    _total = json['total'];
    _subTotal = json['subTotal'];
    _couponId = json['coupon_id'];
    _shippingAddressId = json['shipping_address_id'];
    _billingAddressId = json['billing_address_id'];
    _paymentBy = json['payment_by'];
    _currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    if (json['cart'] != null) {
      _cart = [];
      json['cart'].forEach((v) {
        _cart?.add(Carts.fromJson(v));
      });
    }
  }

  String? _couponDiscount;
  String? _totalShipping;
  String? _total;
  String? _subTotal;
  String? _couponId;
  String? _shippingAddressId;
  String? _billingAddressId;
  String? _paymentBy;
  Currency? _currency;
  List<Carts>? _cart;

  String? get couponDiscount => _couponDiscount;

  String? get totalShipping => _totalShipping;

  String? get total => _total;

  String? get subTotal => _subTotal;

  String? get couponId => _couponId;

  String? get shippingAddressId => _shippingAddressId;

  String? get billingAddressId => _billingAddressId;

  String? get paymentBy => _paymentBy;

  Currency? get currency => _currency;

  List<Carts>? get cart => _cart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coupon_discount'] = _couponDiscount;
    map['totalShipping'] = _totalShipping;
    map['total'] = _total;
    map['subTotal'] = _subTotal;
    map['coupon_id'] = _couponId;
    map['shipping_address_id'] = _shippingAddressId;
    map['billing_address_id'] = _billingAddressId;
    map['payment_by'] = _paymentBy;
    if (_currency != null) {
      map['currency'] = _currency?.toJson();
    }
    if (_cart != null) {
      map['cart'] = _cart?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 43
/// price : null
/// quantity : 1
/// color : null
/// size : null
/// shipping_cost : null
/// product_price_total : null
/// estimated_shipping_days : null

class Carts {
  String? id;
  String? price;
  String? quantity;
  String? color;
  String? size;
  String? shippingCost;
  String? productPriceTotal;
  String? estimatedShippingDays;
  String? minQuantity;
  Carts({
    this.id,
    this.price,
    this.quantity,
    this.color,
    this.size,
    this.shippingCost,
    this.productPriceTotal,
    this.estimatedShippingDays,
    this.minQuantity,
  });

  // String? get id => _id;

  // String? get price => _price;

  // String? get quantity => _quantity;

  // String? get color => _color;

  // String? get size => _size;

  // String? get shippingCost => _shippingCost;

  // // ignore: unnecessary_getters_setters
  // String? get productPriceTotal => _productPriceTotal;

  // String? get estimatedShippingDays => _estimatedShippingDays;
  // String? get minQuantity => _minQuantity;

  // set productPriceTotal(dynamic p) {
  //   _productPriceTotal = p;
  // }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'quantity': quantity,
      'color': color,
      'size': size,
      'shipping_cost': shippingCost,
      'product_price_total': productPriceTotal,
      'estimated_shipping_days': estimatedShippingDays,
      'min_quantity': minQuantity,
    };
  }

  factory Carts.fromMap(Map<String, dynamic> map) {
    return Carts(
      id: map['id'],
      price: map['price'],
      quantity: map['quantity'],
      color: map['color'],
      size: map['size'],
      shippingCost: map['shipping_cost'],
      productPriceTotal: map['product_price_total'],
      estimatedShippingDays: map['estimated_shipping_days'],
      minQuantity: map['min_quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Carts.fromJson(String source) => Carts.fromMap(json.decode(source));
}

class Cart {
  Cart({
    dynamic id,
    dynamic price,
    dynamic quantity,
    dynamic color,
    dynamic size,
    dynamic shippingCost,
    dynamic productPriceTotal,
    dynamic estimatedShippingDays,
    dynamic minQuantity,
  }) {
    _id = id;
    _price = price;
    _quantity = quantity;
    _color = color;
    _size = size;
    _shippingCost = shippingCost;
    _productPriceTotal = productPriceTotal;
    _estimatedShippingDays = estimatedShippingDays;
    _minQuantity = minQuantity;
  }

  Cart.fromJson(dynamic json) {
    _id = json['id'];
    _price = json['price'];
    _quantity = json['quantity'];
    _color = json['color'];
    _size = json['size'];
    _shippingCost = json['shipping_cost'];
    _productPriceTotal = json['product_price_total'];
    _estimatedShippingDays = json['estimated_shipping_days'];
    _minQuantity = json['minimum_qty'];
  }

  dynamic _id;
  dynamic _price;
  dynamic _quantity;
  dynamic _color;
  dynamic _size;
  dynamic _shippingCost;
  dynamic _productPriceTotal;
  dynamic _estimatedShippingDays;
  dynamic _minQuantity;

  dynamic get id => _id;

  dynamic get price => _price;

  // ignore: unnecessary_getters_setters
  dynamic get quantity => _quantity;

  dynamic get color => _color;

  dynamic get size => _size;

  dynamic get shippingCost => _shippingCost;

  // ignore: unnecessary_getters_setters
  dynamic get productPriceTotal => _productPriceTotal;

  dynamic get estimatedShippingDays => _estimatedShippingDays;
  dynamic get minQuantity => _minQuantity;

  set productPriceTotal(dynamic p) {
    _productPriceTotal = p;
  }

  set quantity(dynamic p) {
    _quantity = p;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['price'] = _price;
    map['quantity'] = _quantity;
    map['color'] = _color;
    map['size'] = _size;
    map['shipping_cost'] = _shippingCost;
    map['product_price_total'] = _productPriceTotal;
    map['estimated_shipping_days'] = _estimatedShippingDays;
    map['minimum_qty'] = _minQuantity;
    return map;
  }
}

class Currency {
  String? id;
  String? exchangeRate;
  Currency({
    this.id,
    this.exchangeRate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'exchange_rate': exchangeRate,
    };
  }

  factory Currency.fromMap(Map<String, dynamic> map) {
    return Currency(
      id: map['id'],
      exchangeRate: map['exchange_rate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Currency.fromJson(String source) =>
      Currency.fromMap(json.decode(source));
}

class CreateOrderBody {
  final String first_name;
  final String last_name;
  final String user_address_1;
  final String user_mobile;
  final String user_email;
  final String user_post_code;
  final String user_city;
  final String user_country_id;
  final String shipping_name;
  final String shipping_mobile;
  final String shipping_email;
  final String shipping_post;
  final String shipping_town;
  final String shipping_state;
  final String address_line_one;
  final String shipping_country_id;
  final String payment_by;
  final String subTotal;
  final String totalShipping;
  final String total;
  final Currency currency;
  final List<Carts> cart;

  CreateOrderBody({
    required this.first_name,
    required this.last_name,
    required this.user_address_1,
    required this.user_mobile,
    required this.user_email,
    required this.user_post_code,
    required this.user_city,
    required this.user_country_id,
    required this.shipping_name,
    required this.shipping_mobile,
    required this.shipping_email,
    required this.shipping_post,
    required this.shipping_town,
    required this.shipping_state,
    required this.address_line_one,
    required this.shipping_country_id,
    required this.payment_by,
    required this.subTotal,
    required this.totalShipping,
    required this.total,
    required this.currency,
    required this.cart,
  });

  Map<String, dynamic> toMap() {
    return {
      'first_name': first_name,
      'last_name': last_name,
      'user_address_1': user_address_1,
      'user_mobile': user_mobile,
      'user_email': user_email,
      'user_post_code': user_post_code,
      'user_city': user_city,
      'user_country_id': user_country_id,
      'shipping_name': shipping_name,
      'shipping_mobile': shipping_mobile,
      'shipping_email': shipping_email,
      'shipping_post': shipping_post,
      'shipping_town': shipping_town,
      'shipping_state': shipping_state,
      'address_line_one': address_line_one,
      'shipping_country_id': shipping_country_id,
      'payment_by': payment_by,
      'subTotal': subTotal,
      'totalShipping': totalShipping,
      'total': total,
      'currency': currency.toMap(),
      'cart': cart.map((x) => x.toMap()).toList(),
    };
  }

  factory CreateOrderBody.fromMap(Map<String, dynamic> map) {
    return CreateOrderBody(
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      user_address_1: map['user_address_1'] ?? '',
      user_mobile: map['user_mobile'] ?? '',
      user_email: map['user_email'] ?? '',
      user_post_code: map['user_post_code'] ?? '',
      user_city: map['user_city'] ?? '',
      user_country_id: map['user_country_id'] ?? '',
      shipping_name: map['shipping_name'] ?? '',
      shipping_mobile: map['shipping_mobile'] ?? '',
      shipping_email: map['shipping_email'] ?? '',
      shipping_post: map['shipping_post'] ?? '',
      shipping_town: map['shipping_town'] ?? '',
      shipping_state: map['shipping_state'] ?? '',
      address_line_one: map['address_line_one'] ?? '',
      shipping_country_id: map['shipping_country_id'] ?? '',
      payment_by: map['payment_by'] ?? '',
      subTotal: map['subTotal'] ?? '',
      totalShipping: map['totalShipping'] ?? '',
      total: map['total'] ?? '',
      currency: Currency.fromMap(map['currency']),
      cart: List<Carts>.from(map['cart']?.map((x) => Carts.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateOrderBody.fromJson(String source) =>
      CreateOrderBody.fromMap(json.decode(source));
}
