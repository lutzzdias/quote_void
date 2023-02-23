import 'package:flutter/material.dart';
import 'package:quote_void/src/features/category/domain/category.dart';
import 'package:quote_void/src/features/category/presentation/category_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (context, index) => CategoryCard(
        category: categories[index],
      ),
    );
  }
}
