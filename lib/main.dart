import 'dart:io';

import 'package:a5bark/a5bark_app.dart';
import 'package:a5bark/data/shared_pref/shared_pref.dart';
import 'package:a5bark/theme_cubit.dart';
import 'package:a5bark/utils/bloc_observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);

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
