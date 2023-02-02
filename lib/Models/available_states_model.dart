import 'dart:convert';

class AvailableStatesModel {
  final String state_key;
  final String name;
  const AvailableStatesModel({
    required this.state_key,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'state_key': state_key,
      'name': name,
    };
  }

  factory AvailableStatesModel.fromMap(Map<String, dynamic> map) {
    return AvailableStatesModel(
      state_key: map['state_key'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AvailableStatesModel.fromJson(String source) =>
      AvailableStatesModel.fromMap(json.decode(source));
}

class AvailableStatesApiResponse {
  final bool success;
  final String message;
  final List<AvailableStatesModel> value;
  const AvailableStatesApiResponse({
    required this.success,
    required this.message,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'value': value.map((x) => x.toMap()).toList(),
    };
  }

  factory AvailableStatesApiResponse.fromMap(Map<String, dynamic> map) {
    return AvailableStatesApiResponse(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      value: List<AvailableStatesModel>.from(
        map['value']?.map(
          (x) => AvailableStatesModel.fromMap(
            Map<String, dynamic>.from(x),
          ),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AvailableStatesApiResponse.fromJson(String source) =>
      AvailableStatesApiResponse.fromMap(json.decode(source));
}
