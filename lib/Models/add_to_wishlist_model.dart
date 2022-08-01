/// success : true
/// message : "Created Successfully"
/// value : {"wishlist":[{"id":10,"user_id":16,"product_id":4,"created_at":"2022-04-28T07:25:57.000000Z","updated_at":"2022-04-28T07:25:57.000000Z","deleted_at":null,"product":{"id":4,"seller_id":1,"category_id":7,"brand_id":null,"name":"Women's Watch","unit":"Piece","tags":"","minimum_qty":10,"barcode":null,"sku":"MS00004","is_refundable":0,"attributes":null,"unit_price":1800.90000000000009094947017729282379150390625,"purchase_price":1200.90000000000009094947017729282379150390625,"sale_price":1200.40000000000009094947017729282379150390625,"discount":600.5,"quantity":80,"shipping_cost":81,"description":"<p><span style=\\\"color: rgb[68, 68, 68]; font-family: &quot;Gotham Book&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb[255, 255, 255]; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\\\">The case is water resistant to 100 meters and has a flat AR-coated sapphire crystal over the dial. Inside the watch is a Swiss quartz movement. The dial is kept elegant without a date window being present. The overall build quality is very good, though, for the price point, I would have liked to see diamond elements, as opposed to crystals.<br>&nbsp;It constantly stock new curren watches selections so be sure to check back often. - Imported Japan movement, high precise travel time.<br></span></p>","pdf_specification":null,"meta_title":"Womens-Watch","meta_description":null,"meta_image":null,"slug":"Womens-Watch","total_viewed":34,"is_active":1,"publish_stat":2,"images":[{"id":2,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/fv43vaqUFIuRwqkZNXwJe6YJfeNb7Ff3KdK7YBVI.jpg"},{"id":120,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/ez7L5AyK8TP45AHvVJbNvyAuSj5BP3Cf2usp7iXL.png"},{"id":121,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/1itxOgw3hyJXAA8TU1uZc37EOtcf01XGl633mc8I.png"},{"id":122,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/snGR1EPkcDjtD04Ra50ia65KoRlaGoVX8pQ8jEXa.jpg"}]}},{"id":11,"user_id":16,"product_id":4,"created_at":"2022-05-14T10:55:09.000000Z","updated_at":"2022-05-14T10:55:09.000000Z","deleted_at":null,"product":{"id":4,"seller_id":1,"category_id":7,"brand_id":null,"name":"Women's Watch","unit":"Piece","tags":"","minimum_qty":10,"barcode":null,"sku":"MS00004","is_refundable":0,"attributes":null,"unit_price":1800.90000000000009094947017729282379150390625,"purchase_price":1200.90000000000009094947017729282379150390625,"sale_price":1200.40000000000009094947017729282379150390625,"discount":600.5,"quantity":80,"shipping_cost":81,"description":"<p><span style=\\\"color: rgb[68, 68, 68]; font-family: &quot;Gotham Book&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb[255, 255, 255]; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\\\">The case is water resistant to 100 meters and has a flat AR-coated sapphire crystal over the dial. Inside the watch is a Swiss quartz movement. The dial is kept elegant without a date window being present. The overall build quality is very good, though, for the price point, I would have liked to see diamond elements, as opposed to crystals.<br>&nbsp;It constantly stock new curren watches selections so be sure to check back often. - Imported Japan movement, high precise travel time.<br></span></p>","pdf_specification":null,"meta_title":"Womens-Watch","meta_description":null,"meta_image":null,"slug":"Womens-Watch","total_viewed":34,"is_active":1,"publish_stat":2,"images":[{"id":2,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/fv43vaqUFIuRwqkZNXwJe6YJfeNb7Ff3KdK7YBVI.jpg"},{"id":120,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/ez7L5AyK8TP45AHvVJbNvyAuSj5BP3Cf2usp7iXL.png"},{"id":121,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/1itxOgw3hyJXAA8TU1uZc37EOtcf01XGl633mc8I.png"},{"id":122,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/snGR1EPkcDjtD04Ra50ia65KoRlaGoVX8pQ8jEXa.jpg"}]}}],"wishlist_count":2}

class AddToWishlistModel {
  AddToWishlistModel({
    bool? success,
    String? message,
    Value? value,
  }) {
    _success = success;
    _message = message;
    _value = value;
  }

