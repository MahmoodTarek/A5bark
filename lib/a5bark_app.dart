import 'package:a5bark/ui/screens/home/home.dart';
import 'package:a5bark/utils/resources/app_theme.dart';
import 'package:a5bark/utils/theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class A5barkApp extends StatelessWidget {
  const A5barkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,

          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,

          initialRoute: 'home',
          routes: {
            'home': (_) => const Home(),
          },
        );
      },
    );
  }
}