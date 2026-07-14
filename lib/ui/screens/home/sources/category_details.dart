import 'package:a5bark/data/api/dio_api_manager.dart';
import 'package:a5bark/model/category.dart';
import 'package:a5bark/model/sources_response.dart';
import 'package:a5bark/ui/screens/home/sources/sources_tabs.dart';
import 'package:a5bark/ui/widgets/main_error.dart';
import 'package:a5bark/ui/widgets/main_loading.dart';
import 'package:a5bark/utils/resources/app_strings.dart';
import 'package:flutter/material.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryType category;

  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedIndex = 0;
  late Future<SourcesResponse> sourcesFuture;

  @override
  void initState() {
    super.initState();
    sourcesFuture = DioApiManager().getSources(category: widget.category.name);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: sourcesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SourcesTabs(
            sources: snapshot.data!.sources!,
            selectedTabIndex: selectedIndex,
            onTabChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        }
        if (snapshot.hasError) {
          return MainError(
            message: AppStrings.somethingWentWrong,
            onRetry: () {
              DioApiManager().getSources(category: widget.category.name);
            },
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: MainLoading());
        }
        return Container();
      },
    );
  }
}
