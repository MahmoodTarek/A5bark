import 'package:a5bark/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:a5bark/data/repository/sources/repository/source_repository.dart';
import 'package:a5bark/model/source_response.dart';

class SourceRepositoryImpl extends SourceRepository {
  final SourceRemoteDataSource _sourceRemoteDataSource;

  SourceRepositoryImpl(this._sourceRemoteDataSource);

  @override
  Future<SourceResponse> getSources({required String categoryId}) {
    return _sourceRemoteDataSource.getSources(categoryId: categoryId);
  }
}
