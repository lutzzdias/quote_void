import 'package:flutter/material.dart';
import 'package:quote_void/src/widgets/main_app_bar.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/features/category/domain/category.dart';
import 'package:quote_void/src/features/category/presentation/categories_list/widgets/category_list.dart';
import 'package:quote_void/src/widgets/responsive_center.dart';
import 'package:uuid/uuid.dart';

class CategoriesListScreen extends StatelessWidget {
  CategoriesListScreen({super.key});

  final categories = [
    Category(id: const Uuid().v4(), name: 'Favorites', icon: Icons.star),
    Category(id: const Uuid().v4(), name: 'Stormlight Archive'),
    Category(id: const Uuid().v4(), name: 'University'),
    Category(id: const Uuid().v4(), name: 'Bible'),
    Category(id: const Uuid().v4(), name: 'Mistborn'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveCenter(
        child: Column(
          children: [
            const MainAppBar(),
            gapH12,
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Categories',
                style: AppTextStyle.title,
              ),
            ),
            gapH12,
            Expanded(
              child: CategoryList(categories: categories),
            ),
          ],
        ),
      ),
    );
  }
}
