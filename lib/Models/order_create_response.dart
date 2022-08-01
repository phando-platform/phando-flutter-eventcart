/// success : true
/// message : "Created Successfully"
/// value : {"order":{"order_no":"INV18","discount":null,"coupon_discount":null,"coupon_id":null,"tax":null,"shipping_cost":"100","total_price":"250","currency_id":"13","exchange_rate":"87","shipping_name":"Fendi clark","shipping_address_1":"Morokko city","shipping_address_2":"","shipping_mobile":null,"shipping_email":null,"shipping_post":null,"shipping_town":null,"shipping_country_id":1,"shipping_note":null,"payment_by":"paypal","user_id":18,"user_first_name":"Hedley","user_last_name":"Mckinney","user_address_1":"Rajjastan","user_post_code":null,"user_city":null,"user_country_id":1,"user_mobile":"666125462132","user_email":"customer@event.com","updated_at":"2022-06-02T09:26:22.000000Z","created_at":"2022-06-02T09:26:22.000000Z","id":18},"similarProducts":[{"id":176,"seller_id":1,"category_id":239,"brand_id":null,"name":"Fishing Lines","unit":"Piece","tags":"","minimum_qty":10,"barcode":null,"sku":"MS00174","is_refundable":0,"attributes":"","unit_price":3000,"purchase_price":2700,"sale_price":2700,"discount":300,"quantity":50,"shipping_cost":100,"description":"<ul><li>&nbsp;<br>&nbsp;&nbsp;&nbsp; The heat resistance makes you travel safely in summer.This product comes with very attractive design. The material used in it will meet your expectation and need also. Now with a new look it is even better than before and its quality will definitely meet your desire. So you may take this to bring smile and enjoy the feel of good quality product.<br><br>This product comes with very attractive design. The material used in it \\r\\nwill meet your expectation and need also. Now with a new look it is even\\r\\n better than before and its quality will definitely meet your desire. So\\r\\n you may take this to bring smile and enjoy the feel of good quality \\r\\nproduct.<br><br></li></ul>","pdf_specification":"","meta_title":"Fishing-Lines-","meta_description":null,"meta_image":"","slug":"Fishing-Lines-","total_viewed":6,"is_active":1,"publish_stat":2,"is_wishlisted":false},{"id":136,"seller_id":3,"category_id":117,"brand_id":null,"name":"Men's Suit Blazer","unit":"Piece","tags":"","minimum_qty":10,"barcode":null,"sku":"MS00136","is_refundable":0,"attributes":"","unit_price":5000,"purchase_price":4500,"sale_price":4500,"discount":500,"quantity":10,"shipping_cost":30,"description":"<span style=\\\"color: rgb[0, 0, 0]; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb[255, 255, 255]; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\\\">Demand is the lifestyle with original design &amp; fashionable content providing the younger generation with the inspiration. Demand is and will always be a fashion statement with a difference. The brand's product is a reflection of the attitude, belief, values and lifestyles of our customers.</span>","pdf_specification":"","meta_title":"Mens-Suit-Blazer-","meta_description":null,"meta_image":"","slug":"Mens-Suit-Blazer-","total_viewed":4,"is_active":1,"publish_stat":2,"is_wishlisted":false},{"id":204,"seller_id":1,"category_id":258,"brand_id":null,"name":"Shaving Kits","unit":"Piece","tags":"","minimum_qty":10,"barcode":null,"sku":"MS00198","is_refundable":0,"attributes":"","unit_price":1200,"purchase_price":1150,"sale_price":1150,"discount":50,"quantity":25,"shipping_cost":20,"description":"This product comes with very attractive design. The material used in it will meet your expectation and need also. Now with a new look it is even better than before and its quality will definitely meet your desire. So you may take this to bring smile and enjoy the feel of good quality product.The most popular ultra-light frame material in the world, with super toughness, impact resistance and wear resistance, and heat resistance makes you travel safely in summer.","pdf_specification":"","meta_title":"Shaving-Kits-","meta_description":null,"meta_image":"","slug":"Shaving-Kits-","total_viewed":5,"is_active":1,"publish_stat":2,"is_wishlisted":false},{"id":171,"seller_id":1,"category_id":233,"brand_id":null,"name":"Sports Bicycle","unit":"Piece","tags":"","minimum_qty":10,"barcode":null,"sku":"MS00165","is_refundable":0,"attributes":"","unit_price":20000,"purchase_price":15000,"sale_price":15000,"discount":5000,"quantity":25,"shipping_cost":100,"description":"<ol><li>Specifications of Bicycle for Girls Ladies Baby Cycle for Girls Baby Girls Pink Color Bicycle Phoenix Mp 16\\\" Baby By cycle for Ladies<br>&nbsp;This product comes with very attractive design. The material used in it will meet your expectation and need also. Now with a new look it is even better than before and its quality will definitely meet your desire. So you may take this to bring smile and enjoy the feel of good quality product.<br></li></ol>","pdf_specification":"","meta_title":"Sports-Bicycle-","meta_description":null,"meta_image":"","slug":"Sports-Bicycle-","total_viewed":4,"is_active":1,"publish_stat":2,"is_wishlisted":false},{"id":187,"seller_id":3,"category_id":222,"brand_id":null,"name":"Cotton Brassiere","unit":"Piece","tags":"","minimum_qty":10,"barcode":null,"sku":"MS00185","is_refundable":0,"attributes":"","unit_price":700,"purchase_price":644,"sale_price":650,"discount":50,"quantity":20,"shipping_cost":30,"description":"<ul><li>&nbsp;Good quality and low price: Our mold uses advanced technology and uses high-quality silicon, durable and has a high cost performance. Easy to use: You only need to put any elements you like into the silicone resin mold, such as the gold foil, put it into the mold and wait for a moment to cure, you can easily take it out and decorate it according to your preferences.<br></li></ul>","pdf_specification":"","meta_title":"Cotton-Brassiere-","meta_description":null,"meta_image":"","slug":"Cotton-Brassiere-","total_viewed":6,"is_active":1,"publish_stat":2,"is_wishlisted":false}]}

