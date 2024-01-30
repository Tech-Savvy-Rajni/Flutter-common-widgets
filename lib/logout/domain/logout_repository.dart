import 'package:injector/injector.dart';

import '../../utils/common_widgets/common.dart';
import '../model/logout_request_model.dart';
import '../model/logout_response_model.dart';
import 'logout_provider.dart';

class LogOutRepository {
  final _logOutProvider = Injector.appInstance.get<LogoutProvider>();

  //
  // Future<LogoutResponseModel?> logout(
  //     {required LogoutRequestModel logoutRequest}) async {
  //   final response =
  //   await _logOutProvider.userLogout(logoutRequest: logoutRequest);
  //   LogoutResponseModel? logoutResponse =
  //   LogoutResponseModel.fromJson(response.body);
  //   if (response.success) {
  //     return logoutResponse;
  //   } else {
  //     return null;
  //   }
  // }

  Future<LogoutResponseModel?> logout(
      {required LogoutRequestModel logoutRequest}) async {
    final response =
        await _logOutProvider.userLogout(logoutRequest: logoutRequest);
    if (response.success) {
      LogoutResponseModel logoutResponse =
          LogoutResponseModel.fromJson(response.body);
      return logoutResponse;
    } else {
      toast(response.error?.response?.data['message']);
      return null;
    }
  }
}
