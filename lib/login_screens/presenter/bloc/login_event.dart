part of 'login_bloc.dart';

abstract class UserLoginEvent {
  const UserLoginEvent();
}

class LoadInitialData extends UserLoginEvent {
  LoadInitialData();
}
class SendOTPRequest extends UserLoginEvent {
  LoginRequestModel? requestModel;
  SendOTPRequest({required this.requestModel});
}

class LoginSubmittedEvent extends UserLoginEvent {
  final String firstNameValue;
  final String lastNameValue;
  final String emailValue;
  LoginSubmittedEvent(this.firstNameValue, this.lastNameValue, this.emailValue);
}


class LoginInTextChangeEvent extends UserLoginEvent {
  final String firstNameValue;
  final String lastNameValue;
  final String emailValue;
  final String type;
  LoginInTextChangeEvent(
      this.firstNameValue, this.lastNameValue, this.emailValue,this.type);
}
