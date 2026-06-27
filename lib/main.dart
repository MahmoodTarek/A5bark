import 'package:a5bark/a5bark_app.dart';
import 'package:a5bark/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: A5barkApp(),
    ),
  );
}
