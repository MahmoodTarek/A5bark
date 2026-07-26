import 'package:a5bark/data/api/api_constants.dart';
import 'package:a5bark/data/api/api_manager.dart';
import 'package:a5bark/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:a5bark/model/source_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SourceRemoteDataSource)
class SourceRemoteDataSourceImpl extends SourceRemoteDataSource {
  final ApiManager _apiManager;

  SourceRemoteDataSourceImpl(this._apiManager);

  @override
  Future<SourceResponse> getSources({required String categoryId}) {
    return _apiManager.getSources(ApiConstants.apiKey, categoryId);
  }
}
