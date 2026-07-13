import 'package:a5bark/utils/resources/app_theme_extension.dart';
import 'package:a5bark/utils/screen_size.dart';
import 'package:flutter/material.dart';

class DividerItem extends StatelessWidget {
  const DividerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.colors.textPrimary,
      thickness: 1.2,
      height: 1,
      indent: context.width *0.06,
      endIndent: context.width *0.06,
    );
  }
}
