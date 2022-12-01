import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart' hide log;

class CartItemUi {
  int? id;
  String? productName;
  String? productImage;
  int? productQuantity;
  dynamic productPrice;
  String? productColor;
  String? productSize;
  String? minimumQtd;

  CartItemUi({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.productQuantity,
    required this.productPrice,
    required this.productColor,
    required this.productSize,
    required this.minimumQtd,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productName': productName,
      'productImage': productImage,
      'productQuantity': productQuantity,
      'productPrice': productPrice,
      'productColor': productColor,
      'productSize': productSize,
      'minimumQtd': minimumQtd,
    };
  }

  factory CartItemUi.fromMap(Map<String, dynamic> map) {
    return CartItemUi(
      id: map['id']?.toInt(),
      productName: map['productName'],
      productImage: map['productImage'],
      productQuantity: map['productQuantity']?.toInt(),
      productPrice: map['productPrice'] ?? null,
      productColor: map['productColor'],
      productSize: map['productSize'],
      minimumQtd: map['minimumQtd'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemUi.fromJson(String source) =>
      CartItemUi.fromMap(json.decode(source));
}

class CartItemNotifier extends ChangeNotifier {
  List<CartItemUi> cartItemUis = <CartItemUi>[];
  late SharedPreferences pref;

  void getSavedUiItem() async {
    pref = await SharedPreferences.getInstance();
    if (pref.containsKey('cart_ui_items')) {
      final savedCartUi = pref.getStringList('cart_ui_items') ?? [];
      cartItemUis = savedCartUi
          .map(
            (e) => CartItemUi.fromJson(
              jsonDecode(e),
            ),
          )
          .toList();
    }
  }

  // Let's allow the UI to add todos.
  Future<void> addUiItem(CartItemUi item) async {
    cartItemUis.add(item);
    pref = await SharedPreferences.getInstance();
    final result = await pref.setStringList(
      'cart_ui_items',
      cartItemUis.map((e) => jsonEncode(e)).toList(),
    );
    if (result) {
      notifyListeners();
    }
  }

  // Let's allow removing todos
  void removeUiItem(int itemId) async {
    cartItemUis
        .remove(cartItemUis.firstWhere((element) => element.id == itemId));
    pref = await SharedPreferences.getInstance();
    final result = await pref.setStringList(
      'cart_ui_items',
      cartItemUis.map((e) => jsonEncode(e)).toList(),
    );
    if (result) {
      notifyListeners();
    }
  }

  void deleteUICart() async {
    cartItemUis.clear();
    final result = await pref.setStringList(
      'cart_ui_items',
      [],
    );
    if (result) {
      notifyListeners();
    }
  }

  void updateQuantity(int itemId, {int? minimumQuantity}) {
    if (minimumQuantity != null) {
      for (final item in cartItemUis) {
        if (item.id == itemId) {
          if (!(item.productQuantity! >= minimumQuantity)) {
            item.productQuantity = minimumQuantity;
            notifyListeners();
          }
        }
      }
      return;
    }
    for (final item in cartItemUis) {
      if (item.id == itemId) {
        item.productQuantity =
                // item.productQuantity! < 10
                //     ?
                item.productQuantity! + 1
            // : item.productQuantity = 10
            ;
        notifyListeners();
      }
    }
  }

  void decreaseQuantity(int itemId) {
    for (final item in cartItemUis) {
      if (item.id == itemId) {
        item.productQuantity =
            item.productQuantity! > 1 ? item.productQuantity! - 1 : 1;
        notifyListeners();
      }
    }
  }
}

final cartItemUiProvider = ChangeNotifierProvider<CartItemNotifier>((ref) {
  return CartItemNotifier();
});
