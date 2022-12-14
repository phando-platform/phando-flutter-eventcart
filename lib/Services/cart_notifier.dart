import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Models/order_create_model.dart';

class CartNotifier extends ChangeNotifier {
  final cartItems = <Cart>[];

  void addItem(Cart cart) {
    cartItems.add(cart);
    notifyListeners();
  }

  List<Carts> getItems() {
    final carts = <Carts>[];
    for (var item in cartItems) {
      Carts items = Carts(
        id: item.id.toString(),
        price: item.price.toString(),
        quantity: item.quantity.toString(),
        color: item.color.toString(),
        size: item.size.toString(),
        shippingCost: item.shippingCost.toString(),
        productPriceTotal:
            (item.productPriceTotal + item.shippingCost).toString(),
        estimatedShippingDays: item.estimatedShippingDays.toString(),
      );
      carts.add(items);
    }
    return carts;
  }

  void removeItem(int id) {
    cartItems.remove(cartItems.firstWhere((element) => element.id == id));
    notifyListeners();
  }

  bool checkCart(int id, String size, String color) {
    bool isAdded = false;
    for (var item in cartItems) {
      if (item.id == id && item.size == size ||
          item.id == id && item.color == color) {
        isAdded = true;
        notifyListeners();
      }
    }
    return isAdded;
  }

  double getShippingCharge() {
    double charge = 0.0;
    for (var item in cartItems) {
      charge = item.shippingCost + charge;
    }
    notifyListeners();
    return charge;
  }

  double getTotalCharge() {
    double charge = 0.0;
    for(var item in cartItems){
      charge = item.productPriceTotal + charge;
    }
    notifyListeners();
    return charge;
  }

  double getSubTotal(){
    double subTotal = 0.0;
    for(var item in cartItems){
      subTotal = double.parse(item.price * item.quantity);
    }
    notifyListeners();
    return subTotal;
  }

  void updatePrice(int itemId, int quantity){
    for(final item in cartItems){
      if(item.id == itemId){
        item.productPriceTotal = item.price * quantity;
        item.quantity = quantity;
        notifyListeners();
      }
    }
  }

  void couponForProduct(List<String> productId, int discount, String type){
    for(var item in cartItems){
      for(var id in productId){
        if(item.id == id){
          if(type == 'percent'){
            item.productPriceTotal = item.productPriceTotal * (discount / 100);
          } else{
            item.productPriceTotal = item.productPriceTotal - discount ;
          }
        }
      }
    }
    notifyListeners();
  }

  double couponForCart(int total, int min, int max, int discount, String type){
    double disc = 0.0;
    if(total > min){
      if(type == 'percent'){
        disc = total * (discount / 100);
      } else{
        disc = discount.toDouble();
      }
    }
    notifyListeners();
    return disc > 100.0 ? 100.0 : disc;
  }

}

final cartProvider = ChangeNotifierProvider<CartNotifier>((ref) {
  return CartNotifier();
});