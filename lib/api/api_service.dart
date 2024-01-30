import 'package:dio/dio.dart';
import 'api_constants.dart';
import 'environment.dart';
import 'interceptors.dart';

class ApiService {
  static ApiService? _instance;

  factory ApiService() => _instance ??= ApiService._();

  ApiService._();

  static const String userAgent = "user-agent";
  static const _timeout = 600000;

  bool get isInDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }

  Environment _env = _Dev();
  // Environment _env = _Prod();

  Environment get env => _env;

  Dio get dio => _dio();

  Dio _dio() {
    final options = BaseOptions(
      baseUrl: _env.baseUrl,
      connectTimeout: const Duration(seconds: _timeout),
      receiveTimeout: const Duration(seconds: _timeout),
    );

    var dio = Dio(options);
    dio.interceptors.add(requestInterceptor(dio, _env));
    return dio;
  }

  void setEnvironment(EnvironmentType type) {
    switch (type) {
      case EnvironmentType.dev:
        _env = _Dev();
        break;
      default:
        _env = _Prod();
    }
  }
}

class _Prod extends Environment {
  @override
  EnvironmentType get type => EnvironmentType.prod;

  @override
  String get baseUrl => ApiConstants.productionBaseUrl;

  @override
  String get apiKey => "For api key";
}

class _Dev extends Environment {
  @override
  EnvironmentType get type => EnvironmentType.dev;

  @override
  String get baseUrl => ApiConstants.devBaseUrl;

  @override
  String get apiKey => "For api key";
}

enum ApiStatus { initial, loading, success, error }
