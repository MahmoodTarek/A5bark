import 'package:a5bark/a5bark_app.dart';
import 'package:a5bark/providers/theme_provider.dart';
import 'package:a5bark/utils/bloc_observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
        child: const A5barkApp(),
      ),
    ),
  );
}
