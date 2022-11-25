import 'dart:convert';

class BookOrderProductModel {
  final String pname;
  final String hsn;
  final int qty;
  final double tax;
  final double price;
  final double dis;
  BookOrderProductModel({
    required this.pname,
    required this.hsn,
    required this.qty,
    required this.tax,
    required this.price,
    required this.dis,
  });

  Map<String, dynamic> toMap() {
    return {
      'pname': pname,
      'hsn': hsn,
      'qty': qty,
      'tax': tax,
      'price': price,
      'dis': dis,
    };
  }

  factory BookOrderProductModel.fromMap(Map<String, dynamic> map) {
    return BookOrderProductModel(
      pname: map['pname'] ?? '',
      hsn: map['hsn'] ?? '',
      qty: map['qty']?.toInt() ?? 0,
      tax: map['tax']?.toDouble() ?? 0.0,
      price: map['price']?.toDouble() ?? 0.0,
      dis: map['dis']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookOrderProductModel.fromJson(String source) =>
      BookOrderProductModel.fromMap(json.decode(source));

  BookOrderProductModel copyWith({
    String? pname,
    String? hsn,
    int? qty,
    double? tax,
    double? price,
    double? dis,
  }) {
    return BookOrderProductModel(
      pname: pname ?? this.pname,
      hsn: hsn ?? this.hsn,
      qty: qty ?? this.qty,
      tax: tax ?? this.tax,
      price: price ?? this.price,
      dis: dis ?? this.dis,
    );
  }
}
