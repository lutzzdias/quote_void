import 'package:flutter/material.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_colors.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';

class DefaultSnackBar {
  static void show(
      {required BuildContext context,
      required String title,
      String? body,
      required IconData icon}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.white,
        showCloseIcon: true,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.p8,
          horizontal: Sizes.p16,
        ),
        content: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            gapW12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.subtitleBold,
                  ),
                  if (body != null)
                    Text(
                      body,
                      style: AppTextStyle.bodyTranslucent,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
