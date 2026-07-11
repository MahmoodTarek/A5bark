import 'package:a5bark/utils/resources/app_strings.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.welcomeMessage,
          style: Theme.of(context).textTheme.bodyLarge,
        ),

      ],
    );
  }
}
