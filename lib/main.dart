import 'package:a5bark/a5bark_app.dart';
import 'package:a5bark/data/shared_pref/shared_pref.dart';
import 'package:a5bark/theme_cubit.dart';
import 'package:a5bark/utils/bloc_observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final isDark = await AppLaunchService.isDarkTheme();
  Bloc.observer = MyBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: BlocProvider(
        create: (_) =>
            ThemeCubit(initialTheme: isDark ? ThemeMode.dark : ThemeMode.light),
        child: A5barkApp(),
      ),
    ),
  );
}
