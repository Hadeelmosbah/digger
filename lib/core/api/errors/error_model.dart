class ErrorModel {
  final int? code;
  final String description;
  final Map<String, dynamic>? errors;

  ErrorModel({this.code, required this.description, this.errors});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      code: jsonData['code'] ,
      description: jsonData['description'] ,
      errors: jsonData['errors'] as Map<String, dynamic>?,
    );
  }

  String get displayMessage {
    if (errors != null && errors!.isNotEmpty) {
      final firstKey = errors!.keys.first;
      final firstError = (errors![firstKey] as List).first;
      return firstError;
    }
    return description;
  }
}
