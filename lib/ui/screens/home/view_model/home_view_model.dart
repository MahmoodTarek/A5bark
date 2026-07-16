import 'package:a5bark/data/api/api_constants.dart';
import 'package:a5bark/data/api/api_manager.dart';
import 'package:a5bark/model/article.dart';
import 'package:a5bark/model/source.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  List<Source>? sources;
  String? errorMessage;
  List<Article>? articles;


  void getSources({required String categoryId}) async {
    errorMessage = null;
    sources = null;
    notifyListeners();
    try {
      final response = await ApiManager(
        Dio(),
        baseUrl: ApiConstants.baseUrl,
      ).getSources(ApiConstants.apiKey, categoryId);

      if (response.status == "error") {
        errorMessage = 'error';
      } else {
        sources = response.sources;
      }
      notifyListeners();
    } catch (message) {
      errorMessage = message.toString();
      notifyListeners();
    }
  }

  void getArticles({required String sourceId}) async {
    errorMessage = null;
    articles = null;
    notifyListeners();
    try {
      final response = await ApiManager(
        Dio(),
        baseUrl: ApiConstants.baseUrl,
      ).getEverything(ApiConstants.apiKey, sourceId);
      if (response.status == "error") {
        errorMessage = 'error';
      } else {
        articles = response.articles;
      }
      notifyListeners();
    } catch (message) {
      errorMessage = message.toString();
      notifyListeners();
    }
  }
}
