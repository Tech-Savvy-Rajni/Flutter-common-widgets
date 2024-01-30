import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiResponse<T> {
  int? code;
  late T? body;
  DioException? error;
  bool success = false;

  ApiResponse.success(Response<T> response) {
    code = response.statusCode ?? 0;
    body = response.data ?? "" as T?;
    success = true;
  }

  ApiResponse.failure(DioException e) {
    error = e;
    code = e.response?.statusCode ?? 0;
    // if (e is DioError) {
    body = e.response?.data;
    debugPrint("Error = ${e.response?.data}");
    debugPrint("Error Code = ${e.response?.statusCode}");
  }

  ApiResponse.error(String e) {}

}
