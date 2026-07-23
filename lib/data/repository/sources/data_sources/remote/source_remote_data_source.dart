import 'package:a5bark/model/source_response.dart';

abstract class SourceRemoteDataSource {
  Future<SourceResponse> getSources({required String categoryId});
}
