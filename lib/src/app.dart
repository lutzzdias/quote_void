import 'package:flutter/material.dart';
import 'package:quote_void/src/routing/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Quote Void',
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black45,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      routerConfig: goRouter,
    );
  }
}
