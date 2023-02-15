// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

OrderListModel orderListModelFromJson(String str) =>
    OrderListModel.fromJson(json.decode(str));

String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

class OrderListModel {
  OrderListModel({
    this.success,
    this.message,
    this.value,
  });

  bool? success;
  String? message;
  Value? value;

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
        success: json["success"],
        message: json["message"],
        value: json["value"] == null ? null : Value.fromJson(json["value"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "value": value == null ? null : value!.toJson(),
      };
}

class Value {
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

  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl:
            json["first_page_url"] == null ? null : json["first_page_url"],
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        lastPageUrl:
            json["last_page_url"] == null ? null : json["last_page_url"],
        links: json["links"] == null
            ? null
            : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl:
            json["next_page_url"] == null ? null : json["next_page_url"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl == null ? null : firstPageUrl,
        "from": from == null ? null : from,
        "last_page": lastPage == null ? null : lastPage,
        "last_page_url": lastPageUrl == null ? null : lastPageUrl,
        "links": links == null
            ? null
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl == null ? null : nextPageUrl,
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "prev_page_url": prevPageUrl,
        "to": to == null ? null : to,
        "total": total == null ? null : total,
      };
}

class Datum {
  Datum({
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
    this.shippingState,
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
    this.ratecardRateid,
    this.ratecardProviderId,
    this.ratecardCtop,
    this.ratecardPrice,
    this.ratecardBp,
    this.ratecardTax,
    this.ratecardPLatlng,
    this.ratecardDLatlng,
    this.ratecardDistance,
    this.ratecardBillwt,
    this.ratecardReplyCode,
    this.ratecardReplyMsg,
    this.ratecardAwbNo,
    this.createdAt,
    this.updatedAt,
    this.paymentTxnId,
    this.details,
  });

