import 'package:a5bark/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:a5bark/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:a5bark/data/repository/sources/repository/source_repository.dart';
import 'package:a5bark/model/source_response.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SourceRepository)
class SourceRepositoryImpl extends SourceRepository {
  final SourceRemoteDataSource _sourceRemoteDataSource;
  final SourceLocalDataSource _sourceLocalDataSource;

  SourceRepositoryImpl(
    this._sourceRemoteDataSource,
    this._sourceLocalDataSource,
  );

  @override
  Future<SourceResponse> getSources({required String categoryId}) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      final sources = await _sourceRemoteDataSource.getSources(
        categoryId: categoryId,
      );

      await _sourceLocalDataSource.saveSources(
        sources: sources,
        categoryId: categoryId,
      );

      return sources;
    }
    return await _sourceLocalDataSource.getSources(categoryId: categoryId);
  }
}
