import 'dart:convert';

import 'package:a5bark/data/api/api_constants.dart';
import 'package:a5bark/data/api/end_points.dart';
import 'package:a5bark/model/sources_response.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  Future<SourcesResponse> getSources() async {
    try {

      var url = Uri.https(ApiConstants.baseUrl, EndPoints.sources, {
        'apiKey': ApiConstants.apiKey,
      });

      final response = await http.get(url);

      final json = jsonDecode(response.body);
      return SourcesResponse.fromJson(json);

    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
