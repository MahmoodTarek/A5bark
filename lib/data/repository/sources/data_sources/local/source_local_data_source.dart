import 'package:a5bark/model/source_response.dart';

abstract class SourceLocalDataSource {
  Future<SourceResponse> getSources({required String categoryId});

  Future<void> saveSources({
    required SourceResponse sources,
    required String categoryId,
  });
}
