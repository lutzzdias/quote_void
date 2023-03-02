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
          SizedBox(
            // TODO: Use a constant (may need to create one)
            height: 100,
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
            ],
          ),
          Expanded(
            child: ListView.builder(
              // TODO: Set itemCount to actual length of data list
              itemCount: 17,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(Sizes.p4),
                  child: Column(
                    children: [
                      const Text(
                        'As I fear not a child with a weapon he cannot lift, I’ll never fear the mind of a man who does not think.',
                        style: AppTextStyle.body,
                      ),
                      gapH8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Brandon Sanderson',
                            style: AppTextStyle.bodyTranslucent,
                          ),
                          Text(
                            '23/01/23',
                            style: AppTextStyle.bodyTranslucent,
                          ),
                        ],
                      ),
                      // TODO: Compare to actual list length
                      if (index != 17) const Divider()
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
