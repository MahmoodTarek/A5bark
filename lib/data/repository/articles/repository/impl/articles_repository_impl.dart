import 'package:a5bark/data/repository/articles/data_sources/local/articles_local_data_source.dart';
import 'package:a5bark/data/repository/articles/data_sources/remote/articles_remote_data_source.dart';
import 'package:a5bark/data/repository/articles/repository/articles_repository.dart';
import 'package:a5bark/model/article_response.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ArticlesRepository)
class ArticlesRepositoryImpl extends ArticlesRepository {
  final ArticlesRemoteDataSource articlesRemoteDataSource;
  final ArticlesLocalDataSource articlesLocalDataSource;

  ArticlesRepositoryImpl({
    required this.articlesRemoteDataSource,
    required this.articlesLocalDataSource,
  });

  @override
  Future<ArticleResponse> getArticles({required String sourceId}) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      final articles = await articlesRemoteDataSource.getArticles(
        sourceId: sourceId,
      );

      await articlesLocalDataSource.setArticles(
        sourceId: sourceId,
        articles: articles,
      );

      return articles;
    }
    return await articlesLocalDataSource.getArticles(sourceId: sourceId);
  }
}
