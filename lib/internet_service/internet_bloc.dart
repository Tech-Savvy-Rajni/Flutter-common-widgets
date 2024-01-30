import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:keystatus/internet_service/internet_state.dart';
import 'package:keystatus/internet_service/internet_event.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? subscription;

  InternetBloc() : super(InitState()) {
    on<OnConnectedEvent>(_onConnectedEvent);
    on<OnNotConnectedEvent>(_onNotConnectedEvent);
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(OnConnectedEvent());
      } else {
        add(OnNotConnectedEvent());
      }
    });
  }
  void _onConnectedEvent(OnConnectedEvent event, Emitter<InternetState> emit) {
    emit(ConnectedState(msg: 'Connected....'));
  }

  _onNotConnectedEvent(OnNotConnectedEvent event, Emitter<InternetState> emit) {
    emit(NotConnectedState(msg: 'Not Connected ....'));
  }
}
