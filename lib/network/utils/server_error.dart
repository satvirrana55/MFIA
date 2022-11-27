import 'package:dio/dio.dart' hide Headers;


class ServerError implements Exception {
  late int _errorCode;
  String _errorMessage = "";

  ServerError.withError({required dynamic error}) {
    _handleError(error);
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        _errorMessage = "Request Was Cancelled";
        break;
      case DioErrorType.connectTimeout:
        _errorMessage = "Connection Timeout";
        break;
      case DioErrorType.other:
        _errorMessage = "Connection Failed Internet Connection";
        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = "Receive Timeout In Connection";
        break;
      case DioErrorType.response:
        _errorMessage =
            "Received Invalid StatusCode ${error.response!.statusCode}";
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = "Receive Timeout Send Request";
        break;
    }
    return _errorMessage;
  }
}
