import 'package:a5bark/utils/resources/app_assets.dart';
import 'package:a5bark/utils/resources/app_strings.dart';
import 'package:a5bark/utils/resources/app_theme_extension.dart';
import 'package:flutter/cupertino.dart';

enum CategoryType {
  general,
  business,
  sports,
  health,
  science,
  technology,
  entertainment,
}

class Category {
  final String id;
  final String name;
  final String image;

  const Category({required this.id, required this.name, required this.image});

  static List<Category> categoriesList(BuildContext context) => [
    Category(
      id: CategoryType.general.name,
      name: AppStrings.general,
      image: context.isDark
          ? AppImages.categoryGeneralDark
          : AppImages.categoryGeneralLight,
    ),
    Category(
      id: CategoryType.business.name,
      name: AppStrings.business,
      image: context.isDark
          ? AppImages.categoryBusinessDark
          : AppImages.categoryBusinessLight,
    ),
    Category(
      id: CategoryType.sports.name,
      name: AppStrings.sport,
      image: context.isDark
          ? AppImages.categorySportsDark
          : AppImages.categorySportsLight,
    ),
    Category(
      id: CategoryType.technology.name,
      name: AppStrings.technology,
      image: context.isDark
          ? AppImages.categoryTechnologyDark
          : AppImages.categoryTechnologyLight,
    ),
    Category(
      id: CategoryType.entertainment.name,
      name: AppStrings.entertainment,
      image: context.isDark
          ? AppImages.categoryEntertainmentDark
          : AppImages.categoryEntertainmentLight,
    ),
    Category(
      id: CategoryType.health.name,
      name: AppStrings.health,
      image: context.isDark
          ? AppImages.categoryHealthDark
          : AppImages.categoryHealthLight,
    ),
    Category(
      id: CategoryType.science.name,
      name: AppStrings.science,
      image: context.isDark
          ? AppImages.categoryScienceDark
          : AppImages.categoryScienceLight,
    ),
  ];
}
