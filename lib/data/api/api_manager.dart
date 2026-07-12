import 'dart:convert';

import 'package:a5bark/data/api/api_constants.dart';
import 'package:a5bark/data/api/end_points.dart';
import 'package:a5bark/model/articles_response.dart';
import 'package:a5bark/model/category.dart';
import 'package:a5bark/model/sources_response.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<SourcesResponse> getSources({required CategoryType category}) async {
    try {
      var url = Uri.https(ApiConstants.baseUrl, EndPoints.sources, {
        'apiKey': ApiConstants.apiKey,
        'category': category.name,
      });

      final response = await http.get(url);

      final json = jsonDecode(response.body);
      return SourcesResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ArticlesResponse> getArticlesBySourceId({
    required String sourceId,
  }) async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.everything, {
        'apiKey': ApiConstants.apiKey,
        'sources': sourceId,
      });

      final response = await http.get(url);

      final json = jsonDecode(response.body);

      return ArticlesResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
