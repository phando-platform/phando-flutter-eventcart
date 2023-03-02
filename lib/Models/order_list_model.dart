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
        "value": value?.toJson(),
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

  num? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  num? from;
  num? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  num? perPage;
  dynamic prevPageUrl;
  num? to;
  num? total;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
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
    this.deliveryDate,
    this.paymentTxnId,
    this.details,
  });

  num? id;
  String? orderNo;
  dynamic discount;
  dynamic couponDiscount;
  dynamic tax;
  num? shippingCost;
  num? totalPrice;
  dynamic couponId;
  num? currencyId;
  num? exchangeRate;
  ShippingName? shippingName;
  ShippingAddress1? shippingAddress1;
  String? shippingAddress2;
  String? shippingMobile;
  Email? shippingEmail;
  String? shippingPost;
  ShippingTown? shippingTown;
  ShippingState? shippingState;
  num? shippingCountryId;
  String? shippingNote;
  PaymentBy? paymentBy;
  num? userId;
  UserFirstName? userFirstName;
  UserLastName? userLastName;
  UserAddress1? userAddress1;
  String? userPostCode;
  ShippingState? userCity;
  num? userCountryId;
  String? userMobile;
  Email? userEmail;
  num? ratecardRateid;
  num? ratecardProviderId;
  num? ratecardCtop;
  num? ratecardPrice;
  num? ratecardBp;
  num? ratecardTax;
  RatecardPLatlng? ratecardPLatlng;
  RatecardDLatlng? ratecardDLatlng;
  num? ratecardDistance;
  num? ratecardBillwt;
  num? ratecardReplyCode;
  String? ratecardReplyMsg;
  String? ratecardAwbNo;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deliveryDate;
  String? paymentTxnId;
  List<Detail>? details;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderNo: json["order_no"],
        discount: json["discount"],
        couponDiscount: json["coupon_discount"],
        tax: json["tax"],
        shippingCost: json["shipping_cost"],
        totalPrice: json["total_price"],
        couponId: json["coupon_id"],
        currencyId: json["currency_id"],
        exchangeRate: json["exchange_rate"],
        shippingName: shippingNameValues.map[json["shipping_name"]],
        shippingAddress1:
            shippingAddress1Values.map[json["shipping_address_1"]],
        shippingAddress2: json["shipping_address_2"],
        shippingMobile: json["shipping_mobile"],
        shippingEmail: emailValues.map[json["shipping_email"]],
        shippingPost: json["shipping_post"],
        shippingTown: shippingTownValues.map[json["shipping_town"]],
        shippingState: shippingStateValues.map[json["shipping_state"]],
        shippingCountryId: json["shipping_country_id"],
        shippingNote: json["shipping_note"],
        paymentBy: paymentByValues.map[json["payment_by"]],
        userId: json["user_id"],
        userFirstName: userFirstNameValues.map[json["user_first_name"]],
        userLastName: userLastNameValues.map[json["user_last_name"]],
        userAddress1: userAddress1Values.map[json["user_address_1"]],
        userPostCode: json["user_post_code"],
        userCity: shippingStateValues.map[json["user_city"]],
        userCountryId: json["user_country_id"],
        userMobile: json["user_mobile"],
        userEmail: emailValues.map[json["user_email"]],
        ratecardRateid: json["ratecard_rateid"],
        ratecardProviderId: json["ratecard_provider_id"],
        ratecardCtop: json["ratecard_ctop"],
        ratecardPrice: json["ratecard_price"],
        ratecardBp: json["ratecard_bp"],
        ratecardTax: json["ratecard_tax"],
        ratecardPLatlng: ratecardPLatlngValues.map[json["ratecard_p_latlng"]],
        ratecardDLatlng: ratecardDLatlngValues.map[json["ratecard_d_latlng"]],
        ratecardDistance: json["ratecard_distance"],
        ratecardBillwt: json["ratecard_billwt"],
        ratecardReplyCode: json["ratecard_reply_code"],
        ratecardReplyMsg: json["ratecard_reply_msg"],
        ratecardAwbNo: json["ratecard_awb_no"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deliveryDate: json["delivery_date"] == null
            ? null
            : DateTime.parse(json["delivery_date"]),
        paymentTxnId: json["payment_txn_id"],
        details: json["details"] == null
            ? []
            : List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_no": orderNo,
        "discount": discount,
        "coupon_discount": couponDiscount,
        "tax": tax,
        "shipping_cost": shippingCost,
        "total_price": totalPrice,
        "coupon_id": couponId,
        "currency_id": currencyId,
        "exchange_rate": exchangeRate,
        "shipping_name": shippingNameValues.reverse[shippingName],
        "shipping_address_1": shippingAddress1Values.reverse[shippingAddress1],
        "shipping_address_2": shippingAddress2,
        "shipping_mobile": shippingMobile,
        "shipping_email": emailValues.reverse[shippingEmail],
        "shipping_post": shippingPost,
        "shipping_town": shippingTownValues.reverse[shippingTown],
        "shipping_state": shippingStateValues.reverse[shippingState],
        "shipping_country_id": shippingCountryId,
        "shipping_note": shippingNote,
        "payment_by": paymentByValues.reverse[paymentBy],
        "user_id": userId,
        "user_first_name": userFirstNameValues.reverse[userFirstName],
        "user_last_name": userLastNameValues.reverse[userLastName],
        "user_address_1": userAddress1Values.reverse[userAddress1],
        "user_post_code": userPostCode,
        "user_city": shippingStateValues.reverse[userCity],
        "user_country_id": userCountryId,
        "user_mobile": userMobile,
        "user_email": emailValues.reverse[userEmail],
        "ratecard_rateid": ratecardRateid,
        "ratecard_provider_id": ratecardProviderId,
        "ratecard_ctop": ratecardCtop,
        "ratecard_price": ratecardPrice,
        "ratecard_bp": ratecardBp,
        "ratecard_tax": ratecardTax,
        "ratecard_p_latlng": ratecardPLatlngValues.reverse[ratecardPLatlng],
        "ratecard_d_latlng": ratecardDLatlngValues.reverse[ratecardDLatlng],
        "ratecard_distance": ratecardDistance,
        "ratecard_billwt": ratecardBillwt,
        "ratecard_reply_code": ratecardReplyCode,
        "ratecard_reply_msg": ratecardReplyMsg,
        "ratecard_awb_no": ratecardAwbNo,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "delivery_date": deliveryDate?.toIso8601String(),
        "payment_txn_id": paymentTxnId,
        "details": details == null
            ? []
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

  num? id;
  num? sellerId;
  num? userId;
  num? orderId;
  num? orderStat;
  num? productId;
  num? salePrice;
  num? qty;
  Color? color;
  Color? size;
  num? discount;
  num? tax;
  num? shippingCost;
  num? totalShippingCost;
  num? totalPrice;
  num? grandTotal;
  num? currencyId;
  num? exchangeRate;
  dynamic estimatedShippingDays;
  DateTime? createdAt;
  DateTime? updatedAt;
  Product? product;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        sellerId: json["seller_id"],
        userId: json["user_id"],
        orderId: json["order_id"],
        orderStat: json["order_stat"],
        productId: json["product_id"],
        salePrice: json["sale_price"],
        qty: json["qty"],
        color: colorValues.map[json["color"]],
        size: colorValues.map[json["size"]],
        discount: json["discount"],
        tax: json["tax"],
        shippingCost: json["shipping_cost"],
        totalShippingCost: json["total_shipping_cost"],
        totalPrice: json["total_price"],
        grandTotal: json["grand_total"],
        currencyId: json["currency_id"],
        exchangeRate: json["exchange_rate"],
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
        "id": id,
        "seller_id": sellerId,
        "user_id": userId,
        "order_id": orderId,
        "order_stat": orderStat,
        "product_id": productId,
        "sale_price": salePrice,
        "qty": qty,
        "color": colorValues.reverse[color],
        "size": colorValues.reverse[size],
        "discount": discount,
        "tax": tax,
        "shipping_cost": shippingCost,
        "total_shipping_cost": totalShippingCost,
        "total_price": totalPrice,
        "grand_total": grandTotal,
        "currency_id": currencyId,
        "exchange_rate": exchangeRate,
        "estimated_shipping_days": estimatedShippingDays,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product": product?.toJson(),
      };
}

