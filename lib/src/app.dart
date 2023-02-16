import 'package:flutter/material.dart';
import 'package:quote_void/src/custom_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote Void',
      theme: ThemeData(),
      onGenerateRoute: CustomRouter.generateRoute,
    );
  }
}
