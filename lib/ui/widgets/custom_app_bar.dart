import 'package:a5bark/utils/screen_size.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.titleWidget,
    this.actions,
    this.centerTitle = true,
    this.height = 80,
    this.actionsPadding = EdgeInsets.zero,
  });

  final Widget? leading;
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final bool centerTitle;
  final double height;
  final EdgeInsetsGeometry? actionsPadding;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      actionsPadding: actionsPadding ,
      leadingWidth: context.width * .12,
      shadowColor: Colors.transparent,
      titleSpacing: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: centerTitle,
      leading: leading,
      title:
          titleWidget ??
          (title != null
              ? Text(
                  title!,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
          )
              : null),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
