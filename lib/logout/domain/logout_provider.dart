import 'dart:developer';

import 'package:dio/dio.dart';
import '../../../api/api_constants.dart';
import '../../../api/api_response.dart';
import '../../../api/api_service.dart';
import '../../utils/common_widgets/shared_pref.dart';
import '../model/logout_request_model.dart';

class LogoutProvider {
  LogoutProvider({required this.api});

  ApiService api;

  Future<ApiResponse> userLogout(
      {required LogoutRequestModel logoutRequest}) async {
    try {
      log(
          "here is the device token======${SharedPref.getString(SharedPref.authTokenKey, def: '')}");

      final response = await api.dio.put(
        ApiConstants.userLogOut,
        data: logoutRequest.toJson(),
        options: Options(contentType: "application/json", headers: {
          "Authorization":
              SharedPref.getString(SharedPref.authTokenKey, def: '')
        }),
      );
      return ApiResponse.success(response);
    } on DioException catch (e) {
      return ApiResponse.failure(e);
    }
  }
}

