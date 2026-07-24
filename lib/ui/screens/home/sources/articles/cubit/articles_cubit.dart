import 'package:a5bark/data/api/api_manager.dart';
import 'package:a5bark/data/repository/articles/data_sources/impl/articles_remote_data_source_impl.dart';
import 'package:a5bark/data/repository/articles/data_sources/local/articles_local_data_source.dart';
import 'package:a5bark/data/repository/articles/data_sources/remote/articles_remote_data_source.dart';
import 'package:a5bark/data/repository/articles/repository/articles_repository.dart';
import 'package:a5bark/data/repository/articles/repository/impl/articles_repository_impl.dart';
import 'package:a5bark/ui/screens/home/sources/articles/cubit/articles_state.dart';
import 'package:a5bark/utils/map_dio_exception_to_message.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  late final ApiManager apiManager;
  late final ArticlesRepository articlesRepository;
  late final ArticlesRemoteDataSource articlesRemoteDataSource;
  late final ArticlesLocalDataSource articlesLocalDataSource;

  ArticlesCubit() : super(ArticlesLoadingState()) {
    apiManager = ApiManager(Dio());
    articlesRemoteDataSource = ArticlesRemoteDataSourceImpl(apiManager);
    articlesRepository = ArticlesRepositoryImpl(
      articlesRemoteDataSource: articlesRemoteDataSource,
      articlesLocalDataSource: articlesLocalDataSource,
    );
  }

  Future<void> getArticles({required String sourceId}) async {
    try {
      emit(ArticlesLoadingState());

      final response = await articlesRepository.getArticles(sourceId: sourceId);
      if (response.status == "error") {
        emit(ArticlesErrorState(response.message ?? ''));
      } else {
        emit(ArticlesSuccessState(response.articles!));
      }
    } on DioException catch (e) {
      emit(ArticlesErrorState(mapDioExceptionToMessage(exception: e)));
    } catch (message) {
      emit(ArticlesErrorState(message.toString()));
    }
  }
}
