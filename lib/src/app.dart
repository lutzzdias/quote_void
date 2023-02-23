import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/constants/theme/app_colors.dart';
import 'package:quote_void/src/routing/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Quote Void',
        routerConfig: goRouter,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.gray,
          colorScheme: const ColorScheme.light().copyWith(
            primary: AppColors.black,
          ),
        ),
      ),
    );
  }
}
