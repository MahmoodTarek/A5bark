import 'package:a5bark/data/api/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveTimeout: Duration(seconds: 30),
      sendTimeout: Duration(seconds: 30),
    ),
  );
}