class OrderCreateResponse {
  OrderCreateResponse({
    bool? success,
    String? message,
    Value? value,
  }) {
    _success = success;
    _message = message;
    _value = value;
  }

  OrderCreateResponse.fromJson(dynamic json) {
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

/// order : {"order_no":"INV18","discount":null,"coupon_discount":null,"coupon_id":null,"tax":null,"shipping_cost":"100","total_price":"250","currency_id":"13","exchange_rate":"87","shipping_name":"Fendi clark","shipping_address_1":"Morokko city","shipping_address_2":"","shipping_mobile":null,"shipping_email":null,"shipping_post":null,"shipping_town":null,"shipping_country_id":1,"shipping_note":null,"payment_by":"paypal","user_id":18,"user_first_name":"Hedley","user_last_name":"Mckinney","user_address_1":"Rajjastan","user_post_code":null,"user_city":null,"user_country_id":1,"user_mobile":"666125462132","user_email":"customer@event.com","updated_at":"2022-06-02T09:26:22.000000Z","created_at":"2022-06-02T09:26:22.000000Z","id":18}
/// similarProducts : [{"id":176,"seller_id":1,"category_id":239,"brand_id":null,"name":"Fishing Lines","unit":"Piece","tags":"","minimum_qty":10,"barcode":null,"sku":"MS00174","is_refundable":0,"attributes":"","unit_price":3000,"purchase_price":2700,"sale_price":2700,"discount":300,"quantity":50,"shipping_cost":100,"description":"<ul><li>&nbsp;<br>&nbsp;&nbsp;&nbsp; The heat resistance makes you travel safely in summer.This product comes with very attractive design. The material used in it will meet your expectation and need also. Now with a new look it is even better than before and its quality will definitely meet your desire. So you may take this to bring smile and enjoy the feel of good quality product.<br><br>This product comes with very attractive design. The material used in it \\r\\nwill meet your expectation and need also. Now with a new look it is even\\r\\n better than before and its quality will definitely meet your desire. So\\r\\n you may take this to bring smile and enjoy the feel of good quality \\r\\nproduct.<br><br></li></ul>","pdf_specification":"","meta_title":"Fishing-Lines-","meta_description":null,"meta_image":"","slug":"Fishing-Lines-","total_viewed":6,"is_active":1,"publish_stat":2,"is_wishlisted":false},{"id":136,"seller_id":3,"category_id":117,"brand_id":null,"name":"Men's Suit Blazer","unit":"Piece","tags":"","minimum_qty":10,"barcode":null,"sku":"MS00136","is_refundable":0,"attributes":"","unit_price":5000,"purchase_price":4500,"sale_price":4500,"discount":500,"quantity":10,"shipping_cost":30,"description":"<span style=\\\"color: rgb[0, 0, 0]; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb[255, 255, 255]; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\\\">Demand is the lifestyle with original design &amp; fashionable content providing the younger generation with the inspiration. Demand is and will always be a fashion statement with a difference. The brand's product is a reflection of the attitude, belief, values and lifestyles of our customers.</span>","pdf_specification":"","meta_title":"Mens-Suit-Blazer-","meta_description":null,"meta_image":"","slug":"Mens-Suit-Blazer-","total_viewed":4,"is_active":1,"publish_stat":2,"is_wishlisted":false},{"id":204,"seller_id":1,"category_id":258,"brand_id":null,"name":"Shaving Kits","unit":"Piece","tags":"","minimum_qty":10,"barcode":null,"sku":"MS00198","is_refundable":0,"attributes":"","unit_price":1200,"purchase_price":1150,"sale_price":1150,"discount":50,"quantity":25,"shipping_cost":20,"description":"This product comes with very attractive design. The material used in it will meet your expectation and need also. Now with a new look it is even better than before and its quality will definitely meet your desire. So you may take this to bring smile and enjoy the feel of good quality product.The most popular ultra-light frame material in the world, with super toughness, impact resistance and wear resistance, and heat resistance makes you travel safely in summer.","pdf_specification":"","meta_title":"Shaving-Kits-","meta_description":null,"meta_image":"","slug":"Shaving-Kits-","total_viewed":5,"is_active":1,"publish_stat":2,"is_wishlisted":false},{"id":171,"seller_id":1,"category_id":233,"brand_id":null,"name":"Sports Bicycle","unit":"Piece","tags":"","minimum_qty":10,"barcode":null,"sku":"MS00165","is_refundable":0,"attributes":"","unit_price":20000,"purchase_price":15000,"sale_price":15000,"discount":5000,"quantity":25,"shipping_cost":100,"description":"<ol><li>Specifications of Bicycle for Girls Ladies Baby Cycle for Girls Baby Girls Pink Color Bicycle Phoenix Mp 16\\\" Baby By cycle for Ladies<br>&nbsp;This product comes with very attractive design. The material used in it will meet your expectation and need also. Now with a new look it is even better than before and its quality will definitely meet your desire. So you may take this to bring smile and enjoy the feel of good quality product.<br></li></ol>","pdf_specification":"","meta_title":"Sports-Bicycle-","meta_description":null,"meta_image":"","slug":"Sports-Bicycle-","total_viewed":4,"is_active":1,"publish_stat":2,"is_wishlisted":false},{"id":187,"seller_id":3,"category_id":222,"brand_id":null,"name":"Cotton Brassiere","unit":"Piece","tags":"","minimum_qty":10,"barcode":null,"sku":"MS00185","is_refundable":0,"attributes":"","unit_price":700,"purchase_price":644,"sale_price":650,"discount":50,"quantity":20,"shipping_cost":30,"description":"<ul><li>&nbsp;Good quality and low price: Our mold uses advanced technology and uses high-quality silicon, durable and has a high cost performance. Easy to use: You only need to put any elements you like into the silicone resin mold, such as the gold foil, put it into the mold and wait for a moment to cure, you can easily take it out and decorate it according to your preferences.<br></li></ul>","pdf_specification":"","meta_title":"Cotton-Brassiere-","meta_description":null,"meta_image":"","slug":"Cotton-Brassiere-","total_viewed":6,"is_active":1,"publish_stat":2,"is_wishlisted":false}]

class Value {
  Value({
    Order? order,
    List<SimilarProducts>? similarProducts,
  }) {
    _order = order;
    _similarProducts = similarProducts;
  }

  Value.fromJson(dynamic json) {
    _order = json['order'] != null ? Order.fromJson(json['order']) : null;
    if (json['similarProducts'] != null) {
      _similarProducts = [];
      json['similarProducts'].forEach((v) {
        _similarProducts?.add(SimilarProducts.fromJson(v));
      });
    }
  }

  Order? _order;
  List<SimilarProducts>? _similarProducts;

  Order? get order => _order;

  List<SimilarProducts>? get similarProducts => _similarProducts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_order != null) {
      map['order'] = _order?.toJson();
    }
    if (_similarProducts != null) {
      map['similarProducts'] =
          _similarProducts?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 176
/// seller_id : 1
/// category_id : 239
/// brand_id : null
/// name : "Fishing Lines"
/// unit : "Piece"
/// tags : ""
/// minimum_qty : 10
/// barcode : null
/// sku : "MS00174"
/// is_refundable : 0
/// attributes : ""
/// unit_price : 3000
/// purchase_price : 2700
/// sale_price : 2700
/// discount : 300
/// quantity : 50
/// shipping_cost : 100
/// description : "<ul><li>&nbsp;<br>&nbsp;&nbsp;&nbsp; The heat resistance makes you travel safely in summer.This product comes with very attractive design. The material used in it will meet your expectation and need also. Now with a new look it is even better than before and its quality will definitely meet your desire. So you may take this to bring smile and enjoy the feel of good quality product.<br><br>This product comes with very attractive design. The material used in it \\r\\nwill meet your expectation and need also. Now with a new look it is even\\r\\n better than before and its quality will definitely meet your desire. So\\r\\n you may take this to bring smile and enjoy the feel of good quality \\r\\nproduct.<br><br></li></ul>"
/// pdf_specification : ""
/// meta_title : "Fishing-Lines-"
/// meta_description : null
/// meta_image : ""
/// slug : "Fishing-Lines-"
/// total_viewed : 6
/// is_active : 1
/// publish_stat : 2
/// is_wishlisted : false

class SimilarProducts {
  SimilarProducts({
    int? id,
    int? sellerId,
    int? categoryId,
    dynamic brandId,
    String? name,
    String? unit,
    String? tags,
    int? minimumQty,
    dynamic barcode,
    String? sku,
    int? isRefundable,
    String? attributes,
    int? unitPrice,
    int? purchasePrice,
    int? salePrice,
    int? discount,
    int? quantity,
    int? shippingCost,
    String? description,
    String? pdfSpecification,
    String? metaTitle,
    dynamic metaDescription,
    String? metaImage,
    String? slug,
    int? totalViewed,
    int? isActive,
    int? publishStat,
    bool? isWishlisted,
  }) {
    _id = id;
    _sellerId = sellerId;
    _categoryId = categoryId;
    _brandId = brandId;
    _name = name;
    _unit = unit;
    _tags = tags;
    _minimumQty = minimumQty;
    _barcode = barcode;
    _sku = sku;
    _isRefundable = isRefundable;
    _attributes = attributes;
    _unitPrice = unitPrice;
    _purchasePrice = purchasePrice;
    _salePrice = salePrice;
    _discount = discount;
    _quantity = quantity;
    _shippingCost = shippingCost;
    _description = description;
    _pdfSpecification = pdfSpecification;
    _metaTitle = metaTitle;
    _metaDescription = metaDescription;
    _metaImage = metaImage;
    _slug = slug;
    _totalViewed = totalViewed;
    _isActive = isActive;
    _publishStat = publishStat;
    _isWishlisted = isWishlisted;
  }

  SimilarProducts.fromJson(dynamic json) {
    _id = json['id'];
    _sellerId = json['seller_id'];
    _categoryId = json['category_id'];
    _brandId = json['brand_id'];
    _name = json['name'];
    _unit = json['unit'];
    _tags = json['tags'];
    _minimumQty = json['minimum_qty'];
    _barcode = json['barcode'];
    _sku = json['sku'];
    _isRefundable = json['is_refundable'];
    _attributes = json['attributes'];
    _unitPrice = json['unit_price'];
    _purchasePrice = json['purchase_price'];
    _salePrice = json['sale_price'];
    _discount = json['discount'];
    _quantity = json['quantity'];
    _shippingCost = json['shipping_cost'];
    _description = json['description'];
    _pdfSpecification = json['pdf_specification'];
    _metaTitle = json['meta_title'];
    _metaDescription = json['meta_description'];
    _metaImage = json['meta_image'];
    _slug = json['slug'];
    _totalViewed = json['total_viewed'];
    _isActive = json['is_active'];
    _publishStat = json['publish_stat'];
    _isWishlisted = json['is_wishlisted'];
  }

  int? _id;
  int? _sellerId;
  int? _categoryId;
  dynamic _brandId;
  String? _name;
  String? _unit;
  String? _tags;
  int? _minimumQty;
  dynamic _barcode;
  String? _sku;
  int? _isRefundable;
  String? _attributes;
  int? _unitPrice;
  int? _purchasePrice;
  int? _salePrice;
  int? _discount;
  int? _quantity;
  int? _shippingCost;
  String? _description;
  String? _pdfSpecification;
  String? _metaTitle;
  dynamic _metaDescription;
  String? _metaImage;
  String? _slug;
  int? _totalViewed;
  int? _isActive;
  int? _publishStat;
  bool? _isWishlisted;

  int? get id => _id;

  int? get sellerId => _sellerId;

  int? get categoryId => _categoryId;

  dynamic get brandId => _brandId;

  String? get name => _name;

  String? get unit => _unit;

  String? get tags => _tags;

  int? get minimumQty => _minimumQty;

  dynamic get barcode => _barcode;

  String? get sku => _sku;

  int? get isRefundable => _isRefundable;

  String? get attributes => _attributes;

  int? get unitPrice => _unitPrice;

  int? get purchasePrice => _purchasePrice;

  int? get salePrice => _salePrice;

  int? get discount => _discount;

  int? get quantity => _quantity;

  int? get shippingCost => _shippingCost;

  String? get description => _description;

  String? get pdfSpecification => _pdfSpecification;

  String? get metaTitle => _metaTitle;

  dynamic get metaDescription => _metaDescription;

  String? get metaImage => _metaImage;

  String? get slug => _slug;

  int? get totalViewed => _totalViewed;

  int? get isActive => _isActive;

  int? get publishStat => _publishStat;

  bool? get isWishlisted => _isWishlisted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['seller_id'] = _sellerId;
    map['category_id'] = _categoryId;
    map['brand_id'] = _brandId;
    map['name'] = _name;
    map['unit'] = _unit;
    map['tags'] = _tags;
    map['minimum_qty'] = _minimumQty;
    map['barcode'] = _barcode;
    map['sku'] = _sku;
    map['is_refundable'] = _isRefundable;
    map['attributes'] = _attributes;
    map['unit_price'] = _unitPrice;
    map['purchase_price'] = _purchasePrice;
    map['sale_price'] = _salePrice;
    map['discount'] = _discount;
    map['quantity'] = _quantity;
    map['shipping_cost'] = _shippingCost;
    map['description'] = _description;
    map['pdf_specification'] = _pdfSpecification;
    map['meta_title'] = _metaTitle;
    map['meta_description'] = _metaDescription;
    map['meta_image'] = _metaImage;
    map['slug'] = _slug;
    map['total_viewed'] = _totalViewed;
    map['is_active'] = _isActive;
    map['publish_stat'] = _publishStat;
    map['is_wishlisted'] = _isWishlisted;
    return map;
  }
}

/// order_no : "INV18"
/// discount : null
/// coupon_discount : null
/// coupon_id : null
/// tax : null
/// shipping_cost : "100"
/// total_price : "250"
/// currency_id : "13"
/// exchange_rate : "87"
/// shipping_name : "Fendi clark"
/// shipping_address_1 : "Morokko city"
/// shipping_address_2 : ""
/// shipping_mobile : null
/// shipping_email : null
/// shipping_post : null
/// shipping_town : null
/// shipping_country_id : 1
/// shipping_note : null
/// payment_by : "paypal"
/// user_id : 18
/// user_first_name : "Hedley"
/// user_last_name : "Mckinney"
/// user_address_1 : "Rajjastan"
/// user_post_code : null
/// user_city : null
/// user_country_id : 1
/// user_mobile : "666125462132"
/// user_email : "customer@event.com"
/// updated_at : "2022-06-02T09:26:22.000000Z"
/// created_at : "2022-06-02T09:26:22.000000Z"
/// id : 18

class Order {
  Order({
    String? orderNo,
    dynamic discount,
    dynamic couponDiscount,
    dynamic couponId,
    dynamic tax,
    String? shippingCost,
    String? totalPrice,
    String? currencyId,
    String? exchangeRate,
    String? shippingName,
    String? shippingAddress1,
    String? shippingAddress2,
    dynamic shippingMobile,
    dynamic shippingEmail,
    dynamic shippingPost,
    dynamic shippingTown,
    int? shippingCountryId,
    dynamic shippingNote,
    String? paymentBy,
    int? userId,
    String? userFirstName,
    String? userLastName,
    String? userAddress1,
    dynamic userPostCode,
    dynamic userCity,
    int? userCountryId,
    String? userMobile,
    String? userEmail,
    String? updatedAt,
    String? createdAt,
    int? id,
  }) {
    _orderNo = orderNo;
    _discount = discount;
    _couponDiscount = couponDiscount;
    _couponId = couponId;
    _tax = tax;
    _shippingCost = shippingCost;
    _totalPrice = totalPrice;
    _currencyId = currencyId;
    _exchangeRate = exchangeRate;
    _shippingName = shippingName;
    _shippingAddress1 = shippingAddress1;
    _shippingAddress2 = shippingAddress2;
    _shippingMobile = shippingMobile;
    _shippingEmail = shippingEmail;
    _shippingPost = shippingPost;
    _shippingTown = shippingTown;
    _shippingCountryId = shippingCountryId;
    _shippingNote = shippingNote;
    _paymentBy = paymentBy;
    _userId = userId;
    _userFirstName = userFirstName;
    _userLastName = userLastName;
    _userAddress1 = userAddress1;
    _userPostCode = userPostCode;
    _userCity = userCity;
    _userCountryId = userCountryId;
    _userMobile = userMobile;
    _userEmail = userEmail;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
  }

  Order.fromJson(dynamic json) {
    _orderNo = json['order_no'];
    _discount = json['discount'];
    _couponDiscount = json['coupon_discount'];
    _couponId = json['coupon_id'];
    _tax = json['tax'];
    _shippingCost = json['shipping_cost'];
    _totalPrice = json['total_price'];
    _currencyId = json['currency_id'];
    _exchangeRate = json['exchange_rate'];
    _shippingName = json['shipping_name'];
    _shippingAddress1 = json['shipping_address_1'];
    _shippingAddress2 = json['shipping_address_2'];
    _shippingMobile = json['shipping_mobile'];
    _shippingEmail = json['shipping_email'];
    _shippingPost = json['shipping_post'];
    _shippingTown = json['shipping_town'];
    _shippingCountryId = json['shipping_country_id'];
    _shippingNote = json['shipping_note'];
    _paymentBy = json['payment_by'];
    _userId = json['user_id'];
    _userFirstName = json['user_first_name'];
    _userLastName = json['user_last_name'];
    _userAddress1 = json['user_address_1'];
    _userPostCode = json['user_post_code'];
    _userCity = json['user_city'];
    _userCountryId = json['user_country_id'];
    _userMobile = json['user_mobile'];
    _userEmail = json['user_email'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }

  String? _orderNo;
  dynamic _discount;
  dynamic _couponDiscount;
  dynamic _couponId;
  dynamic _tax;
  String? _shippingCost;
  String? _totalPrice;
  String? _currencyId;
  String? _exchangeRate;
  String? _shippingName;
  String? _shippingAddress1;
  String? _shippingAddress2;
  dynamic _shippingMobile;
  dynamic _shippingEmail;
  dynamic _shippingPost;
  dynamic _shippingTown;
  int? _shippingCountryId;
  dynamic _shippingNote;
  String? _paymentBy;
  int? _userId;
  String? _userFirstName;
  String? _userLastName;
  String? _userAddress1;
  dynamic _userPostCode;
  dynamic _userCity;
  int? _userCountryId;
  String? _userMobile;
  String? _userEmail;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  String? get orderNo => _orderNo;

  dynamic get discount => _discount;

  dynamic get couponDiscount => _couponDiscount;

  dynamic get couponId => _couponId;

  dynamic get tax => _tax;

  String? get shippingCost => _shippingCost;

  String? get totalPrice => _totalPrice;

  String? get currencyId => _currencyId;

  String? get exchangeRate => _exchangeRate;

  String? get shippingName => _shippingName;

  String? get shippingAddress1 => _shippingAddress1;

  String? get shippingAddress2 => _shippingAddress2;

  dynamic get shippingMobile => _shippingMobile;

  dynamic get shippingEmail => _shippingEmail;

  dynamic get shippingPost => _shippingPost;

  dynamic get shippingTown => _shippingTown;

  int? get shippingCountryId => _shippingCountryId;

  dynamic get shippingNote => _shippingNote;

  String? get paymentBy => _paymentBy;

  int? get userId => _userId;

  String? get userFirstName => _userFirstName;

  String? get userLastName => _userLastName;

  String? get userAddress1 => _userAddress1;

  dynamic get userPostCode => _userPostCode;

  dynamic get userCity => _userCity;

  int? get userCountryId => _userCountryId;

  String? get userMobile => _userMobile;

  String? get userEmail => _userEmail;

  String? get updatedAt => _updatedAt;

  String? get createdAt => _createdAt;

  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_no'] = _orderNo;
    map['discount'] = _discount;
    map['coupon_discount'] = _couponDiscount;
    map['coupon_id'] = _couponId;
    map['tax'] = _tax;
    map['shipping_cost'] = _shippingCost;
    map['total_price'] = _totalPrice;
    map['currency_id'] = _currencyId;
    map['exchange_rate'] = _exchangeRate;
    map['shipping_name'] = _shippingName;
    map['shipping_address_1'] = _shippingAddress1;
    map['shipping_address_2'] = _shippingAddress2;
    map['shipping_mobile'] = _shippingMobile;
    map['shipping_email'] = _shippingEmail;
    map['shipping_post'] = _shippingPost;
    map['shipping_town'] = _shippingTown;
    map['shipping_country_id'] = _shippingCountryId;
    map['shipping_note'] = _shippingNote;
    map['payment_by'] = _paymentBy;
    map['user_id'] = _userId;
    map['user_first_name'] = _userFirstName;
    map['user_last_name'] = _userLastName;
    map['user_address_1'] = _userAddress1;
    map['user_post_code'] = _userPostCode;
    map['user_city'] = _userCity;
    map['user_country_id'] = _userCountryId;
    map['user_mobile'] = _userMobile;
    map['user_email'] = _userEmail;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }
}
