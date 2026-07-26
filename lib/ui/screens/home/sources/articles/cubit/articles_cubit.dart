import 'package:a5bark/data/repository/articles/repository/articles_repository.dart';
import 'package:a5bark/ui/screens/home/sources/articles/cubit/articles_state.dart';
import 'package:a5bark/utils/map_dio_exception_to_message.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ArticlesCubit extends Cubit<ArticlesState> {
  final ArticlesRepository articlesRepository;

  ArticlesCubit(this.articlesRepository) : super(ArticlesLoadingState());

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
