import 'package:a5bark/injectable.dart';
import 'package:a5bark/model/category.dart';
import 'package:a5bark/ui/screens/home/sources/cubit/sources_cubit.dart';
import 'package:a5bark/ui/screens/home/sources/cubit/sources_state.dart';
import 'package:a5bark/ui/screens/home/sources/sources_tabs.dart';
import 'package:a5bark/ui/widgets/main_error.dart';
import 'package:a5bark/ui/widgets/main_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryType category;

  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final viewModel = getIt<SourcesCubit>();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    viewModel.getSources(categoryId: widget.category.name);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourcesCubit, SourcesState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourcesSuccessState) {
          return SourcesTabs(
            sources: state.sources,
            selectedTabIndex: selectedIndex,
            onTabChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        } else if (state is SourcesErrorState) {
          return MainError(
            message: state.errorMessage,
            onRetry: () {
              viewModel.getSources(categoryId: widget.category.name);
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
