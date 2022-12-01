import 'dart:convert';

import 'package:event_app/Models/order_create_model.dart';

class DeliveryBodyModel {
  final String addressLineOne;
  final String shippingPost;
  final String shippingTown;
  final String shippingState;
  final String subTotal;
  final List<Carts> cart;
  const DeliveryBodyModel({
    required this.addressLineOne,
    required this.shippingPost,
    required this.shippingTown,
    required this.shippingState,
    required this.subTotal,
    required this.cart,
  });

  Map<String, dynamic> toMap() {
    return {
      'address_line_one': addressLineOne,
      'shipping_post': shippingPost,
      'shipping_town': shippingTown,
      'shipping_state': shippingState,
      'subTotal': subTotal,
      'cart': cart.map((x) => x.toMap()).toList(),
    };
  }

  factory DeliveryBodyModel.fromMap(Map<String, dynamic> map) {
    return DeliveryBodyModel(
      addressLineOne: map['address_line_one'] ?? '',
      shippingPost: map['shipping_post'] ?? '',
      shippingTown: map['shipping_town'] ?? '',
      shippingState: map['shipping_state'] ?? '',
      subTotal: map['subTotal'] ?? '',
      cart: List<Carts>.from(map['cart']?.map((x) => Carts.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryBodyModel.fromJson(String source) =>
      DeliveryBodyModel.fromMap(json.decode(source));
}
