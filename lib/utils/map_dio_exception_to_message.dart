import 'package:a5bark/utils/resources/app_strings.dart';
import 'package:dio/dio.dart';

String mapDioExceptionToMessage({required DioException exception}) {
  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return AppStrings.networkTimeout;

    case DioExceptionType.connectionError:
      return AppStrings.noInternetConnection;

    case DioExceptionType.cancel:
      return AppStrings.requestCancelled;

    case DioExceptionType.badResponse:
      switch (exception.response?.statusCode) {
        case 400:
          return AppStrings.badRequest;

        case 401:
          return AppStrings.unauthorized;

        case 403:
          return AppStrings.forbidden;

        case 404:
          return AppStrings.notFound;

        default:
          return AppStrings.serverError;
      }

    default:
      return AppStrings.unexpectedError;
  }
}
