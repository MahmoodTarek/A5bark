import 'package:a5bark/data/api/api_constants.dart';
import 'package:a5bark/data/api/api_manager.dart';
import 'package:a5bark/ui/screens/home/sources/cubit/sources_state.dart';
import 'package:a5bark/utils/map_dio_exception_to_message.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SourcesCubit extends Cubit<SourcesState> {
  SourcesCubit() : super(SourcesLoadingState());

  Future<void> getSources({required String categoryId}) async {
    try {
      emit(SourcesLoadingState());

      final response = await ApiManager(
        Dio(),
        baseUrl: ApiConstants.baseUrl,
      ).getSources(ApiConstants.apiKey, categoryId);
      if (response.status == "error") {
        SourcesErrorState(response.message??'');
      } else {
        emit(SourcesSuccessState(response.sources!));
      }
    } on DioException catch (e) {
      emit(
        SourcesErrorState(mapDioExceptionToMessage(exception: e)),
      );
    } catch (message) {
      emit(SourcesErrorState(message.toString()));
    }
  }
}
