import 'package:dio/dio.dart';
import '../../../api/api_constants.dart';
import '../../../api/api_response.dart';
import '../../../api/api_service.dart';
import '../../data/model/login_request_model.dart';

class LoginProvider {
  LoginProvider({required this.api});
  ApiService api;
  // Function for order summary screen
  Future<ApiResponse> login(LoginRequestModel requestModel) async {
    try {
      final response = await api.dio.post(ApiConstants.login,
          data: requestModel.requestOTPJson(),
          options: Options(method: 'POST', contentType: "application/json"));
      return ApiResponse.success(response);
    } on DioException catch (e) {
      return ApiResponse.failure(e);
    }
  }

}
