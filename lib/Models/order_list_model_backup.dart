import 'dart:convert';

class OrderListModel {
  bool? success;
  String? message;
  Value? value;
  OrderListModel({
    this.success,
    this.message,
    this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'value': value?.toMap(),
    };
  }

  factory OrderListModel.fromMap(Map<String, dynamic> map) {
    return OrderListModel(
      success: map['success'],
      message: map['message'],
      value: map['value'] != null ? Value.fromMap(map['value']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderListModel.fromJson(String source) => OrderListModel.fromMap(json.decode(source));
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
  Value({
    this.currentPage,
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
    this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'currentPage': currentPage,
      'data': data?.map((x) => x.toMap()).toList(),
      'firstPageUrl': firstPageUrl,
      'from': from,
      'lastPage': lastPage,
      'lastPageUrl': lastPageUrl,
      'links': links?.map((x) => x.toMap()).toList(),
      'nextPageUrl': nextPageUrl,
      'path': path,
      'perPage': perPage,
      'prevPageUrl': prevPageUrl,
      'to': to,
      'total': total,
    };
  }

  factory Value.fromMap(Map<String, dynamic> map) {
    return Value(
      currentPage: map['currentPage']?.toInt(),
      data: map['data'] != null ? List<Data>.from(map['data']?.map((x) => Data.fromMap(x))) : null,
      firstPageUrl: map['firstPageUrl'],
      from: map['from']?.toInt(),
      lastPage: map['lastPage']?.toInt(),
      lastPageUrl: map['lastPageUrl'],
      links: map['links'] != null ? List<Links>.from(map['links']?.map((x) => Links.fromMap(x))) : null,
      nextPageUrl: map['nextPageUrl']?.toInt(),
      path: map['path'],
      perPage: map['perPage']?.toInt(),
      prevPageUrl: map['prevPageUrl']?.toInt(),
      to: map['to']?.toInt(),
      total: map['total']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Value.fromJson(String source) => Value.fromMap(json.decode(source));
}

class Data {
  int? id;
  int? sellerId;
  int? userId;
  int? orderId;
  String? menifestId;
  int? orderStat;
  int? productId;
  int? salePrice;
  int? qty;
  int? discount;
  int? tax;
  int? shippingCost;
  int? totalShippingCost;
  int? totalPrice;
  int? grandTotal;
  int? currencyId;
  int? exchangeRate;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;

  Data({
    this.id,
    this.sellerId,
    this.userId,
    this.orderId,
    this.orderStat,
    this.productId,
    this.salePrice,
    this.qty,
    this.discount,
    this.tax,
    this.shippingCost,
    this.totalShippingCost,
    this.totalPrice,
    this.grandTotal,
    this.currencyId,
    this.exchangeRate,
    this.createdAt,
    this.updatedAt,
    this.product,
    this.menifestId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sellerId': sellerId,
      'userId': userId,
      'orderId': orderId,
      'orderStat': orderStat,
      'productId': productId,
      'salePrice': salePrice,
      'qty': qty,
      'discount': discount,
      'tax': tax,
      'shippingCost': shippingCost,
      'totalShippingCost': totalShippingCost,
      'totalPrice': totalPrice,
      'grandTotal': grandTotal,
      'currencyId': currencyId,
      'exchangeRate': exchangeRate,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'product': product?.toMap(),
      'menifestId': menifestId,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id']?.toInt(),
      sellerId: map['seller_id']?.toInt(),
      userId: map['user_id']?.toInt(),
      orderId: map['order_id']?.toInt(),
      orderStat: map['order_stat']?.toInt(),
      productId: map['product_id']?.toInt(),
      salePrice: map['sale_price']?.toInt(),
      qty: map['qty']?.toInt(),
      discount: map['discount']?.toInt(),
      tax: map['tax']?.toInt(),
      shippingCost: map['shipping_cost']?.toInt(),
      totalShippingCost: map['total_shipping_cost']?.toInt(),
      totalPrice: map['total_price']?.toInt(),
      grandTotal: map['grand_total']?.toInt(),
      currencyId: map['currency_id']?.toInt(),
      exchangeRate: map['exchange_rate']?.toInt(),
      createdAt: map['created_at'],
      menifestId: map['menifestId'],
      updatedAt: map['updated_at'],
      product: map['product'] != null ? ProductModel.fromMap(map['product']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
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
  Links({
    this.url,
    this.label,
    this.active,
  });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'label': label,
      'active': active,
    };
  }

  factory Links.fromMap(Map<String, dynamic> map) {
    return Links(
      url: map['url'],
      label: map['label'],
      active: map['active'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Links.fromJson(String source) => Links.fromMap(json.decode(source));
}

class ProductModel {
  String? name;
  String? slug;
  String? unit;
  String? sku;
  int? quantity;
  String? discription;
  List<ProductImageModel>? images;
  ProductModel({
    this.name,
    this.slug,
    this.unit,
    this.sku,
    this.quantity,
    this.discription,
    this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'slug': slug,
      'unit': unit,
      'sku': sku,
      'quantity': quantity,
      'discription': discription,
      'images': images?.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'],
      slug: map['slug'],
      unit: map['unit'],
      sku: map['sku'],
      quantity: map['quantity']?.toInt(),
      discription: map['discription'],
      images: map['images'] != null
          ? List<ProductImageModel>.from(
              map['images']?.map(
                (x) => ProductImageModel.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));
}

class ProductImageModel {
  int? imageId;
  int? productId;
  String? imageUrl;
  ProductImageModel({
    this.imageId,
    this.productId,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageId': imageId,
      'productId': productId,
      'imageUrl': imageUrl,
    };
  }

  factory ProductImageModel.fromMap(Map<String, dynamic> map) {
    return ProductImageModel(
      imageId: map['id']?.toInt(),
      productId: map['product_id']?.toInt(),
      imageUrl: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductImageModel.fromJson(String source) => ProductImageModel.fromMap(json.decode(source));
}
