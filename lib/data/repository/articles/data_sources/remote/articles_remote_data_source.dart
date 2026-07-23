import 'package:a5bark/model/article_response.dart';

abstract class ArticlesRemoteDataSource {
  Future<ArticleResponse> getArticles({required String sourceId});
}
