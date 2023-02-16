import 'package:flutter/material.dart';
import 'package:quote_void/src/routing/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Quote Void',
      theme: ThemeData(),
      routerConfig: goRouter,
    );
  }
}
