import 'dart:convert';

import 'package:a5bark/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:a5bark/model/source_response.dart';
import 'package:hive_ce/hive.dart';

class SourceLocalDataSourceImpl extends SourceLocalDataSource {
  @override
  Future<SourceResponse> getSources({required String categoryId}) async {
    final sourceBox = await Hive.openBox('Sources');

    try {
      final rawData = await sourceBox.get(categoryId);

      if (rawData == null) {
        throw Exception('No cached sources found');
      }

      final safeMap = jsonDecode(jsonEncode(rawData)) as Map<String, dynamic>;

      final result = SourceResponse.fromJson(safeMap);
      return result;
    } finally {
      await sourceBox.close();
    }
  }

  @override
  Future<void> saveSources({
    required SourceResponse sources,
    required String categoryId,
  }) async {

    final sourceBox = await Hive.openBox('Sources');

    try {
      await sourceBox.put(categoryId, sources.toJson());
    } finally {
      await sourceBox.close();
    }
  }
}