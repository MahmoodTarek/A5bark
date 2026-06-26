import 'package:flutter/material.dart';

class A5barkApp extends StatelessWidget {
  const A5barkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A5bark',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: .max,
        children: [
          const Center(
            child: Text('Home Screen'),
          ),
        ],
      ),
    );
  }
}