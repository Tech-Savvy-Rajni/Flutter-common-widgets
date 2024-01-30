part of 'login_user_bloc.dart';

abstract class LoginUserState {
  const LoginUserState() : super();
}

class LoginUserPageLoading extends LoginUserState {
  @override
  String toString() => 'PageLoading';
}
class LoginUserLoaded extends LoginUserState {
  LoginUserLoaded();
}
class SendOTPState extends LoginUserState {
  String? message;
  SendOTPState({this.message});
}
class LoginErrorState extends LoginUserState {
  final String errorMessage;
  LoginErrorState(this.errorMessage);
}
class LoginValidState extends LoginUserState {}

class ClearErrMsg extends LoginUserState {
  final String? email;
  ClearErrMsg({this.email});
  @override
  String toString() => email ?? '';
}

class LoginSuccess extends LoginUserState {
  LoginGetVerificationCode response;
  LoginSuccess(this.response);
}

class ContactValidate extends LoginUserState {
  final String? email;
  ContactValidate(this.email);
  @override
  String toString() => email ?? '';
}

class LoginFailure extends LoginUserState {}


class OtpValidate extends LoginUserState {
  final String otp;
  OtpValidate(this.otp);
  @override
  String toString() => otp;
}
class OtpVerifySuccess extends LoginUserState {
  @override
  String toString() => 'Successfully Verified';
}
class OtpVerifyFailure extends LoginUserState {
  @override
  String toString() => 'Error in verifying OTP';
}