  int? id;
  String? orderNo;
  dynamic discount;
  dynamic couponDiscount;
  dynamic tax;
  int? shippingCost;
  int? totalPrice;
  dynamic couponId;
  int? currencyId;
  int? exchangeRate;
  String? shippingName;
  String? shippingAddress1;
  String? shippingAddress2;
  String? shippingMobile;
  String? shippingEmail;
  String? shippingPost;
  String? shippingTown;
  String? shippingState;
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
  int? ratecardRateid;
  int? ratecardProviderId;
  int? ratecardCtop;
  int? ratecardPrice;
  int? ratecardBp;
  double? ratecardTax;
  String? ratecardPLatlng;
  String? ratecardDLatlng;
  double? ratecardDistance;
  int? ratecardBillwt;
  int? ratecardReplyCode;
  String? ratecardReplyMsg;
  String? ratecardAwbNo;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? paymentTxnId;
  List<Detail>? details;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        orderNo: json["order_no"] == null ? null : json["order_no"],
        discount: json["discount"],
        couponDiscount: json["coupon_discount"],
        tax: json["tax"],
        shippingCost:
            json["shipping_cost"] == null ? null : json["shipping_cost"],
        totalPrice: json["total_price"] == null ? null : json["total_price"],
        couponId: json["coupon_id"],
        currencyId: json["currency_id"] == null ? null : json["currency_id"],
        exchangeRate:
            json["exchange_rate"] == null ? null : json["exchange_rate"],
        shippingName:
            json["shipping_name"] == null ? null : json["shipping_name"],
        shippingAddress1: json["shipping_address_1"] == null
            ? null
            : json["shipping_address_1"],
        shippingAddress2: json["shipping_address_2"] == null
            ? null
            : json["shipping_address_2"],
        shippingMobile:
            json["shipping_mobile"] == null ? null : json["shipping_mobile"],
        shippingEmail:
            json["shipping_email"] == null ? null : json["shipping_email"],
        shippingPost:
            json["shipping_post"] == null ? null : json["shipping_post"],
        shippingTown:
            json["shipping_town"] == null ? null : json["shipping_town"],
        shippingState:
            json["shipping_state"] == null ? null : json["shipping_state"],
        shippingCountryId: json["shipping_country_id"] == null
            ? null
            : json["shipping_country_id"],
        shippingNote:
            json["shipping_note"] == null ? null : json["shipping_note"],
        paymentBy: json["payment_by"] == null ? null : json["payment_by"],
        userId: json["user_id"] == null ? null : json["user_id"],
        userFirstName:
            json["user_first_name"] == null ? null : json["user_first_name"],
        userLastName:
            json["user_last_name"] == null ? null : json["user_last_name"],
        userAddress1:
            json["user_address_1"] == null ? null : json["user_address_1"],
        userPostCode:
            json["user_post_code"] == null ? null : json["user_post_code"],
        userCity: json["user_city"] == null ? null : json["user_city"],
        userCountryId:
            json["user_country_id"] == null ? null : json["user_country_id"],
        userMobile: json["user_mobile"] == null ? null : json["user_mobile"],
        userEmail: json["user_email"] == null ? null : json["user_email"],
        ratecardRateid:
            json["ratecard_rateid"] == null ? null : json["ratecard_rateid"],
        ratecardProviderId: json["ratecard_provider_id"] == null
            ? null
            : json["ratecard_provider_id"],
        ratecardCtop:
            json["ratecard_ctop"] == null ? null : json["ratecard_ctop"],
        ratecardPrice:
            json["ratecard_price"] == null ? null : json["ratecard_price"],
        ratecardBp: json["ratecard_bp"] == null ? null : json["ratecard_bp"],
        ratecardTax: json["ratecard_tax"] == null
            ? null
            : json["ratecard_tax"].toDouble(),
        ratecardPLatlng: json["ratecard_p_latlng"] == null
            ? null
            : json["ratecard_p_latlng"],
        ratecardDLatlng: json["ratecard_d_latlng"] == null
            ? null
            : json["ratecard_d_latlng"],
        ratecardDistance: json["ratecard_distance"] == null
            ? null
            : json["ratecard_distance"].toDouble(),
        ratecardBillwt:
            json["ratecard_billwt"] == null ? null : json["ratecard_billwt"],
        ratecardReplyCode: json["ratecard_reply_code"] == null
            ? null
            : json["ratecard_reply_code"],
        ratecardReplyMsg: json["ratecard_reply_msg"] == null
            ? null
            : json["ratecard_reply_msg"],
        ratecardAwbNo:
            json["ratecard_awb_no"] == null ? null : json["ratecard_awb_no"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        paymentTxnId:
            json["payment_txn_id"] == null ? null : json["payment_txn_id"],
        details: json["details"] == null
            ? null
            : List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "order_no": orderNo == null ? null : orderNo,
        "discount": discount,
        "coupon_discount": couponDiscount,
        "tax": tax,
        "shipping_cost": shippingCost == null ? null : shippingCost,
        "total_price": totalPrice == null ? null : totalPrice,
        "coupon_id": couponId,
        "currency_id": currencyId == null ? null : currencyId,
        "exchange_rate": exchangeRate == null ? null : exchangeRate,
        "shipping_name": shippingName == null ? null : shippingName,
        "shipping_address_1":
            shippingAddress1 == null ? null : shippingAddress1,
        "shipping_address_2":
            shippingAddress2 == null ? null : shippingAddress2,
        "shipping_mobile": shippingMobile == null ? null : shippingMobile,
        "shipping_email": shippingEmail == null ? null : shippingEmail,
        "shipping_post": shippingPost == null ? null : shippingPost,
        "shipping_town": shippingTown == null ? null : shippingTown,
        "shipping_state": shippingState == null ? null : shippingState,
        "shipping_country_id":
            shippingCountryId == null ? null : shippingCountryId,
        "shipping_note": shippingNote == null ? null : shippingNote,
        "payment_by": paymentBy == null ? null : paymentBy,
        "user_id": userId == null ? null : userId,
        "user_first_name": userFirstName == null ? null : userFirstName,
        "user_last_name": userLastName == null ? null : userLastName,
        "user_address_1": userAddress1 == null ? null : userAddress1,
        "user_post_code": userPostCode == null ? null : userPostCode,
        "user_city": userCity == null ? null : userCity,
        "user_country_id": userCountryId == null ? null : userCountryId,
        "user_mobile": userMobile == null ? null : userMobile,
        "user_email": userEmail == null ? null : userEmail,
        "ratecard_rateid": ratecardRateid == null ? null : ratecardRateid,
        "ratecard_provider_id":
            ratecardProviderId == null ? null : ratecardProviderId,
        "ratecard_ctop": ratecardCtop == null ? null : ratecardCtop,
        "ratecard_price": ratecardPrice == null ? null : ratecardPrice,
        "ratecard_bp": ratecardBp == null ? null : ratecardBp,
        "ratecard_tax": ratecardTax == null ? null : ratecardTax,
        "ratecard_p_latlng": ratecardPLatlng == null ? null : ratecardPLatlng,
        "ratecard_d_latlng": ratecardDLatlng == null ? null : ratecardDLatlng,
        "ratecard_distance": ratecardDistance == null ? null : ratecardDistance,
        "ratecard_billwt": ratecardBillwt == null ? null : ratecardBillwt,
        "ratecard_reply_code":
            ratecardReplyCode == null ? null : ratecardReplyCode,
        "ratecard_reply_msg":
            ratecardReplyMsg == null ? null : ratecardReplyMsg,
        "ratecard_awb_no": ratecardAwbNo == null ? null : ratecardAwbNo,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "payment_txn_id": paymentTxnId == null ? null : paymentTxnId,
        "details": details == null
            ? null
            : List<dynamic>.from(details!.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    this.id,
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
    this.updatedAt,
    this.product,
  });

