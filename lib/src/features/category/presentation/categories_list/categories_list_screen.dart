import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/common_widgets/custom_scaffold.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_colors.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/features/category/domain/category.dart';
import 'package:quote_void/src/features/category/presentation/category_card.dart';
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
    return CustomScaffold(
      body: Column(
        children: [
          SizedBox(
            height: Sizes.p48,
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                gapW12,
                Expanded(
                  flex: 80,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    cursorColor: AppColors.black,
                    decoration: InputDecoration(
                      fillColor: AppColors.white,
                      filled: true,
                      focusColor: AppColors.black,
                      iconColor: AppColors.black,
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                gapW12,
                const Expanded(flex: 10, child: CircleAvatar())
              ],
            ),
          ),
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
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.5,
              ),
              itemBuilder: (context, index) => CategoryCard(
                category: categories[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
