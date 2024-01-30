import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:injector/injector.dart';

import '../../../common/validator.dart';
import '../../data/model/login_request_model.dart';
import '../../data/model/login_response_model.dart';
import '../../domain/repository/login_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<UserLoginEvent, LoginState> {
  final LoginRepository _loginRepository =
      Injector.appInstance.get<LoginRepository>();
  UserDetailsModel? responseLoginModel;
  String? firstNameErrorMesssage;
  String? lastNameErrorMesssage;
  String? emailErrorMessage;
  LoginBloc() : super(LoginInitialState()) {
    // initialize class with initial state
    on<LoginSubmittedEvent>(_loginSubmittedEvent);
    on<LoginInTextChangeEvent>(_LoginInTextChangeEvent);
  }

  //CHECK CHANGE IN TEXTFIELD
  void _LoginInTextChangeEvent(
      LoginInTextChangeEvent event, Emitter<LoginState> emit) {
    if (event.type == 'firstname') {
      firstNameErrorMesssage = _firstvalidateName(event.firstNameValue);
    }
    if (event.type == 'lastname') {
      lastNameErrorMesssage = _lastvalidateName(event.lastNameValue);
    }
    if (event.type == 'email') {
      emailErrorMessage = _validateEmail(event.emailValue);
    }

    if ((firstNameErrorMesssage == null && event.firstNameValue != '') &&
        (lastNameErrorMesssage == null && event.lastNameValue != '') &&
        emailErrorMessage == null &&
        event.emailValue != '') {
      emit(LoginValidState());
    } else {
      emit(LoginInValidState());
    }
  }

  //SUBMIT BUTTON EVENT
  void _loginSubmittedEvent(
      LoginSubmittedEvent event, Emitter<LoginState> emit) {
    emit(LoginPageLoadingState());
  }

  String? _firstvalidateName(String? firstName) {
    if (firstName!.isEmpty) {
      return "Enter valid First Name";
    } else {
      return null;
    }
  }

  String? _lastvalidateName(String? lastName) {
    if (lastName!.isEmpty) {
      return "Enter valid Last Name";
    } else {
      return null;
    }
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) {
      return "Please Enter Email Address";
    } else if (!Validator.isEmailValid(value: email)) {
      return "Please Enter Valid Email Address";
    } else {
      return null;
    }
  }
}
