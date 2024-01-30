
abstract class InternetState {}

class InitState extends InternetState{}

class ConnectedState extends InternetState{
  String msg;
  ConnectedState({required this.msg});
}

class NotConnectedState extends InternetState{
  String msg;
  NotConnectedState({required this.msg});
}