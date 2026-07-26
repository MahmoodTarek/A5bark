import 'package:a5bark/data/api/api_constants.dart';
import 'package:a5bark/data/api/end_points.dart';
import 'package:a5bark/model/article_response.dart';
import 'package:a5bark/model/source_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_manager.g.dart';
@lazySingleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManager {
  @factoryMethod
  factory ApiManager(Dio dio) = _ApiManager;

  @GET(EndPoints.sources)
  Future<SourceResponse> getSources(
    @Query("apiKey") String apiKey,
    @Query("category") String category,
  );

  @GET(EndPoints.everything)
  Future<ArticleResponse> getEverything(
    @Query("apiKey") String apiKey,
    @Query("sources") String sourceId,
  );
}
