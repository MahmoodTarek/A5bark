import 'package:a5bark/ui/screens/home/sources/category_details.dart';
import 'package:a5bark/utils/resources/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:a5bark/utils/resources/app_strings.dart';
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
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
        AppStrings.a5bark,
          style: AppTextStyle.bodyLarge.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(children: [Expanded(child: CategoryDetails())]),
    );
  }
}
