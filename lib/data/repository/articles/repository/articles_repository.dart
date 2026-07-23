import 'package:a5bark/model/article_response.dart';

abstract class ArticlesRepository {
  Future<ArticleResponse> getArticles({required String sourceId});
}