  int? id;
  int? sellerId;
  int? userId;
  int? orderId;
  int? orderStat;
  int? productId;
  int? salePrice;
  int? qty;
  String? color;
  String? size;
  int? discount;
  int? tax;
  int? shippingCost;
  int? totalShippingCost;
  int? totalPrice;
  int? grandTotal;
  int? currencyId;
  int? exchangeRate;
  dynamic estimatedShippingDays;
  DateTime? createdAt;
  DateTime? updatedAt;
  Product? product;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"] == null ? null : json["id"],
        sellerId: json["seller_id"] == null ? null : json["seller_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        orderId: json["order_id"] == null ? null : json["order_id"],
        orderStat: json["order_stat"] == null ? null : json["order_stat"],
        productId: json["product_id"] == null ? null : json["product_id"],
        salePrice: json["sale_price"] == null ? null : json["sale_price"],
        qty: json["qty"] == null ? null : json["qty"],
        color: json["color"] == null ? null : json["color"],
        size: json["size"] == null ? null : json["size"],
        discount: json["discount"] == null ? null : json["discount"],
        tax: json["tax"] == null ? null : json["tax"],
        shippingCost:
            json["shipping_cost"] == null ? null : json["shipping_cost"],
        totalShippingCost: json["total_shipping_cost"] == null
            ? null
            : json["total_shipping_cost"],
        totalPrice: json["total_price"] == null ? null : json["total_price"],
        grandTotal: json["grand_total"] == null ? null : json["grand_total"],
        currencyId: json["currency_id"] == null ? null : json["currency_id"],
        exchangeRate:
            json["exchange_rate"] == null ? null : json["exchange_rate"],
        estimatedShippingDays: json["estimated_shipping_days"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "seller_id": sellerId == null ? null : sellerId,
        "user_id": userId == null ? null : userId,
        "order_id": orderId == null ? null : orderId,
        "order_stat": orderStat == null ? null : orderStat,
        "product_id": productId == null ? null : productId,
        "sale_price": salePrice == null ? null : salePrice,
        "qty": qty == null ? null : qty,
        "color": color == null ? null : color,
        "size": size == null ? null : size,
        "discount": discount == null ? null : discount,
        "tax": tax == null ? null : tax,
        "shipping_cost": shippingCost == null ? null : shippingCost,
        "total_shipping_cost":
            totalShippingCost == null ? null : totalShippingCost,
        "total_price": totalPrice == null ? null : totalPrice,
        "grand_total": grandTotal == null ? null : grandTotal,
        "currency_id": currencyId == null ? null : currencyId,
        "exchange_rate": exchangeRate == null ? null : exchangeRate,
        "estimated_shipping_days": estimatedShippingDays,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "product": product == null ? null : product!.toJson(),
      };
}

class Product {
  Product({
    this.id,
    this.sellerId,
    this.categoryId,
    this.brandId,
    this.name,
    this.unit,
    this.tags,
    this.minimumQty,
    this.barcode,
    this.sku,
    this.length,
    this.width,
    this.height,
    this.weight,
    this.isRefundable,
    this.attributes,
    this.unitPrice,
    this.purchasePrice,
    this.salePrice,
    this.discount,
    this.quantity,
    this.shippingCost,
    this.description,
    this.pdfSpecification,
    this.metaTitle,
    this.metaDescription,
    this.metaImage,
    this.slug,
    this.totalViewed,
    this.isActive,
    this.publishStat,
    this.isWishlisted,
    this.images,
  });