  AddToWishlistModel.fromJson(dynamic json) {
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

/// wishlist : [{"id":10,"user_id":16,"product_id":4,"created_at":"2022-04-28T07:25:57.000000Z","updated_at":"2022-04-28T07:25:57.000000Z","deleted_at":null,"product":{"id":4,"seller_id":1,"category_id":7,"brand_id":null,"name":"Women's Watch","unit":"Piece","tags":"","minimum_qty":10,"barcode":null,"sku":"MS00004","is_refundable":0,"attributes":null,"unit_price":1800.90000000000009094947017729282379150390625,"purchase_price":1200.90000000000009094947017729282379150390625,"sale_price":1200.40000000000009094947017729282379150390625,"discount":600.5,"quantity":80,"shipping_cost":81,"description":"<p><span style=\\\"color: rgb[68, 68, 68]; font-family: &quot;Gotham Book&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb[255, 255, 255]; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\\\">The case is water resistant to 100 meters and has a flat AR-coated sapphire crystal over the dial. Inside the watch is a Swiss quartz movement. The dial is kept elegant without a date window being present. The overall build quality is very good, though, for the price point, I would have liked to see diamond elements, as opposed to crystals.<br>&nbsp;It constantly stock new curren watches selections so be sure to check back often. - Imported Japan movement, high precise travel time.<br></span></p>","pdf_specification":null,"meta_title":"Womens-Watch","meta_description":null,"meta_image":null,"slug":"Womens-Watch","total_viewed":34,"is_active":1,"publish_stat":2,"images":[{"id":2,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/fv43vaqUFIuRwqkZNXwJe6YJfeNb7Ff3KdK7YBVI.jpg"},{"id":120,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/ez7L5AyK8TP45AHvVJbNvyAuSj5BP3Cf2usp7iXL.png"},{"id":121,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/1itxOgw3hyJXAA8TU1uZc37EOtcf01XGl633mc8I.png"},{"id":122,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/snGR1EPkcDjtD04Ra50ia65KoRlaGoVX8pQ8jEXa.jpg"}]}},{"id":11,"user_id":16,"product_id":4,"created_at":"2022-05-14T10:55:09.000000Z","updated_at":"2022-05-14T10:55:09.000000Z","deleted_at":null,"product":{"id":4,"seller_id":1,"category_id":7,"brand_id":null,"name":"Women's Watch","unit":"Piece","tags":"","minimum_qty":10,"barcode":null,"sku":"MS00004","is_refundable":0,"attributes":null,"unit_price":1800.90000000000009094947017729282379150390625,"purchase_price":1200.90000000000009094947017729282379150390625,"sale_price":1200.40000000000009094947017729282379150390625,"discount":600.5,"quantity":80,"shipping_cost":81,"description":"<p><span style=\\\"color: rgb[68, 68, 68]; font-family: &quot;Gotham Book&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb[255, 255, 255]; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\\\">The case is water resistant to 100 meters and has a flat AR-coated sapphire crystal over the dial. Inside the watch is a Swiss quartz movement. The dial is kept elegant without a date window being present. The overall build quality is very good, though, for the price point, I would have liked to see diamond elements, as opposed to crystals.<br>&nbsp;It constantly stock new curren watches selections so be sure to check back often. - Imported Japan movement, high precise travel time.<br></span></p>","pdf_specification":null,"meta_title":"Womens-Watch","meta_description":null,"meta_image":null,"slug":"Womens-Watch","total_viewed":34,"is_active":1,"publish_stat":2,"images":[{"id":2,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/fv43vaqUFIuRwqkZNXwJe6YJfeNb7Ff3KdK7YBVI.jpg"},{"id":120,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/ez7L5AyK8TP45AHvVJbNvyAuSj5BP3Cf2usp7iXL.png"},{"id":121,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/1itxOgw3hyJXAA8TU1uZc37EOtcf01XGl633mc8I.png"},{"id":122,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/snGR1EPkcDjtD04Ra50ia65KoRlaGoVX8pQ8jEXa.jpg"}]}}]
/// wishlist_count : 2

class Value {
  Value({
    List<Wishlist>? wishlist,
    int? wishlistCount,
  }) {
    _wishlist = wishlist;
    _wishlistCount = wishlistCount;
  }

  Value.fromJson(dynamic json) {
    if (json['wishlist'] != null) {
      _wishlist = [];
      json['wishlist'].forEach((v) {
        _wishlist?.add(Wishlist.fromJson(v));
      });
    }
    _wishlistCount = json['wishlist_count'];
  }

  List<Wishlist>? _wishlist;
  int? _wishlistCount;

  List<Wishlist>? get wishlist => _wishlist;

  int? get wishlistCount => _wishlistCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_wishlist != null) {
      map['wishlist'] = _wishlist?.map((v) => v.toJson()).toList();
    }
    map['wishlist_count'] = _wishlistCount;
    return map;
  }
}

