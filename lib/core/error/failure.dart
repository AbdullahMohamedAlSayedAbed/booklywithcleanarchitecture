import 'dart:developer';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioException(DioException e) {
    log(e.toString());
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            "Connection timeout. Please check your internet connection.");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Request send timeout. Please try again later.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            "Response receive timeout. Please try again later.");
      case DioExceptionType.badCertificate:
        return ServerFailure(
            "bad Certificate with api server Please try again later.");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request was cancelled. Please try again.");
      case DioExceptionType.connectionError:
        return ServerFailure(
            "No internet connection,please try connect to internet");
      case DioExceptionType.unknown:
        return ServerFailure(
            "An unexpected error occurred. Please try again later.");
      default:
        return ServerFailure("There was an error. Please try again later.");
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(
          'Your request was not found.  Please try again later');
    } else if (statusCode == 500) {
      return ServerFailure(
          'there is a problem with server.  Please try again later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure("There was an error. Please try again later.");
    }
  }
}