  int? id;
  int? sellerId;
  int? categoryId;
  int? brandId;
  String? name;
  String? unit;
  String? tags;
  int? minimumQty;
  String? barcode;
  String? sku;
  int? length;
  int? width;
  int? height;
  int? weight;
  int? isRefundable;
  String? attributes;
  //KK
  double? unitPrice;
  int? purchasePrice;
  int? salePrice;
  double? discount;
  int? quantity;
  int? shippingCost;
  String? description;
  String? pdfSpecification;
  String? metaTitle;
  String? metaDescription;
  String? metaImage;
  String? slug;
  int? totalViewed;
  int? isActive;
  int? publishStat;
  bool? isWishlisted;
  List<ImageModel>? images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        sellerId: json["seller_id"] == null ? null : json["seller_id"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        brandId: json["brand_id"] == null ? null : json["brand_id"],
        name: json["name"] == null ? null : json["name"],
        unit: json["unit"] == null ? null : json["unit"],
        tags: json["tags"] == null ? null : json["tags"],
        minimumQty: json["minimum_qty"] == null ? null : json["minimum_qty"],
        barcode: json["barcode"] == null ? null : json["barcode"],
        sku: json["sku"] == null ? null : json["sku"],
        length: json["length"] == null ? null : json["length"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        weight: json["weight"] == null ? null : json["weight"],
        isRefundable:
            json["is_refundable"] == null ? null : json["is_refundable"],
        attributes: json["attributes"] == null ? null : json["attributes"],
        unitPrice: json["unit_price"] == null ? null : json["unit_price"],
        purchasePrice:
            json["purchase_price"] == null ? null : json["purchase_price"],
        salePrice: json["sale_price"] == null ? null : json["sale_price"],
        discount: json["discount"] == null ? null : json["discount"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        shippingCost:
            json["shipping_cost"] == null ? null : json["shipping_cost"],
        description: json["description"] == null ? null : json["description"],
        pdfSpecification: json["pdf_specification"] == null
            ? null
            : json["pdf_specification"],
        metaTitle: json["meta_title"] == null ? null : json["meta_title"],
        metaDescription:
            json["meta_description"] == null ? null : json["meta_description"],
        metaImage: json["meta_image"] == null ? null : json["meta_image"],
        slug: json["slug"] == null ? null : json["slug"],
        totalViewed: json["total_viewed"] == null ? null : json["total_viewed"],
        isActive: json["is_active"] == null ? null : json["is_active"],
        publishStat: json["publish_stat"] == null ? null : json["publish_stat"],
        isWishlisted:
            json["is_wishlisted"] == null ? null : json["is_wishlisted"],
        images: json["images"] == null
            ? null
            : List<ImageModel>.from(
                json["images"].map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "seller_id": sellerId == null ? null : sellerId,
        "category_id": categoryId == null ? null : categoryId,
        "brand_id": brandId == null ? null : brandId,
        "name": name == null ? null : name,
        "unit": unit == null ? null : unit,
        "tags": tags == null ? null : tags,
        "minimum_qty": minimumQty == null ? null : minimumQty,
        "barcode": barcode == null ? null : barcode,
        "sku": sku == null ? null : sku,
        "length": length == null ? null : length,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "weight": weight == null ? null : weight,
        "is_refundable": isRefundable == null ? null : isRefundable,
        "attributes": attributes == null ? null : attributes,
        "unit_price": unitPrice == null ? null : unitPrice,
        "purchase_price": purchasePrice == null ? null : purchasePrice,
        "sale_price": salePrice == null ? null : salePrice,
        "discount": discount == null ? null : discount,
        "quantity": quantity == null ? null : quantity,
        "shipping_cost": shippingCost == null ? null : shippingCost,
        "description": description == null ? null : description,
        "pdf_specification": pdfSpecification == null ? null : pdfSpecification,
        "meta_title": metaTitle == null ? null : metaTitle,
        "meta_description": metaDescription == null ? null : metaDescription,
        "meta_image": metaImage == null ? null : metaImage,
        "slug": slug == null ? null : slug,
        "total_viewed": totalViewed == null ? null : totalViewed,
        "is_active": isActive == null ? null : isActive,
        "publish_stat": publishStat == null ? null : publishStat,
        "is_wishlisted": isWishlisted == null ? null : isWishlisted,
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class ImageModel {
  ImageModel({
    this.id,
    this.productId,
    this.image,
  });

  int? id;
  int? productId;
  String? image;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"] == null ? null : json["id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "product_id": productId == null ? null : productId,
        "image": image == null ? null : image,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"] == null ? null : json["label"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label == null ? null : label,
        "active": active == null ? null : active,
      };
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
