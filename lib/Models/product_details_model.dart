/// success : true
/// message : "Loaded Successfully"
/// value : {"id":234,"seller_id":1,"category_id":199,"brand_id":null,"name":"Baby Products","unit":"Piece","tags":"","minimum_qty":10,"barcode":null,"sku":"MS00233","is_refundable":0,"attributes":null,"unit_price":500,"purchase_price":450,"sale_price":450,"discount":50,"quantity":20,"shipping_cost":30,"description":"<ul><li>It uses reliable ABS housing materials. Ergonomically designed, the firm grip makes it easy for even naughty children.Advanced Technology for Excellent Performance Goodbaby Thermometer is backed by clinical validated and recommended by the pediatrician.<br>&nbsp;&nbsp;&nbsp; Fast and Easy Temperatures Readings: Taking your family’s temperature with this digital thermometer is as simple as pointing, and pressing a button. It uses infrared technology and can show readings in Celsius or Fahrenheit.<br>&nbsp;&nbsp;&nbsp; Multi-mode Thermometer: The digital thermometer is designed for all ages, adults, infants, and elders. It not only supports the forehead function but is able to take room/object temperature.<br>&nbsp;&nbsp;&nbsp; Reliable and Accurate: Our forehead thermometer has been clinically tested and found to be a fast and absolutely reliable gadget to use. It is ideal for forehead readings and has a very small error margin.<br></li></ul>","pdf_specification":null,"meta_title":"Baby-Products-","meta_description":null,"meta_image":null,"slug":"Baby-Products","total_viewed":23,"is_active":1,"publish_stat":2,"is_wishlisted":false,"images":[{"id":725,"product_id":234,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/Rp2sFH1oWTzwR0P9W4YgJkdwrRGte13CJRBoZZqO.png"}],"details":{"id":233,"product_id":234,"is_free_shipping":0,"is_flat_rate":0,"is_product_wise_shipping":0,"is_quantity_multiply":0,"warning_quantity":5,"is_show_stock_quantity":1,"is_show_stock_with_text_only":0,"is_hide_stock":0,"is_cash_on_delivery":1,"is_featured":1,"is_todays_deal":0,"is_best_sell":1,"flash_deal_title":null,"flash_deal_discount":null,"flash_deal_discount_type":null,"estimated_shipping_days":"3-7 days","vat":0,"tax":0},"category":{"id":199,"name":"Mother & Baby","category_id":139,"order":1,"icon":"https://my-bazar.maantheme.com/uploads/categories/32x32/QT9o7v8OYkaJSBmYIZsWXtvzBV0F3lD6SdELkJHo.png","banner":"https://my-bazar.maantheme.com/uploads/categories/200x200/C5KRo2arNA97Jsqf1LKz0wfS7gTaHVKs69SNcrRh.png","meta_title":"Commercial Furniture","meta_description":"lorem isu dolor sumite","slug":"commercial-furniture-9","commission_rate":0,"show_in_home":0,"is_active":1},"brand":null,"seller":{"id":1,"company_name":"Online Park","first_name":"Online","last_name":"Park","image":"YsnkP5XCUMe6RZKNUx5tRIvzFOuJD8xPZFjlxPSR.png","mobile":"01xxxxxxx","email":"seller@event.com","gender":1,"address":"Bongshal,Dhaka","business_address":"Bangshal Dhaka","business_email":"onlinepark@gmail.com","business_mobile":"01854432212","post_code":"1000","city":"Dhaka","nid_no":null,"passport_no":null,"domain_name":"http://mybazarupdate.maantheme.com/","domain_ssl_stat":0,"is_active":1,"is_approve":1,"is_suspended":0},"colors":[{"id":1,"name":"Red","hex":"#ff0000","display_in_search":1,"is_active":1,"created_at":null,"updated_at":null,"pivot":{"product_id":234,"color_id":1}},{"id":2,"name":"Blue","hex":"#0000ff","display_in_search":1,"is_active":1,"created_at":null,"updated_at":null,"pivot":{"product_id":234,"color_id":2}},{"id":3,"name":"Green","hex":"#008000","display_in_search":1,"is_active":1,"created_at":null,"updated_at":null,"pivot":{"product_id":234,"color_id":3}},{"id":4,"name":"Orange","hex":"#ffa500","display_in_search":1,"is_active":1,"created_at":null,"updated_at":null,"pivot":{"product_id":234,"color_id":4}}],"sizes":[{"id":1,"name":"S","display_in_search":0,"is_active":1,"created_at":"2022-04-14T22:00:29.000000Z","updated_at":"2022-04-14T22:00:29.000000Z","pivot":{"product_id":234,"size_id":1}},{"id":3,"name":"L","display_in_search":0,"is_active":1,"created_at":"2022-04-14T22:00:29.000000Z","updated_at":"2022-04-14T22:00:29.000000Z","pivot":{"product_id":234,"size_id":3}},{"id":4,"name":"XL","display_in_search":0,"is_active":1,"created_at":"2022-04-14T22:00:29.000000Z","updated_at":"2022-04-14T22:00:29.000000Z","pivot":{"product_id":234,"size_id":4}}]}