/// id : 10
/// user_id : 16
/// product_id : 4
/// created_at : "2022-04-28T07:25:57.000000Z"
/// updated_at : "2022-04-28T07:25:57.000000Z"
/// deleted_at : null
/// product : {"id":4,"seller_id":1,"category_id":7,"brand_id":null,"name":"Women's Watch","unit":"Piece","tags":"","minimum_qty":10,"barcode":null,"sku":"MS00004","is_refundable":0,"attributes":null,"unit_price":1800.90000000000009094947017729282379150390625,"purchase_price":1200.90000000000009094947017729282379150390625,"sale_price":1200.40000000000009094947017729282379150390625,"discount":600.5,"quantity":80,"shipping_cost":81,"description":"<p><span style=\\\"color: rgb[68, 68, 68]; font-family: &quot;Gotham Book&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb[255, 255, 255]; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\\\">The case is water resistant to 100 meters and has a flat AR-coated sapphire crystal over the dial. Inside the watch is a Swiss quartz movement. The dial is kept elegant without a date window being present. The overall build quality is very good, though, for the price point, I would have liked to see diamond elements, as opposed to crystals.<br>&nbsp;It constantly stock new curren watches selections so be sure to check back often. - Imported Japan movement, high precise travel time.<br></span></p>","pdf_specification":null,"meta_title":"Womens-Watch","meta_description":null,"meta_image":null,"slug":"Womens-Watch","total_viewed":34,"is_active":1,"publish_stat":2,"images":[{"id":2,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/fv43vaqUFIuRwqkZNXwJe6YJfeNb7Ff3KdK7YBVI.jpg"},{"id":120,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/ez7L5AyK8TP45AHvVJbNvyAuSj5BP3Cf2usp7iXL.png"},{"id":121,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/1itxOgw3hyJXAA8TU1uZc37EOtcf01XGl633mc8I.png"},{"id":122,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/snGR1EPkcDjtD04Ra50ia65KoRlaGoVX8pQ8jEXa.jpg"}]}

class Wishlist {
  Wishlist({
    int? id,
    int? userId,
    int? productId,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
    Product? product,
  }) {
    _id = id;
    _userId = userId;
    _productId = productId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _product = product;
  }

  Wishlist.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _productId = json['product_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  int? _id;
  int? _userId;
  int? _productId;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  Product? _product;

  int? get id => _id;

  int? get userId => _userId;

  int? get productId => _productId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  dynamic get deletedAt => _deletedAt;

  Product? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['product_id'] = _productId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }
}

/// id : 4
/// seller_id : 1
/// category_id : 7
/// brand_id : null
/// name : "Women's Watch"
/// unit : "Piece"
/// tags : ""
/// minimum_qty : 10
/// barcode : null
/// sku : "MS00004"
/// is_refundable : 0
/// attributes : null
/// unit_price : 1800.90000000000009094947017729282379150390625
/// purchase_price : 1200.90000000000009094947017729282379150390625
/// sale_price : 1200.40000000000009094947017729282379150390625
/// discount : 600.5
/// quantity : 80
/// shipping_cost : 81
/// description : "<p><span style=\\\"color: rgb[68, 68, 68]; font-family: &quot;Gotham Book&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb[255, 255, 255]; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\\\">The case is water resistant to 100 meters and has a flat AR-coated sapphire crystal over the dial. Inside the watch is a Swiss quartz movement. The dial is kept elegant without a date window being present. The overall build quality is very good, though, for the price point, I would have liked to see diamond elements, as opposed to crystals.<br>&nbsp;It constantly stock new curren watches selections so be sure to check back often. - Imported Japan movement, high precise travel time.<br></span></p>"
/// pdf_specification : null
/// meta_title : "Womens-Watch"
/// meta_description : null
/// meta_image : null
/// slug : "Womens-Watch"
/// total_viewed : 34
/// is_active : 1
/// publish_stat : 2
/// images : [{"id":2,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/fv43vaqUFIuRwqkZNXwJe6YJfeNb7Ff3KdK7YBVI.jpg"},{"id":120,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/ez7L5AyK8TP45AHvVJbNvyAuSj5BP3Cf2usp7iXL.png"},{"id":121,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/1itxOgw3hyJXAA8TU1uZc37EOtcf01XGl633mc8I.png"},{"id":122,"product_id":4,"image":"https://my-bazar.maantheme.com/uploads/products/galleries/snGR1EPkcDjtD04Ra50ia65KoRlaGoVX8pQ8jEXa.jpg"}]

class Product {
  Product({
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
    int? shippingCost,
    String? description,
    dynamic pdfSpecification,
    String? metaTitle,
    dynamic metaDescription,
    dynamic metaImage,
    String? slug,
    int? totalViewed,
    int? isActive,
    int? publishStat,
    List<Images>? images,
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
    _images = images;
  }

  Product.fromJson(dynamic json) {
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
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
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
  int? _shippingCost;
  String? _description;
  dynamic _pdfSpecification;
  String? _metaTitle;
  dynamic _metaDescription;
  dynamic _metaImage;
  String? _slug;
  int? _totalViewed;
  int? _isActive;
  int? _publishStat;
  List<Images>? _images;

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

  int? get shippingCost => _shippingCost;

  String? get description => _description;

  dynamic get pdfSpecification => _pdfSpecification;

  String? get metaTitle => _metaTitle;

  dynamic get metaDescription => _metaDescription;

  dynamic get metaImage => _metaImage;

  String? get slug => _slug;

  int? get totalViewed => _totalViewed;

  int? get isActive => _isActive;

  int? get publishStat => _publishStat;

  List<Images>? get images => _images;

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
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 2
/// product_id : 4
/// image : "https://my-bazar.maantheme.com/uploads/products/galleries/fv43vaqUFIuRwqkZNXwJe6YJfeNb7Ff3KdK7YBVI.jpg"

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
