import 'package:a5bark/model/category.dart';
import 'package:a5bark/ui/screens/home/categories/category_card.dart';
import 'package:a5bark/utils/resources/app_strings.dart';
import 'package:a5bark/utils/screen_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final ValueChanged<CategoryType> onCategorySelected;
  const Categories({super.key, required this.onCategorySelected});


  @override
  Widget build(BuildContext context) {
    final categories = Category.categoriesList(context);
    final isEnglish = context.locale.languageCode == 'en';

    return ListView(
      children: [
        Text(
          AppStrings.welcomeMessage,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: context.height * .02),

        for (int index = 0; index < categories.length; index++) ...[
          CategoryCard(
            category: categories[index],
            isRight: index.isEven == isEnglish,
            onTap: onCategorySelected,
          ),
          if (index != categories.length - 1)
            SizedBox(height: context.height * .02),
        ],
      ],
    );
  }}
