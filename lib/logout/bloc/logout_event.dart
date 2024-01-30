part of 'logout_bloc.dart';

@immutable
abstract class LogoutEvent {}

class LogOutEvent extends LogoutEvent {
  final LogoutRequestModel? logoutRequest;

  LogOutEvent({this.logoutRequest});
}
