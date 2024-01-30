import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:injector/injector.dart';
import '../../../common/validator.dart';
import '../../../login_screens/presenter/bloc/login_bloc.dart';
import '../../../utils/common_widgets/common.dart';
import '../../../utils/constants/strings.dart';
import '../../data/model/login_get_verification_code.dart';
import '../../data/model/login_otp_response_model.dart';
import '../../data/model/login_user_request_model.dart';
import '../../data/model/login_user_response_model.dart';
import '../../domain/repository/login_user_repository.dart';

part 'login_user_state.dart';
part 'login_user_event.dart';
@injectable
class LoginUserBloc extends Bloc<LoginUserEvent, LoginUserState> {
  final LoginUserRepository _loginRepository =
  Injector.appInstance.get<LoginUserRepository>();
  LoginUserDetailsModel? responseLoginModel;
  LoginGetVerificationCode? responseLoginCodeModel;
  LoginGetVerificationCode? loginData;
  String? emailErr;
  String? otpErr;
  String? otp;
  static const int initialDuration = 30;
  StreamSubscription<int>? _timerSubscription;

  LoginUserBloc() : super(LoginUserPageLoading()) {
    //code for send otp on click get verification code button
    on<GetVerificationEvent>((GetVerificationEvent event, Emitter<LoginUserState> emit) async {
      emailErr = validateContact(event.email);
      if (emailErr != null) {
         emit(ContactValidate(event.email));
      }else{
        loginData = (await _loginRepository.login(requestModel:event.loginRequestModel));
        if(loginData != null && loginData?.status == 'success'){
          toast('OTP has been sent');
          emit(LoginSuccess(loginData!));
        }else{
          emit(LoginFailure());
        }
      }
    });
    //code for verify otp
    on<OtpVerifyTapped>((event, emit) async {
      otpErr = _validateOtp(event.otp);
      if (otpErr != null) {
        toast(otpErr.toString());
        emit(OtpValidate(event.otp));
      } else {
        LoginUserRequestModel requestModel = LoginUserRequestModel(
          otp: int.parse(event.otp),
          action: event.action,
          otpNumber: loginData?.otpnumber,
          name: event.name
        );
        OtpResponseModel? otpVerifyResponse = await _getOtpVerify(requestModel);
        bool otpVerifyData = otpVerifyResponse != null && otpVerifyResponse.toString().isNotEmpty;
        if (otpVerifyData) {
          toast('Logged in successfully');
          emit(OtpVerifySuccess());
        } else {
          toast('OTP does not match');
          emit(OtpVerifyFailure());
        }
      }
    });
    //code for on text field click clear message
    on<TextFieldTapped>((TextFieldTapped event, Emitter<LoginUserState> emit) {
      otpErr = null;
      emailErr = null;
      emit(ClearErrMsg());
    });

    on<LoadLoginInitialData>((event, emit) async {
         emit(LoginUserLoaded());
    });

    on<SendLoginOTPRequest>((event, emit) async {
      print("I am working fine on line 20");
      print(event.requestModel?.name);
      var response = _loginRepository.login(requestModel: event.requestModel!);
      //emit(SendOTPState());
    });

    // @override
    // Stream<int> mapEventToState(LoginUserEvent event) async* {
    //   if (event is StartResendTimer) {
    //     const int initialDuration = 60; // Initial timer duration in seconds
    //     yield initialDuration;
    //
    //     _timerSubscription?.cancel();
    //     _timerSubscription = Stream.periodic(const Duration(seconds: 1), (count) {
    //       return initialDuration - count;
    //     }).take(initialDuration + 1).listen((remainingDuration) {
    //       add(UpdateResendTimer(remainingDuration));
    //     });
    //   } else if (event is UpdateResendTimer) {
    //     yield event.remainingDuration;
    //   }
    // }
    //
    // @override
    // Future<void> close() {
    //   _timerSubscription?.cancel();
    //   return super.close();
    // }

  }
  //function for validate email field
  String? validateContact(String? email) {
    if (email!.isEmpty) {
      return 'Please enter email address';
    }else if (Validator.isEmailValid(value: email) == false) {
      return pleaseEnterValidEmailAddress;
    } else {
      return null;
    }
  }
  //function to validate otp field validation
  String? _validateOtp(String otp) {
    if (otp.isEmpty) {
      return 'Please enter OTP';
    } else if (otp.length < 4) {
      return 'Please enter complete OTP';
    } else {
      return null;
    }
  }
  // function to get verification token
  Future<OtpResponseModel?> _getOtpVerify(
      LoginUserRequestModel requestModel) async {
    try {
      OtpResponseModel? data =
      await _loginRepository.verifyOtp(otpRequestModel: requestModel);
      String model = requestModel.toJson().toString();
      return data;
    } catch (e) {
      return null;
    }
  }

}
