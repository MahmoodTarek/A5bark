import 'package:a5bark/model/category.dart';
import 'package:a5bark/ui/screens/home/categories/categories.dart';
import 'package:a5bark/ui/screens/home/sources/category_details.dart';
import 'package:a5bark/ui/screens/home/widgets/news_app_bar.dart';
import 'package:a5bark/ui/screens/home/widgets/news_drawer.dart';
import 'package:a5bark/utils/screen_size.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CategoryType? selectedCategory;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsAppBar(title: selectedCategory == null ? 'home' : selectedCategory!.name),
      drawer: NewsDrawer(onBackToHomeClicked: (){
        setState(() {
          selectedCategory = null;
        });
      }),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * .02),
          child: selectedCategory == null
              ? Categories(
                  onCategorySelected: (CategoryType category) {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                )
              : CategoryDetails(
                  category: selectedCategory ?? CategoryType.general,
                ),
        ),
      ),
    );
  }
}
