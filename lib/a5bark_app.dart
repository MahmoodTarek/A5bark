import 'package:a5bark/providers/theme_provider.dart';
import 'package:a5bark/ui/screens/home/home.dart';
import 'package:a5bark/utils/resources/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class A5barkApp extends StatelessWidget {
  const A5barkApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'A5bark',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentTheme,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,


      initialRoute: 'home',
      routes: {
        'home': (context) => const Home(),
      },
    );
  }
}

