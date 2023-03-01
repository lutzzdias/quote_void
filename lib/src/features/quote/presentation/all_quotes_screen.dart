import 'package:flutter/material.dart';
import 'package:quote_void/src/common_widgets/custom_scaffold.dart';
import 'package:quote_void/src/common_widgets/main_app_bar.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_colors.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/features/category/domain/category.dart';
import 'package:quote_void/src/features/category/presentation/categories_list/widgets/category_list.dart';
import 'package:uuid/uuid.dart';

class AllQuotesScreen extends StatelessWidget {
  const AllQuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const MainAppBar(showArrowBack: false),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.p12),
              child: CategoryList(
                categories: [
                  Category(
                    id: const Uuid().v4(),
                    name: 'Favorites',
                    icon: Icons.star,
                  ),
                  Category(
                    id: const Uuid().v4(),
                    name: 'Stormlight Archive',
                    icon: Icons.cloud,
                  ),
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'See all >',
              style: AppTextStyle.body,
            ),
          ),
          const Divider(
            color: AppColors.black,
          ),
          Row(
            children: [
              const Icon(
                Icons.abc,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.abc),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.abc),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.abc),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.abc),
              ),
              const Spacer(),
              // TODO: Get number of quotes
              const Text(
                'Total: 17',
                style: AppTextStyle.bodyTranslucent,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Expanded(
                      child: Column(
                        children: [
                          const Text(
                              'Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content'),
                          Row(
                            children: const [
                              Text('Brandon Sanderson'),
                              Text('23/01/23')
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
