class LogoutRequestModel {
  int? userId;
  int? roleId;
  String? deviceEMEI;

  LogoutRequestModel({this.userId, this.roleId, this.deviceEMEI});

  LogoutRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    roleId = json['roleId'];
    deviceEMEI = json['deviceEMEI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['roleId'] = roleId;
    data['deviceEMEI'] = deviceEMEI;
    return data;
  }
}
