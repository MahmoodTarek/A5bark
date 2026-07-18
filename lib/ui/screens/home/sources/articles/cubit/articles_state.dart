import 'package:a5bark/model/article.dart';

sealed class ArticlesState {}

class ArticlesLoadingState extends ArticlesState {}

class ArticlesErrorState extends ArticlesState {
  final String errorMessage;

  ArticlesErrorState(this.errorMessage);
}

class ArticlesSuccessState extends ArticlesState {
  final List<Article> articles;

  ArticlesSuccessState(this.articles);
}
