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
  Carts({
    String? id,
    String? price,
    String? quantity,
    String? color,
    String? size,
    String? shippingCost,
    String? productPriceTotal,
    String? estimatedShippingDays,
  }) {
    _id = id;
    _price = price;
    _quantity = quantity;
    _color = color;
    _size = size;
    _shippingCost = shippingCost;
    _productPriceTotal = productPriceTotal;
    _estimatedShippingDays = estimatedShippingDays;
  }

  Carts.fromJson(dynamic json) {
    _id = json['id'];
    _price = json['price'];
    _quantity = json['quantity'];
    _color = json['color'];
    _size = json['size'];
    _shippingCost = json['shipping_cost'];
    _productPriceTotal = json['product_price_total'];
    _estimatedShippingDays = json['estimated_shipping_days'];
  }

  String? _id;
  String? _price;
  String? _quantity;
  String? _color;
  String? _size;
  String? _shippingCost;
  String? _productPriceTotal;
  String? _estimatedShippingDays;

  String? get id => _id;

  String? get price => _price;

  String? get quantity => _quantity;

  String? get color => _color;

  String? get size => _size;

  String? get shippingCost => _shippingCost;

  // ignore: unnecessary_getters_setters
  String? get productPriceTotal => _productPriceTotal;

  String? get estimatedShippingDays => _estimatedShippingDays;

  set productPriceTotal(dynamic p) {
    _productPriceTotal = p;
  }

  Map<String, String> toJson() {
    final map = <String, String>{};
    map['id'] = _id!;
    map['price'] = _price!;
    map['quantity'] = _quantity!;
    map['color'] = _color!;
    map['size'] = _size!;
    map['shipping_cost'] = _shippingCost!;
    map['product_price_total'] = _productPriceTotal!;
    map['estimated_shipping_days'] = _estimatedShippingDays!;
    return map;
  }
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
  }) {
    _id = id;
    _price = price;
    _quantity = quantity;
    _color = color;
    _size = size;
    _shippingCost = shippingCost;
    _productPriceTotal = productPriceTotal;
    _estimatedShippingDays = estimatedShippingDays;
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
  }

  dynamic _id;
  dynamic _price;
  dynamic _quantity;
  dynamic _color;
  dynamic _size;
  dynamic _shippingCost;
  dynamic _productPriceTotal;
  dynamic _estimatedShippingDays;

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

  set productPriceTotal(dynamic p) {
    _productPriceTotal = p;
  }

  set quantity(dynamic p) {
    _quantity = p;
  }

  Map<String, String> toJson() {
    final map = <String, String>{};
    map['id'] = _id;
    map['price'] = _price;
    map['quantity'] = _quantity;
    map['color'] = _color;
    map['size'] = _size;
    map['shipping_cost'] = _shippingCost;
    map['product_price_total'] = _productPriceTotal;
    map['estimated_shipping_days'] = _estimatedShippingDays;
    return map;
  }
}

/// id : 29
/// exchange_rate : null

class Currency {
  Currency({
    String? id,
    String? exchangeRate,
  }) {
    _id = id;
    _exchangeRate = exchangeRate;
  }

  Currency.fromJson(dynamic json) {
    _id = json['id'];
    _exchangeRate = json['exchange_rate'];
  }

  String? _id;
  String? _exchangeRate;

  String? get id => _id;

  String? get exchangeRate => _exchangeRate;

  Map<String, dynamic> toJson() {
    final map = <String, String>{};
    map['id'] = _id!;
    map['exchange_rate'] = _exchangeRate!;
    return map;
  }
}
