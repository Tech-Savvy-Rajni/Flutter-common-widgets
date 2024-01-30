import 'package:injector/injector.dart';
import '../../data/model/login_request_model.dart';
import '../../data/model/login_response_model.dart';
import '../provider/login_provider.dart';

class LoginRepository {
  final _loginProvider =
  Injector.appInstance.get<LoginProvider>();
  //Function for login
  Future<UserDetailsModel?> login(
      {required LoginRequestModel requestModel}) async {
    final response = await _loginProvider.login(requestModel);
    print("Login response");
    print(response);
    if (response.success) {
      UserDetailsModel? loginResponse = UserDetailsModel.fromJson(response.body);
      return loginResponse;
    } else {
      return null;
    }
  }
}
