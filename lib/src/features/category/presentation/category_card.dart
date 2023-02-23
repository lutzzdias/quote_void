import 'package:flutter/material.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/features/category/domain/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p8),
          child: Row(
            children: [
              if (category.icon != null)
                Expanded(
                  flex: 15,
                  child: Icon(category.icon),
                ),
              gapW8,
              Expanded(
                flex: 70,
                child: Text(
                  category.name,
                  style: AppTextStyle.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              gapW16,
              const Expanded(
                flex: 15,
                child: Text(
                  '20',
                  style: AppTextStyle.subtitleTranslucent,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
