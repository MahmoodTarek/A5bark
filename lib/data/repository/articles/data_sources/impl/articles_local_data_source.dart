import 'package:a5bark/data/repository/articles/data_sources/local/articles_local_data_source.dart';
import 'package:a5bark/model/article_response.dart';
import 'package:hive_ce/hive.dart';

class ArticlesLocalDataSourceImpl extends ArticlesLocalDataSource {
  @override
  Future<ArticleResponse> getArticles({required String sourceId}) async {
    final articlesBox = Hive.box('Articles');
    final articlesMap = await articlesBox.get(sourceId);
    final articles = ArticleResponse.fromJson(articlesMap);
    return articles;
  }

  @override
  Future<void> setArticles({
    required String sourceId,
    required ArticleResponse articles,
  }) async {
    final articlesBox = await Hive.openBox('Articles');
    final articlesMap = articles.toJson();
    await articlesBox.put(sourceId, articlesMap);
    await articlesBox.close();
  }
}
