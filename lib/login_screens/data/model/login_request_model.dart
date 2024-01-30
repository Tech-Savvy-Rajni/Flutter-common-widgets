class LoginRequestModel {
  String? action;
  String? name;
  int? otp;
  int? otpNumber;

  LoginRequestModel({required this.action,this.name,this.otp, this.otpNumber});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['action'] = action;
    data['name']   = name;
    data['otp']    = otp;
    data['otpnumber'] = otpNumber;
    return data;
  }
  Map<String, dynamic> requestOTPJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['action'] = action;
    data['name']   = name;
    return data;
  }
  Map<String, dynamic> resendOTPJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['action'] = action;
    data['otpnumber']  = otpNumber;
    return data;
  }
  Map<String, dynamic> confirmOTPJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['action'] = action;
    data['otpnumber']   = otpNumber;
    return data;
  }
}


