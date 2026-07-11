import 'package:a5bark/ui/screens/home/categories/categories.dart';
import 'package:a5bark/ui/screens/home/widgets/news_app_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsAppBar(),
      body: SafeArea(top: false, child: Categories()),
    );
  }
}
