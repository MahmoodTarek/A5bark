import 'package:a5bark/data/api/api_constants.dart';
import 'package:a5bark/data/api/api_manager.dart';
import 'package:a5bark/model/category.dart';
import 'package:a5bark/model/source_response.dart';
import 'package:a5bark/ui/screens/home/sources/sources_tabs.dart';
import 'package:a5bark/ui/screens/home/view_model/home_view_model.dart';
import 'package:a5bark/ui/widgets/main_error.dart';
import 'package:a5bark/ui/widgets/main_loading.dart';
import 'package:a5bark/utils/resources/app_strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryType category;

  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final viewModel = HomeViewModel();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    viewModel.getSources(categoryId: widget.category.name);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => viewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.sources != null) {
            return SourcesTabs(
              sources: viewModel.sources!,
              selectedTabIndex: selectedIndex,
              onTabChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            );
          }
          if (viewModel.errorMessage != null) {
            return MainError(
              message: AppStrings.somethingWentWrong,
              onRetry: () {
                viewModel.getSources(categoryId: widget.category.name);
              },
            );
          }
          if (viewModel.sources == null && viewModel.errorMessage == null) {
            return Center(child: MainLoading());
          }
          return Container();
        },
      ),
    );
  }
}
