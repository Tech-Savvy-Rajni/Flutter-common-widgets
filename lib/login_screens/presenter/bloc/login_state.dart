part of 'login_bloc.dart';

abstract class LoginState {
  const LoginState() : super();
}

class LoginPageLoadingState extends LoginState {
  @override
  String toString() => 'PageLoading';
}

class LoginLoaded extends LoginState {
  LoginLoaded();
}

class SendOTPState extends LoginState {
  String? message;
  SendOTPState({this.message});
}

class LoginInitialState extends LoginState {}

class LoginInValidState extends LoginState {}

class LoginValidState extends LoginState {

}

class LoginErrorState extends LoginState {
  final String errorMessage;
  LoginErrorState(this.errorMessage);
}

class TextFormFieldChangeState extends LoginState {}
