import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class Log {
  static Logger _logger = Logger();

  static debug(String message) {
    _logger.d(message);
  }

  static error(message) {
    _logger.e(message);
  }

  static information(message) {
    _logger.i(message);
  }

  static warning(message) {
    _logger.w(message);
  }

  static void onSendRequestSuccess(String requestName, Response response) {
    Log.information(
        "------------------------------Start ($requestName) Request------------------------------");
    Log.information(
        "method : ${response.requestOptions.method} \n URL : ${response.realUri}");
    Log.debug(
        "status code : ${response.statusCode} \n status message : ${response.statusMessage} \n response ${response.toString()}");
    Log.information(
        "------------------------------End ($requestName) Request------------------------------");
  }

  static void httpSuccess({required String requestName, required http.Response response}){
    Log.debug("start ($requestName) request\nrequest information : (${response.request})\nresponse code : (${response.statusCode})\nresponse : (${response.body})\nend ($requestName) request");
  }

  static void httpError({required String requestName, required http.Response response}){
    Log.error("start ($requestName) request\nrequest information : (${response.request})\nresponse code : (${response.statusCode})\nresponse : (${response.body})\nend ($requestName) request");
  }

  static void onResponseError(String requestName, DioError error) {
    Log.error("Error In ($requestName) Request");
    Log.error(
        "method : ${error.response?.requestOptions.method} \n URL : ${error.response?.realUri}");
    Log.error(
        "status code : ${error.response?.statusCode} --- status message : ${error.response?.statusMessage}");
  }

  static void onSendRequestFailed(String requestName, DioError error) {
    Log.error("Error In ($requestName) Request");
    Log.error("error type : ${error.type} \n error message : ${error.message}");
  }
}
