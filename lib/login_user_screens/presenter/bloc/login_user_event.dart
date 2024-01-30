part of 'login_user_bloc.dart';
abstract class LoginUserEvent {
  const LoginUserEvent();
}
class LoadLoginInitialData extends LoginUserEvent {
  LoadLoginInitialData();
}
class SendLoginOTPRequest extends LoginUserEvent{
  LoginUserRequestModel? requestModel;
  SendLoginOTPRequest({required this.requestModel});
}
class EmailChangedEvent extends LoginUserEvent{
  final String emailValue;
  EmailChangedEvent(this.emailValue);
}
class GetVerificationEvent extends LoginUserEvent{
  final String? email;
  final LoginUserRequestModel loginRequestModel;
  GetVerificationEvent(this.loginRequestModel,this.email);
}
class TextFieldTapped extends LoginUserEvent {}

class OtpVerifyTapped extends LoginUserEvent {
  final String action;
  final String name;
  final String otp;
  OtpVerifyTapped(this.action,this.name,this.otp);
}

class StartResendTimer extends LoginUserEvent {}
class UpdateResendTimer extends LoginUserEvent {
  final int remainingDuration;
  UpdateResendTimer(this.remainingDuration);
}