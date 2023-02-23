import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_colors.dart';

class MainAppBar extends StatelessWidget {
  final bool showArrowBack;
  const MainAppBar({
    super.key,
    this.showArrowBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.p48,
      child: Row(
        children: [
          if (showArrowBack)
            Expanded(
              flex: 10,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          gapW12,
          Expanded(
            flex: showArrowBack ? 80 : 90,
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
    );
  }
}
