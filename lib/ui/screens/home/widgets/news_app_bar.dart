import 'package:a5bark/ui/widgets/custom_app_bar.dart';
import 'package:a5bark/utils/resources/app_assets.dart';
import 'package:a5bark/utils/resources/app_strings.dart';
import 'package:a5bark/utils/resources/app_theme_extension.dart';
import 'package:a5bark/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Color iconsColor = context.isDark
        ? context.colors.textPrimary
        : context.colors.textPrimary;

    return CustomAppBar(
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * .02),
        child: SvgPicture.asset(
          AppIcons.drawer,
          colorFilter: ColorFilter.mode(iconsColor, BlendMode.srcIn),
        ),
      ),
      centerTitle: true,
      title: AppStrings.home,
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
