import 'dart:convert';

import 'package:a5bark/data/repository/articles/data_sources/local/articles_local_data_source.dart';
import 'package:a5bark/model/article_response.dart';
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ArticlesLocalDataSource)
class ArticlesLocalDataSourceImpl extends ArticlesLocalDataSource {
  @override
  Future<ArticleResponse> getArticles({required String sourceId}) async {
    final articlesBox = await Hive.openBox('Articles');

    try {
      final rawData = await articlesBox.get(sourceId);
      if (rawData == null) {
        throw Exception('No cached articles found');
      }

      final safeMap = jsonDecode(jsonEncode(rawData)) as Map<String, dynamic>;
      final articles = ArticleResponse.fromJson(safeMap);

      return articles;
    } finally {
      await articlesBox.close();
    }
  }

  @override
  Future<void> setArticles({
    required String sourceId,
    required ArticleResponse articles,
  }) async {
    final articlesBox = await Hive.openBox('Articles');
    try {
      final articlesMap = articles.toJson();
      await articlesBox.put(sourceId, articlesMap);
    } finally {
      await articlesBox.close();
    }
  }
}
