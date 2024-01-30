/// status : "error"
/// code : "apiKeyMissing"
/// message : "Your API key is missing. Append this to the URL with the apiKey param, or use the x-api-key HTTP header."

class ErrorResponse {
  ErrorResponse({
      this.message});

  ErrorResponse.fromJson(dynamic json) {
    message = json['message'];
  }
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

}