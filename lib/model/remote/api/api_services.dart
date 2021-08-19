import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:do_it_flutter/model/remote/api/responses/base_response.dart';
import 'package:do_it_flutter/utils/enums/network_methods.dart';
import 'package:do_it_flutter/utils/extension_methods/network_methods_extension_methods.dart';
import 'package:do_it_flutter/utils/log.dart';

abstract class ApiServices {
  static Map<String, dynamic> _headers = {"Accept": "application/json"};

  static BaseOptions _baseOptions = BaseOptions(
    baseUrl: "http://192.168.1.6:1337/",
    headers: _headers,
    responseType: ResponseType.json,
  );

  static Options _setRequestOptions(Options? options, NetworkMethods method) {
    if (options == null) {
      options = Options();
    }
    options.method = method.toText();
    return options;
  }

  static Dio _dio = Dio(_baseOptions);

  static void sendRequest<T>({
    required String endpoint,
    required NetworkMethods method,
    required String requestName,
    required BaseResponse responseType,
    Function(T response)? onSuccess,
    Function(String? message, int? code)? onResponseError,
    Function(String? message)? onError,
    Map<String, dynamic>? queryParameters,
    Options? options,
    dynamic data,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    void Function()? onConnectionError,
  }) async {
    try {
      await InternetAddress.lookup('google.com');
      Response response = await _dio.request(
        endpoint,
        queryParameters: queryParameters,
        options: _setRequestOptions(options, method),
        data: data,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      Log.onSendRequestSuccess(requestName, response);
      responseType.fromJson(jsonDecode(response.toString()));
      if (onSuccess != null) {
        onSuccess(responseType as T);
      }
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.response) {
        Log.onResponseError(requestName, dioError);
        if (onResponseError != null) {
          onResponseError(
              dioError.response?.statusMessage, dioError.response?.statusCode);
        }
      } else {
        Log.onSendRequestFailed(requestName, dioError);
        if (onError != null) {
          onError(dioError.message);
        }
      }
    } on SocketException catch(e){
      Log.error("connection error");
      if(onConnectionError != null){
        onConnectionError();
      }
    }
  }
}
