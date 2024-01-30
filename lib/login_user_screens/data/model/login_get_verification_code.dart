class LoginGetVerificationCode {
  String? status;
  int? otpnumber;
  int? otp;
  String? message;

  LoginGetVerificationCode({
    this.status,
    this.otpnumber,
    this.otp,
    this.message,
  });

  LoginGetVerificationCode.fromJson(Map<String, dynamic> json){
    status = json['status'];
    otpnumber = json['otpnumber'];
    otp = json['otp'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['otpnumber'] = otpnumber;
    _data['otp'] = otp;
    _data['message'] = message;
    return _data;
  }
}