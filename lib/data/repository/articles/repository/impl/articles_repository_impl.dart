import 'package:a5bark/data/repository/articles/data_sources/remote/articles_remote_data_source.dart';
import 'package:a5bark/data/repository/articles/repository/articles_repository.dart';
import 'package:a5bark/model/article_response.dart';

class ArticlesRepositoryImpl extends ArticlesRepository {
  final ArticlesRemoteDataSource articlesRemoteDataSource;

  ArticlesRepositoryImpl(this.articlesRemoteDataSource);

  @override
  Future<ArticleResponse> getArticles({required String sourceId}) {
    return articlesRemoteDataSource.getArticles(sourceId: sourceId);
  }
}