import 'package:a5bark/data/api/api_constants.dart';
import 'package:a5bark/data/api/api_manager.dart';
import 'package:a5bark/model/article.dart';
import 'package:a5bark/model/article_response.dart';
import 'package:a5bark/model/source.dart';
import 'package:a5bark/ui/screens/home/sources/articles/article_card.dart';
import 'package:a5bark/ui/widgets/main_error.dart';
import 'package:a5bark/ui/widgets/main_loading.dart';
import 'package:a5bark/utils/resources/app_strings.dart';
import 'package:a5bark/utils/screen_size.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ArticlesDetails extends StatefulWidget {
  final Source source;

  const ArticlesDetails({super.key, required this.source});

  @override
  State<ArticlesDetails> createState() => _ArticlesDetailsState();
}

class _ArticlesDetailsState extends State<ArticlesDetails> {
  late Future<ArticleResponse> articlesFuture;

  Future<ArticleResponse> loadArticles() {
    return ApiManager(
      Dio(),
    ).getEverything(ApiConstants.apiKey, widget.source.id!);
  }

  @override
  void initState() {
    super.initState();
    articlesFuture = loadArticles();
  }

  @override
  void didUpdateWidget(covariant ArticlesDetails oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.source.id != widget.source.id) {
      articlesFuture = loadArticles();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = context.height;
    final double width = context.width;

    return FutureBuilder<ArticleResponse>(
      future: articlesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: MainLoading());
        }

        if (snapshot.hasError) {
          return MainError(
            message: AppStrings.somethingWentWrong,
            onRetry: () => articlesFuture,
          );
        }

        List<Article> articles = snapshot.data?.articles ?? [];
        if (snapshot.hasData) {
          if (articles.isEmpty) {
            return Center(
              child: Text(
                AppStrings.noArticles,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }

          return ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: width * .02,
              vertical: height * .02,
            ),

            separatorBuilder: (context, index) =>
                SizedBox(height: height * .02),

            itemCount: articles.length,

            itemBuilder: (context, index) {
              return ArticleCard(article: articles[index]);
            },
          );
        }

        return Container();
      },
    );
  }
}
