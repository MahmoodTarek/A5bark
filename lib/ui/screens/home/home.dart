import 'package:a5bark/data/api/api_manager.dart';
import 'package:a5bark/model/sources_response.dart';
import 'package:a5bark/ui/screens/home/widgets/source/category_details.dart';
import 'package:a5bark/utils/resources/app_text_style.dart';
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
    int selectedIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('A5bark'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          CategoryDetails()
]
      ),
    );
  }
}

Future<List<Source>> getSources() async {
  var response = await ApiManager().getSources();
  return response.sources!;
}
