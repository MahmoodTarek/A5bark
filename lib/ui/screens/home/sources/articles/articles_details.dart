import 'package:a5bark/injectable.dart';
import 'package:a5bark/model/source.dart';
import 'package:a5bark/ui/screens/home/sources/articles/article_card.dart';
import 'package:a5bark/ui/screens/home/sources/articles/cubit/articles_cubit.dart';
import 'package:a5bark/ui/screens/home/sources/articles/cubit/articles_state.dart';
import 'package:a5bark/ui/widgets/main_error.dart';
import 'package:a5bark/ui/widgets/main_loading.dart';
import 'package:a5bark/utils/resources/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticlesDetails extends StatefulWidget {
  final Source source;

  const ArticlesDetails({super.key, required this.source});

  @override
  State<ArticlesDetails> createState() => _ArticlesDetailsState();
}

class _ArticlesDetailsState extends State<ArticlesDetails> {
  final viewModel = getIt<ArticlesCubit>();

  @override
  void initState() {
    super.initState();
    viewModel.getArticles(sourceId: widget.source.id ?? '');
  }

  @override
  void didUpdateWidget(covariant ArticlesDetails oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      viewModel.getArticles(sourceId: widget.source.id ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      bloc: viewModel,
      builder: (BuildContext context, state) {
        if (state is ArticlesSuccessState) {
          if (state.articles.isEmpty) {
            return Center(
              child: Text(
                AppStrings.noArticles,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }
          return ListView.builder(
            itemCount: state.articles.length,
            itemBuilder: (context, index) {
              return ArticleCard(article: state.articles[index]);
            },
          );
        } else if (state is ArticlesErrorState) {
          return MainError(
            message: state.errorMessage,
            onRetry: () {
              viewModel.getArticles(sourceId: widget.source.id ?? '');
            },
          );
        }
        return MainLoading();
      },
    );
  }

  @override
  void dispose() {
    viewModel.close();
    super.dispose();
  }
}