class ProductDetailsModel {
  ProductDetailsModel({
    bool? success,
    String? message,
    Value? value,
  }) {
    _success = success;
    _message = message;
    _value = value;
  }

  ProductDetailsModel.fromJson(dynamic json) {
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

/// id : 234
/// seller_id : 1
/// category_id : 199
/// brand_id : null
/// name : "Baby Products"
/// unit : "Piece"
/// tags : ""
/// minimum_qty : 10
/// barcode : null
/// sku : "MS00233"
/// is_refundable : 0
/// attributes : null
/// unit_price : 500
/// purchase_price : 450
/// sale_price : 450
/// discount : 50
/// quantity : 20
/// shipping_cost : 30
/// description : "<ul><li>It uses reliable ABS housing materials. Ergonomically designed, the firm grip makes it easy for even naughty children.Advanced Technology for Excellent Performance Goodbaby Thermometer is backed by clinical validated and recommended by the pediatrician.<br>&nbsp;&nbsp;&nbsp; Fast and Easy Temperatures Readings: Taking your family’s temperature with this digital thermometer is as simple as pointing, and pressing a button. It uses infrared technology and can show readings in Celsius or Fahrenheit.<br>&nbsp;&nbsp;&nbsp; Multi-mode Thermometer: The digital thermometer is designed for all ages, adults, infants, and elders. It not only supports the forehead function but is able to take room/object temperature.<br>&nbsp;&nbsp;&nbsp; Reliable and Accurate: Our forehead thermometer has been clinically tested and found to be a fast and absolutely reliable gadget to use. It is ideal for forehead readings and has a very small error margin.<br></li></ul>"
/// pdf_specification : null
/// meta_title : "Baby-Products-"
/// meta_description : null
/// meta_image : null
/// slug : "Baby-Products"
/// total_viewed : 23
/// is_active : 1
/// publish_stat : 2
/// is_wishlisted : false
/// images : [{"id":725,"product_id":234,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/Rp2sFH1oWTzwR0P9W4YgJkdwrRGte13CJRBoZZqO.png"}]
/// details : {"id":233,"product_id":234,"is_free_shipping":0,"is_flat_rate":0,"is_product_wise_shipping":0,"is_quantity_multiply":0,"warning_quantity":5,"is_show_stock_quantity":1,"is_show_stock_with_text_only":0,"is_hide_stock":0,"is_cash_on_delivery":1,"is_featured":1,"is_todays_deal":0,"is_best_sell":1,"flash_deal_title":null,"flash_deal_discount":null,"flash_deal_discount_type":null,"estimated_shipping_days":"3-7 days","vat":0,"tax":0}
/// category : {"id":199,"name":"Mother & Baby","category_id":139,"order":1,"icon":"https://my-bazar.maantheme.com/uploads/categories/32x32/QT9o7v8OYkaJSBmYIZsWXtvzBV0F3lD6SdELkJHo.png","banner":"https://my-bazar.maantheme.com/uploads/categories/200x200/C5KRo2arNA97Jsqf1LKz0wfS7gTaHVKs69SNcrRh.png","meta_title":"Commercial Furniture","meta_description":"lorem isu dolor sumite","slug":"commercial-furniture-9","commission_rate":0,"show_in_home":0,"is_active":1}
/// brand : null
/// seller : {"id":1,"company_name":"Online Park","first_name":"Online","last_name":"Park","image":"YsnkP5XCUMe6RZKNUx5tRIvzFOuJD8xPZFjlxPSR.png","mobile":"01xxxxxxx","email":"seller@event.com","gender":1,"address":"Bongshal,Dhaka","business_address":"Bangshal Dhaka","business_email":"onlinepark@gmail.com","business_mobile":"01854432212","post_code":"1000","city":"Dhaka","nid_no":null,"passport_no":null,"domain_name":"http://mybazarupdate.maantheme.com/","domain_ssl_stat":0,"is_active":1,"is_approve":1,"is_suspended":0}
/// colors : [{"id":1,"name":"Red","hex":"#ff0000","display_in_search":1,"is_active":1,"created_at":null,"updated_at":null,"pivot":{"product_id":234,"color_id":1}},{"id":2,"name":"Blue","hex":"#0000ff","display_in_search":1,"is_active":1,"created_at":null,"updated_at":null,"pivot":{"product_id":234,"color_id":2}},{"id":3,"name":"Green","hex":"#008000","display_in_search":1,"is_active":1,"created_at":null,"updated_at":null,"pivot":{"product_id":234,"color_id":3}},{"id":4,"name":"Orange","hex":"#ffa500","display_in_search":1,"is_active":1,"created_at":null,"updated_at":null,"pivot":{"product_id":234,"color_id":4}}]
/// sizes : [{"id":1,"name":"S","display_in_search":0,"is_active":1,"created_at":"2022-04-14T22:00:29.000000Z","updated_at":"2022-04-14T22:00:29.000000Z","pivot":{"product_id":234,"size_id":1}},{"id":3,"name":"L","display_in_search":0,"is_active":1,"created_at":"2022-04-14T22:00:29.000000Z","updated_at":"2022-04-14T22:00:29.000000Z","pivot":{"product_id":234,"size_id":3}},{"id":4,"name":"XL","display_in_search":0,"is_active":1,"created_at":"2022-04-14T22:00:29.000000Z","updated_at":"2022-04-14T22:00:29.000000Z","pivot":{"product_id":234,"size_id":4}}]

class Value {
  Value({
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
    dynamic attributes,
    dynamic unitPrice,
    dynamic purchasePrice,
    dynamic salePrice,
    dynamic discount,
    int? quantity,
    dynamic shippingCost,
    String? description,
    dynamic pdfSpecification,
    String? metaTitle,
    dynamic metaDescription,
    dynamic metaImage,
    String? slug,
    int? totalViewed,
    int? isActive,
    int? publishStat,
    bool? isWishlisted,
    List<Images>? images,
    Details? details,
    Category? category,
    dynamic brand,
    Seller? seller,
    List<Colors>? colors,
    List<Sizes>? sizes,
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
    _images = images;
    _details = details;
    _category = category;
    _brand = brand;
    _seller = seller;
    _colors = colors;
    _sizes = sizes;
  }

  Value.fromJson(Map<String, dynamic> json) {
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
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    _details =
        json['details'] != null ? Details.fromJson(json['details']) : null;
    _category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    _brand = json['brand'];
    _seller = json['seller'] != null ? Seller.fromJson(json['seller']) : null;
    if (json['colors'] != null) {
      _colors = [];
      json['colors'].forEach((v) {
        _colors?.add(Colors.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      _sizes = [];
      json['sizes'].forEach((v) {
        _sizes?.add(Sizes.fromJson(v));
      });
    }
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
  dynamic _attributes;
  dynamic _unitPrice;
  dynamic _purchasePrice;
  dynamic _salePrice;
  dynamic _discount;
  int? _quantity;
  dynamic _shippingCost;
  String? _description;
  dynamic _pdfSpecification;
  String? _metaTitle;
  dynamic _metaDescription;
  dynamic _metaImage;
  String? _slug;
  int? _totalViewed;
  int? _isActive;
  int? _publishStat;
  bool? _isWishlisted;
  List<Images>? _images;
  Details? _details;
  Category? _category;
  dynamic _brand;
  Seller? _seller;
  List<Colors>? _colors;
  List<Sizes>? _sizes;

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
  dynamic get attributes => _attributes;
  dynamic get unitPrice => _unitPrice;
  dynamic get purchasePrice => _purchasePrice;
  dynamic get salePrice => _salePrice;
  dynamic get discount => _discount;
  int? get quantity => _quantity;
  dynamic get shippingCost => _shippingCost;
  String? get description => _description;
  dynamic get pdfSpecification => _pdfSpecification;
  String? get metaTitle => _metaTitle;
  dynamic get metaDescription => _metaDescription;
  dynamic get metaImage => _metaImage;
  String? get slug => _slug;
  int? get totalViewed => _totalViewed;
  int? get isActive => _isActive;
  int? get publishStat => _publishStat;
  bool? get isWishlisted => _isWishlisted;
  List<Images>? get images => _images;
  Details? get details => _details;
  Category? get category => _category;
  dynamic get brand => _brand;
  Seller? get seller => _seller;
  List<Colors>? get colors => _colors;
  List<Sizes>? get sizes => _sizes;

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
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    if (_details != null) {
      map['details'] = _details?.toJson();
    }
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    map['brand'] = _brand;
    if (_seller != null) {
      map['seller'] = _seller?.toJson();
    }
    if (_colors != null) {
      map['colors'] = _colors?.map((v) => v.toJson()).toList();
    }
    if (_sizes != null) {
      map['sizes'] = _sizes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// name : "S"
/// display_in_search : 0
/// is_active : 1
/// created_at : "2022-04-14T22:00:29.000000Z"
/// updated_at : "2022-04-14T22:00:29.000000Z"
/// pivot : {"product_id":234,"size_id":1}

class Sizes {
  Sizes({
    int? id,
    String? name,
    int? displayInSearch,
    int? isActive,
    String? createdAt,
    String? updatedAt,
    Pivota? pivot,
  }) {
    _id = id;
    _name = name;
    _displayInSearch = displayInSearch;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _pivot = pivot;
  }

  Sizes.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _displayInSearch = json['display_in_search'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _pivot = json['pivot'] != null ? Pivota.fromJson(json['pivot']) : null;
  }
  int? _id;
  String? _name;
  int? _displayInSearch;
  int? _isActive;
  String? _createdAt;
  String? _updatedAt;
  Pivota? _pivot;

  int? get id => _id;
  String? get name => _name;
  int? get displayInSearch => _displayInSearch;
  int? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Pivota? get pivot => _pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['display_in_search'] = _displayInSearch;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_pivot != null) {
      map['pivot'] = _pivot?.toJson();
    }
    return map;
  }
}

/// product_id : 234
/// size_id : 1

class Pivota {
  Pivota({
    int? productId,
    int? sizeId,
  }) {
    _productId = productId;
    _sizeId = sizeId;
  }

  Pivota.fromJson(dynamic json) {
    _productId = json['product_id'];
    _sizeId = json['size_id'];
  }
  int? _productId;
  int? _sizeId;

  int? get productId => _productId;
  int? get sizeId => _sizeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['size_id'] = _sizeId;
    return map;
  }
}

/// id : 1
/// name : "Red"
/// hex : "#ff0000"
/// display_in_search : 1
/// is_active : 1
/// created_at : null
/// updated_at : null
/// pivot : {"product_id":234,"color_id":1}

class Colors {
  Colors({
    int? id,
    String? name,
    String? hex,
    int? displayInSearch,
    int? isActive,
    dynamic createdAt,
    dynamic updatedAt,
    Pivot? pivot,
  }) {
    _id = id;
    _name = name;
    _hex = hex;
    _displayInSearch = displayInSearch;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _pivot = pivot;
  }

  Colors.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _hex = json['hex'];
    _displayInSearch = json['display_in_search'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  int? _id;
  String? _name;
  String? _hex;
  int? _displayInSearch;
  int? _isActive;
  dynamic _createdAt;
  dynamic _updatedAt;
  Pivot? _pivot;

  int? get id => _id;
  String? get name => _name;
  String? get hex => _hex;
  int? get displayInSearch => _displayInSearch;
  int? get isActive => _isActive;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  Pivot? get pivot => _pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['hex'] = _hex;
    map['display_in_search'] = _displayInSearch;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_pivot != null) {
      map['pivot'] = _pivot?.toJson();
    }
    return map;
  }
}

/// product_id : 234
/// color_id : 1

class Pivot {
  Pivot({
    int? productId,
    int? colorId,
  }) {
    _productId = productId;
    _colorId = colorId;
  }

  Pivot.fromJson(dynamic json) {
    _productId = json['product_id'];
    _colorId = json['color_id'];
  }
  int? _productId;
  int? _colorId;

  int? get productId => _productId;
  int? get colorId => _colorId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['color_id'] = _colorId;
    return map;
  }
}

/// id : 1
/// company_name : "Online Park"
/// first_name : "Online"
/// last_name : "Park"
/// image : "YsnkP5XCUMe6RZKNUx5tRIvzFOuJD8xPZFjlxPSR.png"
/// mobile : "01xxxxxxx"
/// email : "seller@event.com"
/// gender : 1
/// address : "Bongshal,Dhaka"
/// business_address : "Bangshal Dhaka"
/// business_email : "onlinepark@gmail.com"
/// business_mobile : "01854432212"
/// post_code : "1000"
/// city : "Dhaka"
/// nid_no : null
/// passport_no : null
/// domain_name : "http://mybazarupdate.maantheme.com/"
/// domain_ssl_stat : 0
/// is_active : 1
/// is_approve : 1
/// is_suspended : 0

class Seller {
  Seller({
    int? id,
    String? companyName,
    String? firstName,
    String? lastName,
    String? image,
    String? mobile,
    String? email,
    int? gender,
    String? address,
    String? businessAddress,
    String? businessEmail,
    String? businessMobile,
    String? postCode,
    String? city,
    dynamic nidNo,
    dynamic passportNo,
    String? domainName,
    int? domainSslStat,
    int? isActive,
    int? isApprove,
    int? isSuspended,
  }) {
    _id = id;
    _companyName = companyName;
    _firstName = firstName;
    _lastName = lastName;
    _image = image;
    _mobile = mobile;
    _email = email;
    _gender = gender;
    _address = address;
    _businessAddress = businessAddress;
    _businessEmail = businessEmail;
    _businessMobile = businessMobile;
    _postCode = postCode;
    _city = city;
    _nidNo = nidNo;
    _passportNo = passportNo;
    _domainName = domainName;
    _domainSslStat = domainSslStat;
    _isActive = isActive;
    _isApprove = isApprove;
    _isSuspended = isSuspended;
  }

  Seller.fromJson(dynamic json) {
    _id = json['id'];
    _companyName = json['company_name'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _image = json['image'];
    _mobile = json['mobile'];
    _email = json['email'];
    _gender = json['gender'];
    _address = json['address'];
    _businessAddress = json['business_address'];
    _businessEmail = json['business_email'];
    _businessMobile = json['business_mobile'];
    _postCode = json['post_code'];
    _city = json['city'];
    _nidNo = json['nid_no'];
    _passportNo = json['passport_no'];
    _domainName = json['domain_name'];
    _domainSslStat = json['domain_ssl_stat'];
    _isActive = json['is_active'];
    _isApprove = json['is_approve'];
    _isSuspended = json['is_suspended'];
  }
  int? _id;
  String? _companyName;
  String? _firstName;
  String? _lastName;
  String? _image;
  String? _mobile;
  String? _email;
  int? _gender;
  String? _address;
  String? _businessAddress;
  String? _businessEmail;
  String? _businessMobile;
  String? _postCode;
  String? _city;
  dynamic _nidNo;
  dynamic _passportNo;
  String? _domainName;
  int? _domainSslStat;
  int? _isActive;
  int? _isApprove;
  int? _isSuspended;

  int? get id => _id;
  String? get companyName => _companyName;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get image => _image;
  String? get mobile => _mobile;
  String? get email => _email;
  int? get gender => _gender;
  String? get address => _address;
  String? get businessAddress => _businessAddress;
  String? get businessEmail => _businessEmail;
  String? get businessMobile => _businessMobile;
  String? get postCode => _postCode;
  String? get city => _city;
  dynamic get nidNo => _nidNo;
  dynamic get passportNo => _passportNo;
  String? get domainName => _domainName;
  int? get domainSslStat => _domainSslStat;
  int? get isActive => _isActive;
  int? get isApprove => _isApprove;
  int? get isSuspended => _isSuspended;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['company_name'] = _companyName;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['image'] = _image;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['gender'] = _gender;
    map['address'] = _address;
    map['business_address'] = _businessAddress;
    map['business_email'] = _businessEmail;
    map['business_mobile'] = _businessMobile;
    map['post_code'] = _postCode;
    map['city'] = _city;
    map['nid_no'] = _nidNo;
    map['passport_no'] = _passportNo;
    map['domain_name'] = _domainName;
    map['domain_ssl_stat'] = _domainSslStat;
    map['is_active'] = _isActive;
    map['is_approve'] = _isApprove;
    map['is_suspended'] = _isSuspended;
    return map;
  }
}

/// id : 199
/// name : "Mother & Baby"
/// category_id : 139
/// order : 1
/// icon : "https://my-bazar.maantheme.com/uploads/categories/32x32/QT9o7v8OYkaJSBmYIZsWXtvzBV0F3lD6SdELkJHo.png"
/// banner : "https://my-bazar.maantheme.com/uploads/categories/200x200/C5KRo2arNA97Jsqf1LKz0wfS7gTaHVKs69SNcrRh.png"
/// meta_title : "Commercial Furniture"
/// meta_description : "lorem isu dolor sumite"
/// slug : "commercial-furniture-9"
/// commission_rate : 0
/// show_in_home : 0
/// is_active : 1

class Category {
  Category({
    int? id,
    String? name,
    int? categoryId,
    int? order,
    String? icon,
    String? banner,
    String? metaTitle,
    String? metaDescription,
    String? slug,
    int? commissionRate,
    int? showInHome,
    int? isActive,
  }) {
    _id = id;
    _name = name;
    _categoryId = categoryId;
    _order = order;
    _icon = icon;
    _banner = banner;
    _metaTitle = metaTitle;
    _metaDescription = metaDescription;
    _slug = slug;
    _commissionRate = commissionRate;
    _showInHome = showInHome;
    _isActive = isActive;
  }

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _categoryId = json['category_id'];
    _order = json['order'];
    _icon = json['icon'];
    _banner = json['banner'];
    _metaTitle = json['meta_title'];
    _metaDescription = json['meta_description'];
    _slug = json['slug'];
    _commissionRate = json['commission_rate'];
    _showInHome = json['show_in_home'];
    _isActive = json['is_active'];
  }
  int? _id;
  String? _name;
  int? _categoryId;
  int? _order;
  String? _icon;
  String? _banner;
  String? _metaTitle;
  String? _metaDescription;
  String? _slug;
  int? _commissionRate;
  int? _showInHome;
  int? _isActive;

  int? get id => _id;
  String? get name => _name;
  int? get categoryId => _categoryId;
  int? get order => _order;
  String? get icon => _icon;
  String? get banner => _banner;
  String? get metaTitle => _metaTitle;
  String? get metaDescription => _metaDescription;
  String? get slug => _slug;
  int? get commissionRate => _commissionRate;
  int? get showInHome => _showInHome;
  int? get isActive => _isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['category_id'] = _categoryId;
    map['order'] = _order;
    map['icon'] = _icon;
    map['banner'] = _banner;
    map['meta_title'] = _metaTitle;
    map['meta_description'] = _metaDescription;
    map['slug'] = _slug;
    map['commission_rate'] = _commissionRate;
    map['show_in_home'] = _showInHome;
    map['is_active'] = _isActive;
    return map;
  }
}

/// id : 233
/// product_id : 234
/// is_free_shipping : 0
/// is_flat_rate : 0
/// is_product_wise_shipping : 0
/// is_quantity_multiply : 0
/// warning_quantity : 5
/// is_show_stock_quantity : 1
/// is_show_stock_with_text_only : 0
/// is_hide_stock : 0
/// is_cash_on_delivery : 1
/// is_featured : 1
/// is_todays_deal : 0
/// is_best_sell : 1
/// flash_deal_title : null
/// flash_deal_discount : null
/// flash_deal_discount_type : null
/// estimated_shipping_days : "3-7 days"
/// vat : 0
/// tax : 0

class Details {
  Details({
    int? id,
    int? productId,
    int? isFreeShipping,
    int? isFlatRate,
    int? isProductWiseShipping,
    int? isQuantityMultiply,
    int? warningQuantity,
    int? isShowStockQuantity,
    int? isShowStockWithTextOnly,
    int? isHideStock,
    int? isCashOnDelivery,
    int? isFeatured,
    int? isTodaysDeal,
    int? isBestSell,
    dynamic flashDealTitle,
    dynamic flashDealDiscount,
    dynamic flashDealDiscountType,
    String? estimatedShippingDays,
    int? vat,
    int? tax,
  }) {
    _id = id;
    _productId = productId;
    _isFreeShipping = isFreeShipping;
    _isFlatRate = isFlatRate;
    _isProductWiseShipping = isProductWiseShipping;
    _isQuantityMultiply = isQuantityMultiply;
    _warningQuantity = warningQuantity;
    _isShowStockQuantity = isShowStockQuantity;
    _isShowStockWithTextOnly = isShowStockWithTextOnly;
    _isHideStock = isHideStock;
    _isCashOnDelivery = isCashOnDelivery;
    _isFeatured = isFeatured;
    _isTodaysDeal = isTodaysDeal;
    _isBestSell = isBestSell;
    _flashDealTitle = flashDealTitle;
    _flashDealDiscount = flashDealDiscount;
    _flashDealDiscountType = flashDealDiscountType;
    _estimatedShippingDays = estimatedShippingDays;
    _vat = vat;
    _tax = tax;
  }

  Details.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _isFreeShipping = json['is_free_shipping'];
    _isFlatRate = json['is_flat_rate'];
    _isProductWiseShipping = json['is_product_wise_shipping'];
    _isQuantityMultiply = json['is_quantity_multiply'];
    _warningQuantity = json['warning_quantity'];
    _isShowStockQuantity = json['is_show_stock_quantity'];
    _isShowStockWithTextOnly = json['is_show_stock_with_text_only'];
    _isHideStock = json['is_hide_stock'];
    _isCashOnDelivery = json['is_cash_on_delivery'];
    _isFeatured = json['is_featured'];
    _isTodaysDeal = json['is_todays_deal'];
    _isBestSell = json['is_best_sell'];
    _flashDealTitle = json['flash_deal_title'];
    _flashDealDiscount = json['flash_deal_discount'];
    _flashDealDiscountType = json['flash_deal_discount_type'];
    _estimatedShippingDays = json['estimated_shipping_days'];
    _vat = json['vat'];
    _tax = json['tax'];
  }
  int? _id;
  int? _productId;
  int? _isFreeShipping;
  int? _isFlatRate;
  int? _isProductWiseShipping;
  int? _isQuantityMultiply;
  int? _warningQuantity;
  int? _isShowStockQuantity;
  int? _isShowStockWithTextOnly;
  int? _isHideStock;
  int? _isCashOnDelivery;
  int? _isFeatured;
  int? _isTodaysDeal;
  int? _isBestSell;
  dynamic _flashDealTitle;
  dynamic _flashDealDiscount;
  dynamic _flashDealDiscountType;
  String? _estimatedShippingDays;
  int? _vat;
  int? _tax;

  int? get id => _id;
  int? get productId => _productId;
  int? get isFreeShipping => _isFreeShipping;
  int? get isFlatRate => _isFlatRate;
  int? get isProductWiseShipping => _isProductWiseShipping;
  int? get isQuantityMultiply => _isQuantityMultiply;
  int? get warningQuantity => _warningQuantity;
  int? get isShowStockQuantity => _isShowStockQuantity;
  int? get isShowStockWithTextOnly => _isShowStockWithTextOnly;
  int? get isHideStock => _isHideStock;
  int? get isCashOnDelivery => _isCashOnDelivery;
  int? get isFeatured => _isFeatured;
  int? get isTodaysDeal => _isTodaysDeal;
  int? get isBestSell => _isBestSell;
  dynamic get flashDealTitle => _flashDealTitle;
  dynamic get flashDealDiscount => _flashDealDiscount;
  dynamic get flashDealDiscountType => _flashDealDiscountType;
  String? get estimatedShippingDays => _estimatedShippingDays;
  int? get vat => _vat;
  int? get tax => _tax;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['is_free_shipping'] = _isFreeShipping;
    map['is_flat_rate'] = _isFlatRate;
    map['is_product_wise_shipping'] = _isProductWiseShipping;
    map['is_quantity_multiply'] = _isQuantityMultiply;
    map['warning_quantity'] = _warningQuantity;
    map['is_show_stock_quantity'] = _isShowStockQuantity;
    map['is_show_stock_with_text_only'] = _isShowStockWithTextOnly;
    map['is_hide_stock'] = _isHideStock;
    map['is_cash_on_delivery'] = _isCashOnDelivery;
    map['is_featured'] = _isFeatured;
    map['is_todays_deal'] = _isTodaysDeal;
    map['is_best_sell'] = _isBestSell;
    map['flash_deal_title'] = _flashDealTitle;
    map['flash_deal_discount'] = _flashDealDiscount;
    map['flash_deal_discount_type'] = _flashDealDiscountType;
    map['estimated_shipping_days'] = _estimatedShippingDays;
    map['vat'] = _vat;
    map['tax'] = _tax;
    return map;
  }
}

/// id : 725
/// product_id : 234
/// image : "https://my-bazar.maantheme.com/uploads/products/galleries/Rp2sFH1oWTzwR0P9W4YgJkdwrRGte13CJRBoZZqO.png"

class Images {
  Images({
    int? id,
    int? productId,
    String? image,
  }) {
    _id = id;
    _productId = productId;
    _image = image;
  }

  Images.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _image = json['image'];
  }
  int? _id;
  int? _productId;
  String? _image;

  int? get id => _id;
  int? get productId => _productId;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['image'] = _image;
    return map;
  }
}
