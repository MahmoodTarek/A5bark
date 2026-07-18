import 'package:a5bark/data/api/api_constants.dart';
import 'package:a5bark/data/api/api_manager.dart';
import 'package:a5bark/ui/screens/home/sources/articles/cubit/articles_state.dart';
import 'package:a5bark/utils/map_dio_exception_to_message.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit() : super(ArticlesLoadingState());

  Future<void> getArticles({required String sourceId}) async {
    try {
      emit(ArticlesLoadingState());

      final response = await ApiManager(
        Dio(),
        baseUrl: ApiConstants.baseUrl,
      ).getEverything(ApiConstants.apiKey, sourceId);
      if (response.status == "error") {
        emit(ArticlesErrorState(response.message??''));
      } else {
        emit(ArticlesSuccessState(response.articles!));
      }
    } on DioException catch (e) {
      emit(
          ArticlesErrorState(mapDioExceptionToMessage(exception: e)),
      );
    } catch (message) {
      emit(ArticlesErrorState(message.toString()));
    }
  }
}
