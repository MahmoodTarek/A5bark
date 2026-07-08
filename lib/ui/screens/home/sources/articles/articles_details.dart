import 'package:a5bark/data/api/api_manager.dart';
import 'package:a5bark/model/articles_response.dart';
import 'package:a5bark/model/sources_response.dart';
import 'package:a5bark/ui/screens/home/sources/articles/article_card.dart';
import 'package:a5bark/ui/widgets/main_error.dart';
import 'package:a5bark/ui/widgets/main_loading.dart';
import 'package:a5bark/utils/screen_size.dart';
import 'package:flutter/material.dart';

class ArticlesDetails extends StatelessWidget {
  final Source source;

  const ArticlesDetails({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    final double height = context.height;
    final double width = context.width;

    return FutureBuilder<ArticlesResponse>(
      future: ApiManager.getArticlesBySourceId(sourceId: source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: MainLoading());
        }

        if (snapshot.hasError) {
          return MainError(
            message: 'Something went to wrong',
            onRetry: () =>
                ApiManager.getArticlesBySourceId(sourceId: source.id ?? ''),
          );
        }

        if (snapshot.data?.status != 'ok') {
          return MainError(
            message: snapshot.data?.message ?? '',
            onRetry: () =>
                ApiManager.getArticlesBySourceId(sourceId: source.id ?? ''),
          );
        }

        List<Article> articles = snapshot.data?.articles ?? [];

        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: width * .02, vertical: height *.02),

          separatorBuilder: (context, index) =>
              SizedBox(height:height * .02),

          itemCount: articles.length,

          itemBuilder: (context, index) {
            return ArticleCard(article: articles[index]);
          },
        );
      },
    );
  }
}
