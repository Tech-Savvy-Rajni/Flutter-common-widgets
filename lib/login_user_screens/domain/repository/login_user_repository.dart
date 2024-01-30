import 'package:injector/injector.dart';
import '../../data/model/login_get_verification_code.dart';
import '../../data/model/login_otp_response_model.dart';
import '../../data/model/login_user_request_model.dart';
import '../../data/model/login_user_response_model.dart';
import '../provider/login_user_provider.dart';

class LoginUserRepository {
  final _loginProvider =
  Injector.appInstance.get<LoginUserProvider>();
  //Function for login
  Future<LoginGetVerificationCode?> login(
      {required LoginUserRequestModel requestModel}) async {
    final response = await _loginProvider.login(requestModel);
    print("Login response in repository");
    print(response);
    if (response.success) {
      LoginGetVerificationCode? loginResponse = LoginGetVerificationCode.fromJson(response.body);
      return loginResponse;
    } else {
      return null;
    }
  }
  Future<OtpResponseModel?> verifyOtp(
      {required LoginUserRequestModel otpRequestModel}) async {
    final response =
    await _loginProvider.verifyOtp(otpRequestModel: otpRequestModel);
    if (response.success) {
      OtpResponseModel otpResponse = OtpResponseModel.fromJson(response.body);
      return otpResponse;
    } else {
      return null;
    }
  }

}
