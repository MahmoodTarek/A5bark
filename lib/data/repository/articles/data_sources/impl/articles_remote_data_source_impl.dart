import 'package:a5bark/data/api/api_constants.dart';
import 'package:a5bark/data/api/api_manager.dart';
import 'package:a5bark/data/repository/articles/data_sources/remote/articles_remote_data_source.dart';
import 'package:a5bark/model/article_response.dart';

class ArticlesRemoteDataSourceImpl extends ArticlesRemoteDataSource {
  late final ApiManager apiManager;

  ArticlesRemoteDataSourceImpl(this.apiManager);

  @override
  Future<ArticleResponse> getArticles({required String sourceId}) {
    return apiManager.getEverything(ApiConstants.apiKey, sourceId);
  }
}
