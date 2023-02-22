import 'package:flutter/material.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_colors.dart';

class AppButtons {
  static final outlinedButtonStyle = OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    side: const BorderSide(
      width: 1,
    ),
    padding: const EdgeInsets.all(Sizes.p8),
    foregroundColor: AppColors.black,
    backgroundColor: AppColors.transparent,
  );

  static final whiteOutlinedButtonStyle = OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    side: const BorderSide(
      width: 1,
    ),
    padding: const EdgeInsets.all(Sizes.p8),
    foregroundColor: AppColors.black,
    backgroundColor: AppColors.white,
  );
}
