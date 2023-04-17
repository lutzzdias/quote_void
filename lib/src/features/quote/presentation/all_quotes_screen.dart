import 'package:flutter/material.dart';
import 'package:quote_void/src/features/category/presentation/category_card.dart';
import 'package:quote_void/src/widgets/main_app_bar.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_colors.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/features/category/domain/category.dart';
import 'package:quote_void/src/widgets/responsive_center.dart';
import 'package:uuid/uuid.dart';

class AllQuotesScreen extends StatelessWidget {
  AllQuotesScreen({super.key});

  final categories = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Use ResponsiveSliverCenter somehow here
      body: SafeArea(
        child: ResponsiveCenter(
          child: CustomScrollView(
            slivers: [
              // Make AppBar disappear but snap back into view as soon as the user scrolls upward
              const SliverToBoxAdapter(child: MainAppBar(showArrowBack: false)),
              const SliverToBoxAdapter(child: gapH12),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => CategoryCard(
                    category: categories[index],
                  ),
                  childCount: categories.length,
                ),
              ),
              const SliverToBoxAdapter(child: gapH8),
              const SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'See all >',
                    style: AppTextStyle.body,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: gapH4),
              const SliverToBoxAdapter(
                child: Divider(
                  color: AppColors.black,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
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
              ),
              const SliverToBoxAdapter(child: gapH12),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
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
                  childCount: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
