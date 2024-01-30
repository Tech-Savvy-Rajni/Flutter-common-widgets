part of 'logout_bloc.dart';

@immutable
abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogOutState extends LogoutState {
  final LogoutResponseModel? logoutResponse;
  LogOutState({this.logoutResponse});
}
