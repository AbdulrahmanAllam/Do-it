import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:do_it_flutter/model/remote/api/responses/base_response.dart';
import 'package:do_it_flutter/utils/enums/api_methods.dart';
import 'package:do_it_flutter/utils/extension_methods/api_methods_extension_methods.dart';
import 'package:do_it_flutter/utils/log.dart';

abstract class ApiServices {
  static Map<String, dynamic> _headers = {"Accept": "application/json"};

  static BaseOptions _baseOptions = BaseOptions(
    baseUrl: "http://192.168.1.6:1337/",
    headers: _headers,
    responseType: ResponseType.json,
  );

  static Options _setRequestOptions(Options? options, ApiMethods method) {
    if (options == null) {
      options = Options();
    }
    options.method = method.toText();
    return options;
  }

  static void _checkConnection() async {
    await InternetAddress.lookup('google.com');
  }

  static Future<Response> _request({
    required String endpoint,
    required ApiMethods method,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    dynamic data,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    Response response = await _dio.request(
      endpoint,
      queryParameters: queryParameters,
      options: _setRequestOptions(options, method),
      data: data,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  static Dio _dio = Dio(_baseOptions);

  static void sendRequest<T>({
    required String endpoint,
    required ApiMethods method,
    required String requestName,
    required BaseResponse responseObject,
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
      _checkConnection();
      Response response = await _request(
              endpoint: endpoint,
              method: method,
              queryParameters: queryParameters,
              onReceiveProgress: onReceiveProgress,
              onSendProgress: onSendProgress,
              cancelToken: cancelToken,
              data: data,
              options: options);

      Log.onSendRequestSuccess(requestName, response);
      responseObject.fromJson(jsonDecode(response.toString()));
      if (onSuccess != null) {
        onSuccess(responseObject as T);
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
    } on SocketException catch (e) {
      Log.error("connection error");
      if (onConnectionError != null) {
        onConnectionError();
      }
    }
  }
////////////////////////////////////////////////////////////////////////
  static void sndRequest({
    required String endpoint,
    required ApiMethods method,
    required String requestName,
    Function(String response)? onSuccess,
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
      _checkConnection();
      Response response = await _request(
          endpoint: endpoint,
          method: method,
          queryParameters: queryParameters,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          cancelToken: cancelToken,
          data: data,
          options: options);

      Log.onSendRequestSuccess(requestName, response);
      if (onSuccess != null) {
        onSuccess(response.toString());
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
    } on SocketException catch (e) {
      Log.error("connection error");
      if (onConnectionError != null) {
        onConnectionError();
      }
    }
  }

  static httpR() async {
    Uri url = Uri.parse("http://192.168.1.6:1337/tasks");
    try{
      http.Response response = await http.get(url,headers: {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjojI5ODAyMDI5LCJleHAiOjE2MzIzOTQwMjl9.hlxsewIvnc9lmTNms7QByfKn--fpO9eHYo3oZ2j8660",
      });
      if(response.statusCode == 200){
        Log.information("Allam 5G ${response.body} ${response.request}");
      }
      else{
        Log.error("${response.statusCode } ${response.request}");
      }
    }catch(e){
      if(e is SocketException){
        Log.error("Allam 5G nooooooooooooooooooo internet");
      }
    }
  }
}