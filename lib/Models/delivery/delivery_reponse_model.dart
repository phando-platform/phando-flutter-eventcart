import 'dart:convert';

class DeliveryResponseModel {
  final int rateId;
  final double ctop;
  final double price;
  final double bp;
  final double tax;
  final String provider;
  final int tat;
  final double codCharge;
  final String miniwt;
  final String providerName;
  final String rateName;
  final double billwt;
  final double insurance;
  final double taxonins;
  final String dpImg;

  DeliveryResponseModel({
    required this.rateId,
    required this.ctop,
    required this.price,
    required this.bp,
    required this.tax,
    required this.provider,
    required this.tat,
    required this.codCharge,
    required this.miniwt,
    required this.providerName,
    required this.rateName,
    required this.billwt,
    required this.insurance,
    required this.taxonins,
    required this.dpImg,
  });

  Map<String, dynamic> toMap() {
    return {
      'rateid': rateId,
      'ctop': ctop,
      'price': price,
      'bp': bp,
      'tax': tax,
      'provider': provider,
      'tat': tat,
      'Codcharge': codCharge,
      'miniwt': miniwt,
      'RroviderName': providerName,
      'RateName': rateName,
      'billwt': billwt,
      'insurance': insurance,
      'taxonins': taxonins,
      'dp_img': dpImg,
    };
  }

  factory DeliveryResponseModel.fromMap(Map<String, dynamic> map) {
    return DeliveryResponseModel(
      rateId: map['rateid']?.toInt() ?? 0,
      ctop: map['ctop']?.toDouble() ?? 0.0,
      price: map['price']?.toDouble() ?? 0.0,
      bp: map['bp']?.toDouble() ?? 0.0,
      tax: map['tax']?.toDouble() ?? 0.0,
      provider: map['provider'] ?? '',
      tat: map['tat']?.toInt() ?? 0,
      codCharge: map['Codcharge']?.toDouble() ?? 0.0,
      miniwt: map['miniwt'] ?? '',
      providerName: map['ProviderName'] ?? '',
      rateName: map['RateName'] ?? '',
      billwt: map['billwt']?.toDouble() ?? 0.0,
      insurance: map['insurance']?.toDouble() ?? 0.0,
      taxonins: map['taxonins']?.toDouble() ?? 0.0,
      dpImg: map['dp_img'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryResponseModel.fromJson(String source) =>
      DeliveryResponseModel.fromMap(json.decode(source));

  DeliveryResponseModel copyWith({
    int? rateId,
    double? ctop,
    double? price,
    double? bp,
    double? tax,
    String? provider,
    int? tat,
    double? codCharge,
    String? miniwt,
    String? providerName,
    String? rateName,
    double? billwt,
    double? insurance,
    double? taxonins,
    String? dpImg,
  }) {
    return DeliveryResponseModel(
      rateId: rateId ?? this.rateId,
      ctop: ctop ?? this.ctop,
      price: price ?? this.price,
      bp: bp ?? this.bp,
      tax: tax ?? this.tax,
      provider: provider ?? this.provider,
      tat: tat ?? this.tat,
      codCharge: codCharge ?? this.codCharge,
      miniwt: miniwt ?? this.miniwt,
      providerName: providerName ?? this.providerName,
      rateName: rateName ?? this.rateName,
      billwt: billwt ?? this.billwt,
      insurance: insurance ?? this.insurance,
      taxonins: taxonins ?? this.taxonins,
      dpImg: dpImg ?? this.dpImg,
    );
  }
}
