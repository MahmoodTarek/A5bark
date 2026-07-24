import 'package:a5bark/model/article_response.dart';

abstract class ArticlesLocalDataSource {
  Future<ArticleResponse> getArticles({required String sourceId});

  Future<void> setArticles({
    required String sourceId,
    required ArticleResponse articles,
  });
}
