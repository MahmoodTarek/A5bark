import 'package:a5bark/ui/widgets/custom_app_bar.dart';
import 'package:a5bark/utils/resources/app_assets.dart';
import 'package:a5bark/utils/resources/app_strings.dart';
import 'package:a5bark/utils/resources/app_theme_extension.dart';
import 'package:a5bark/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const NewsAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Color iconsColor = context.isDark
        ? context.colors.textPrimary
        : context.colors.textPrimary;

    return CustomAppBar(
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * .02),
        child: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          padding: EdgeInsets.zero,
          icon: SvgPicture.asset(
            AppIcons.drawer,
            colorFilter: ColorFilter.mode(iconsColor, BlendMode.srcIn),
            height: context.height * .04,
            width: context.width * .04,
          ),
        ),
      ),
      centerTitle: true,
      title: getLocalizationTitle(title),
      actionsPadding: EdgeInsets.symmetric(horizontal: context.width * .04),
      actions: [
        SvgPicture.asset(
          AppIcons.search,
          height: 28,
          width: 28,
          colorFilter: ColorFilter.mode(iconsColor, BlendMode.srcIn),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

String getLocalizationTitle(String title) {
  switch (title) {
    case 'home':
      return AppStrings.home;
    case 'general':
      return AppStrings.general;
    case 'business':
      return AppStrings.business;
    case 'sports':
      return AppStrings.sport;
    case 'health':
      return AppStrings.health;
    case 'science':
      return AppStrings.science;
    case 'technology':
      return AppStrings.technology;
    case 'entertainment':
      return AppStrings.entertainment;
  }
  return '';
}
