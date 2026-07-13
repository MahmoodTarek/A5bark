import 'package:a5bark/utils/resources/app_theme_extension.dart';
import 'package:a5bark/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerItem extends StatelessWidget {
  final String iconPath;
  final String title;

  const DrawerItem({super.key, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * .02),
      child: Row(
        spacing: context.width * .02,
        children: [
          SvgPicture.asset(iconPath, colorFilter: ColorFilter.mode(context.colors.textPrimary, BlendMode.srcIn),),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