enum Color { NULL, EMPTY }

final colorValues = EnumValues({"": Color.EMPTY, "Null": Color.NULL});

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

  num? id;
  num? sellerId;
  num? categoryId;
  num? brandId;
  String? name;
  Unit? unit;
  Tags? tags;
  num? minimumQty;
  String? barcode;
  String? sku;
  num? length;
  num? width;
  num? height;
  num? weight;
  num? isRefundable;
  String? attributes;
  num? unitPrice;
  num? purchasePrice;
  num? salePrice;
  num? discount;
  num? quantity;
  num? shippingCost;
  String? description;
  String? pdfSpecification;
  String? metaTitle;
  String? metaDescription;
  String? metaImage;
  String? slug;
  num? totalViewed;
  num? isActive;
  num? publishStat;
  bool? isWishlisted;
  List<Image>? images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        sellerId: json["seller_id"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        name: json["name"],
        unit: unitValues.map[json["unit"]],
        tags: tagsValues.map[json["tags"]],
        minimumQty: json["minimum_qty"],
        barcode: json["barcode"],
        sku: json["sku"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        weight: json["weight"],
        isRefundable: json["is_refundable"],
        attributes: json["attributes"],
        unitPrice: json["unit_price"],
        purchasePrice: json["purchase_price"],
        salePrice: json["sale_price"],
        discount: json["discount"],
        quantity: json["quantity"],
        shippingCost: json["shipping_cost"],
        description: json["description"],
        pdfSpecification: json["pdf_specification"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaImage: json["meta_image"],
        slug: json["slug"],
        totalViewed: json["total_viewed"],
        isActive: json["is_active"],
        publishStat: json["publish_stat"],
        isWishlisted: json["is_wishlisted"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "seller_id": sellerId,
        "category_id": categoryId,
        "brand_id": brandId,
        "name": name,
        "unit": unitValues.reverse[unit],
        "tags": tagsValues.reverse[tags],
        "minimum_qty": minimumQty,
        "barcode": barcode,
        "sku": sku,
        "length": length,
        "width": width,
        "height": height,
        "weight": weight,
        "is_refundable": isRefundable,
        "attributes": attributes,
        "unit_price": unitPrice,
        "purchase_price": purchasePrice,
        "sale_price": salePrice,
        "discount": discount,
        "quantity": quantity,
        "shipping_cost": shippingCost,
        "description": description,
        "pdf_specification": pdfSpecification,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_image": metaImage,
        "slug": slug,
        "total_viewed": totalViewed,
        "is_active": isActive,
        "publish_stat": publishStat,
        "is_wishlisted": isWishlisted,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    this.id,
    this.productId,
    this.image,
  });

  num? id;
  num? productId;
  String? image;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        productId: json["product_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "image": image,
      };
}

enum Tags {
  EMPTY,
  CHINESE_NOODLES_CHILI_PANEER_MOMOS,
  NORTH_INDIAN_DAL_PANEER_ROTI
}

final tagsValues = EnumValues({
  "chinese,noodles,chili,paneer,momos": Tags.CHINESE_NOODLES_CHILI_PANEER_MOMOS,
  "": Tags.EMPTY,
  ",North,Indian,Dal,Paneer,Roti": Tags.NORTH_INDIAN_DAL_PANEER_ROTI
});

enum Unit { PIECE, KG }

final unitValues = EnumValues({"Kg": Unit.KG, "Piece": Unit.PIECE});

enum PaymentBy { COD }

final paymentByValues = EnumValues({"cod": PaymentBy.COD});

enum RatecardDLatlng { THE_286068551773912953, THE_285593693773418328 }

final ratecardDLatlngValues = EnumValues({
  "28.5593693,77.3418328": RatecardDLatlng.THE_285593693773418328,
  "28.6068551,77.3912953": RatecardDLatlng.THE_286068551773912953
});

enum RatecardPLatlng { THE_285355161773910265 }

final ratecardPLatlngValues = EnumValues(
    {"28.5355161,77.3910265": RatecardPLatlng.THE_285355161773910265});

enum ShippingAddress1 { A8_A_TOWER_SECTOR_68_NOIDA, CHHALLERA_GALI_NUMBER_2 }

final shippingAddress1Values = EnumValues({
  "a8 a tower sector 68 noida": ShippingAddress1.A8_A_TOWER_SECTOR_68_NOIDA,
  "chhallera gali number 2": ShippingAddress1.CHHALLERA_GALI_NUMBER_2
});

enum Email { ABHISHEK_CHAUHAN_PHANDO_COM, YASHVARDHAN1_GMAIL_COM }

final emailValues = EnumValues({
  "abhishek.chauhan@phando.com": Email.ABHISHEK_CHAUHAN_PHANDO_COM,
  "yashvardhan1@gmail.com": Email.YASHVARDHAN1_GMAIL_COM
});

enum ShippingName { ABHISHEK_CHAUHAN, YASH_VARDHAN }

final shippingNameValues = EnumValues({
  "abhishek Chauhan": ShippingName.ABHISHEK_CHAUHAN,
  "yash vardhan": ShippingName.YASH_VARDHAN
});

enum ShippingState { DELHI, NOIDA }

final shippingStateValues =
    EnumValues({"Delhi": ShippingState.DELHI, "Noida": ShippingState.NOIDA});

enum ShippingTown { NOIDA, SHIPPING_TOWN_NOIDA }

final shippingTownValues = EnumValues(
    {"noida": ShippingTown.NOIDA, "Noida": ShippingTown.SHIPPING_TOWN_NOIDA});

enum UserAddress1 { A8_A_TOWER, CHHALLERA_GALI_NUMBER_2 }

final userAddress1Values = EnumValues({
  "a8 a tower": UserAddress1.A8_A_TOWER,
  "chhallera gali number 2": UserAddress1.CHHALLERA_GALI_NUMBER_2
});

enum UserFirstName { ABHISHEK, YASH }

final userFirstNameValues = EnumValues(
    {"abhishek": UserFirstName.ABHISHEK, "yash": UserFirstName.YASH});

enum UserLastName { CHAUHAN, VARDHAN }

final userLastNameValues = EnumValues(
    {"Chauhan": UserLastName.CHAUHAN, "vardhan": UserLastName.VARDHAN});

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
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
