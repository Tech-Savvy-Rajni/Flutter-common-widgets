import 'package:dio/dio.dart';
import '../../../api/api_constants.dart';
import '../../../api/api_response.dart';
import '../../../api/api_service.dart';
import '../../data/model/login_get_verification_code.dart';
import '../../data/model/login_user_request_model.dart';

class LoginUserProvider {
  LoginUserProvider({required this.api});
  ApiService api;
  // Function for order summary screen
  Future<ApiResponse> login(LoginUserRequestModel requestModel) async {
    try {
      final response = await api.dio.post(ApiConstants.login,
          data: requestModel.requestOTPJson(),
          options: Options(method: 'POST', contentType: "application/json"));
      return ApiResponse.success(response);
    } on DioException catch (e) {
      return ApiResponse.failure(e);
    }
  }

  Future<ApiResponse> verifyOtp(
      {required LoginUserRequestModel otpRequestModel}) async {
    try {
      // USER ID IS NOW BEING PROVIDED IN LOGIN RESPONSE
      final response = await api.dio.post(ApiConstants.login,
          data: otpRequestModel.toJson(),
          options: Options(method: 'POST', contentType: "application/json"));
      return ApiResponse.success(response);
    } on DioException catch (e) {
      return ApiResponse.failure(e);
    }
  }

}
