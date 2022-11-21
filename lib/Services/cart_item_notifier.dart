import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
}

class CartItemNotifier extends ChangeNotifier {
  final cartItemUis = <CartItemUi>[];
  // Let's allow the UI to add todos.
  void addUiItem(CartItemUi item) {
    cartItemUis.add(item);
    notifyListeners();
  }

  // Let's allow removing todos
  void removeUiItem(int itemId) {
    cartItemUis
        .remove(cartItemUis.firstWhere((element) => element.id == itemId));
    notifyListeners();
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
