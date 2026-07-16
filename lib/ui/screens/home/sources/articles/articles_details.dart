import 'package:a5bark/model/source.dart';
import 'package:a5bark/ui/screens/home/sources/articles/article_card.dart';
import 'package:a5bark/ui/screens/home/view_model/home_view_model.dart';
import 'package:a5bark/ui/widgets/main_error.dart';
import 'package:a5bark/ui/widgets/main_loading.dart';
import 'package:a5bark/utils/resources/app_strings.dart';
import 'package:a5bark/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticlesDetails extends StatefulWidget {
  final Source source;

  const ArticlesDetails({super.key, required this.source});

  @override
  State<ArticlesDetails> createState() => _ArticlesDetailsState();
}

class _ArticlesDetailsState extends State<ArticlesDetails> {
  final viewModel = HomeViewModel();

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
    final double height = context.height;
    final double width = context.width;

    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.articles == null && viewModel.errorMessage == null) {
            return Center(child: MainLoading());
          }

          if (viewModel.errorMessage != null) {
            return MainError(
              message: AppStrings.somethingWentWrong,
              onRetry: () =>
                  viewModel.getArticles(sourceId: widget.source.name ?? ''),
            );
          }

          if (viewModel.articles != null) {
            if (viewModel.articles!.isEmpty) {
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

              itemCount: viewModel.articles!.length,

              itemBuilder: (context, index) {
                return ArticleCard(article: viewModel.articles![index]);
              },
            );
          }
          return const SizedBox.shrink();
          },
      ),
    );
  }
}
