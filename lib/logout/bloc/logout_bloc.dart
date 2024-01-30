import 'package:bloc/bloc.dart';
import 'package:injector/injector.dart';
import 'package:meta/meta.dart';
import '../domain/logout_repository.dart';
import '../model/logout_request_model.dart';
import '../model/logout_response_model.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogOutRepository _logoutRepository =
      Injector.appInstance.get<LogOutRepository>();
  LogoutBloc() : super(LogoutInitial()) {
    on<LogOutEvent>(_handleLogout);
  }
  void _handleLogout(LogOutEvent event, Emitter<LogoutState> emit) async {
    final response =
        await _logoutRepository.logout(logoutRequest: event.logoutRequest!);
    emit(LogOutState(logoutResponse: response));
  }
}
