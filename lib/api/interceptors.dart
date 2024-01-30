import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:platform_device_id/platform_device_id.dart';
import '../models/error_response.dart';
import '../utils/common_widgets/common.dart';
import '../utils/common_widgets/shared_pref.dart';
import 'api_service.dart';
import 'environment.dart';

InterceptorsWrapper requestInterceptor(Dio dio, Environment env) =>
    InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler requestHandler) async {
        final uri = options.uri.toString();
        String? deviceId = SharedPref.getString(SharedPref.deviceId);
        if(deviceId.isEmpty) {
          deviceId = await PlatformDeviceId.getDeviceId;
          SharedPref.setString(SharedPref.deviceId, deviceId ?? '');
        }
        options.headers["deviceid"] = deviceId;
        if (options.headers.containsKey('Authorization') &&  options.headers["Authorization"] != null) {
          options.headers["Authorization"] = "Bearer ${SharedPref.getString(SharedPref.authTokenKey, def: '')}";
        }
        if (ApiService().isInDebugMode) {
          debugPrint("Api - URL: ${uri.toString()}");
          debugPrint("Api - Request Body: ${options.data}");
          debugPrint("Api - Request header: ${options.headers}");
        }
        return requestHandler.next(options);
      },
      onResponse: (Response<dynamic> response,
          ResponseInterceptorHandler requestHandler) {
        debugPrint("Api - Response statusCode: ${response.statusCode}");
        EasyLoading.dismiss();
        if (ApiService().isInDebugMode) {
          debugPrint("Api - Response: ${response.data}");
        }
        debugPrint('response $response');
        return requestHandler.next(response);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) async {
        debugPrint("##########-----ERROR----#######");

        // ProgressDialog.hideProgressDialog();
        EasyLoading.dismiss();
        if ((e.message ?? '').contains('SocketException')) {
          // print("Socket");
          toast("Please check your internet connection");
          return;
        }
        handleErrorStatus(e.response, e.requestOptions.path);

        return handler.next(e);
      },
    );

Future<void> handleErrorStatus(response, String path) async {
  debugPrint("Error is ${response?.data}");
  debugPrint("Error Code = ${response?.statusCode}");
  if (response != null) {
    switch (response.statusCode) {
      case 500:
        toast('oops, something went wrong. Please try again later.');
        break;
      case 401:
        if (path != "user/logout") {
          SharedPref.clearPref();
          String? deviceId = await PlatformDeviceId.getDeviceId;
          toast(response?.data["message"] ?? "Something went wrong");
        }
        break;
      default:
        final message = ErrorResponse.fromJson(response.data);
        toast(message.message.toString());
        break;
    }
  }

  return;
}
