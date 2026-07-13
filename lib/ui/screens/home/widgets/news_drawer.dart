import 'package:a5bark/providers/theme_provider.dart';
import 'package:a5bark/ui/screens/home/widgets/divider_item.dart';
import 'package:a5bark/ui/screens/home/widgets/drawer_item.dart';
import 'package:a5bark/ui/screens/home/widgets/drop_down_menu.dart';
import 'package:a5bark/utils/resources/app_assets.dart';
import 'package:a5bark/utils/resources/app_colors.dart';
import 'package:a5bark/utils/resources/app_strings.dart';
import 'package:a5bark/utils/resources/app_theme_extension.dart';
import 'package:a5bark/utils/screen_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsDrawer extends StatelessWidget {
  final VoidCallback onBackToHomeClicked;

  const NewsDrawer({super.key, required this.onBackToHomeClicked});

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    var themeProvider = Provider.of<ThemeProvider>(context);
    final currentTheme = themeProvider.currentTheme == ThemeMode.dark
        ? 'dark'
        : 'light';

    final AppColors colors = context.colors;
    return Drawer(
      backgroundColor: colors.background,
      child: Column(
        spacing: height * .02,
        children: [
          Container(
            height: height * .20,
            alignment: .center,
            decoration: BoxDecoration(color: colors.textPrimary),
            child: Text(
              AppStrings.a5bark,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          InkWell(
            onTap: onBackToHomeClicked,
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            child: DrawerItem(
              iconPath: AppIcons.home,
              title: AppStrings.goToHome,
            ),
          ),

          DividerItem(),
          DrawerItem(iconPath: AppIcons.theme, title: AppStrings.theme),
          DropDownMenu(
            title: AppStrings.theme,
            selectedValue: currentTheme,
            optionsItems: [
              DropdownMenuItem(value: 'dark', child: Text(AppStrings.dark)),
              DropdownMenuItem(value: 'light', child: Text(AppStrings.light)),
            ],
            onChanged: (value) {
              if (currentTheme == value) return;
              if (value == 'dark') {
                themeProvider.changeTheme(newThemeMode: ThemeMode.dark);
              } else {
                themeProvider.changeTheme(newThemeMode: ThemeMode.light);
              }
            },
          ),

          DividerItem(),
          DrawerItem(iconPath: AppIcons.language, title: AppStrings.language),
          DropDownMenu(
            title: AppStrings.language,
            selectedValue: context.locale.languageCode,
            optionsItems: [
              DropdownMenuItem(
                value: 'en',
                child: Text(
                  AppStrings.english,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              DropdownMenuItem(
                value: 'ar',
                child: Text(
                  AppStrings.arabic,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
            onChanged: (value) {
              if (value == 'en') {
                context.setLocale(const Locale('en'));
              } else {
                context.setLocale(const Locale('ar'));
              }
            },
          ),
        ],
      ),
    );
  }
}

enum LanguageOption { english, arabic }

enum ThemeOption { light, dark }
