import 'package:a5bark/data/api/api_manager.dart';
import 'package:a5bark/data/repository/sources/data_sources/impl/source_remote_data_source_impl.dart';
import 'package:a5bark/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:a5bark/data/repository/sources/repository/impl/source_repository_impl.dart';
import 'package:a5bark/data/repository/sources/repository/source_repository.dart';
import 'package:a5bark/ui/screens/home/sources/cubit/sources_state.dart';
import 'package:a5bark/utils/map_dio_exception_to_message.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SourcesCubit extends Cubit<SourcesState> {
  late final SourceRemoteDataSource sourcesDataSource;
  late final SourceRepository sourcesRepository;
  final apiManager = ApiManager(Dio());

  SourcesCubit() : super(SourcesLoadingState()) {
    sourcesDataSource = SourceRemoteDataSourceImpl(apiManager);
    sourcesRepository = SourceRepositoryImpl(sourcesDataSource);
  }

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
