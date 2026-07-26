import 'package:a5bark/data/repository/sources/repository/source_repository.dart';
import 'package:a5bark/ui/screens/home/sources/cubit/sources_state.dart';
import 'package:a5bark/utils/map_dio_exception_to_message.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SourcesCubit extends Cubit<SourcesState> {
  final SourceRepository sourcesRepository;

  SourcesCubit(this.sourcesRepository) : super(SourcesLoadingState());

  Future<void> getSources({required String categoryId}) async {
    try {
      emit(SourcesLoadingState());

      final response = await sourcesRepository.getSources(
        categoryId: categoryId,
      );

      if (response.status == "error") {
        SourcesErrorState(response.message ?? '');
      } else {
        emit(SourcesSuccessState(response.sources!));
      }
    } on DioException catch (e) {
      emit(SourcesErrorState(mapDioExceptionToMessage(exception: e)));
    } catch (message) {
      emit(SourcesErrorState(message.toString()));
    }
  }
}
