import 'package:injector/injector.dart';
import 'api/api_service.dart';
import 'login_screens/domain/provider/login_provider.dart';
import 'login_screens/domain/repository/login_repository.dart';
import 'login_user_screens/domain/provider/login_user_provider.dart';
import 'login_user_screens/domain/repository/login_user_repository.dart';


void setupDependencyInjections() async {
  Injector injector = Injector.appInstance;
  injector.registerSingleton<ApiService>(() => ApiService());
  _loginRepositoryDI(injector);
  _loginProviderDI(injector);

  _loginUserRepositoryDI(injector);
  _loginUserProviderDI(injector);
}

void _loginRepositoryDI(Injector injector) {
  injector.registerDependency<LoginRepository>(() {
    return LoginRepository();
  });
}

void _loginProviderDI(Injector injector) {
  injector.registerDependency<LoginProvider>(() {
    ApiService api = injector.get<ApiService>();
    return LoginProvider(api: api);
  });
}
void _loginUserRepositoryDI(Injector injector) {
  injector.registerDependency<LoginUserRepository>(() {
    return LoginUserRepository();
  });
}

void _loginUserProviderDI(Injector injector) {
  injector.registerDependency<LoginUserProvider>(() {
    ApiService api = injector.get<ApiService>();
    return LoginUserProvider(api: api);
  });
}
