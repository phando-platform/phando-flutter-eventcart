import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Discount{
  double? discountAmount;
  String? couponId;
  String? couponCode;

  Discount({this.couponId,this.couponCode,this.discountAmount});

}

class DiscountNotifier extends ChangeNotifier{
  Discount discountP = Discount();
  void getDiscountAmount(double discount){
    discountP.discountAmount = discount;
    notifyListeners();
  }

  void getCouponId(int id){
    discountP.couponId = id.toString();
    notifyListeners();
  }

  void getCouponCode(String code){
    discountP.couponCode = code.toString();
    notifyListeners();
  }

  Discount getInfo(){
    return discountP;
  }

}

final fetDiscountInfoProvider = ChangeNotifierProvider<DiscountNotifier>((ref) {
  return DiscountNotifier();
});