import 'package:a5bark/data/api/api_constants.dart';
import 'package:a5bark/data/api/end_points.dart';
import 'package:a5bark/model/articles_response.dart';
import 'package:a5bark/model/sources_response.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioApiManager {
  static final String networkProtocolType = 'https://';
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: networkProtocolType + ApiConstants.baseUrl,
      queryParameters: {"apiKey": ApiConstants.apiKey},
    ),
  )..interceptors.add(PrettyDioLogger());

  Future<SourcesResponse> getSources({required String category}) async {
    try {
      final response = await dio.get(
        EndPoints.sources,
        queryParameters: {"category": category},
      );

      return SourcesResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ArticlesResponse> getArticlesBySourceId({
    required String sourceId,
  }) async {
    try {
      final response = await dio.get(
        EndPoints.everything,
        queryParameters: {"sources": sourceId},
      );

      return ArticlesResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
