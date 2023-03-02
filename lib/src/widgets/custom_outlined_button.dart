import 'package:flutter/material.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_button_style.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomOutlinedButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.p48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: AppButtonStyle.outlinedButtonStyle,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                title,
                style: AppTextStyle.titleSmall,
              ),
      ),
    );
  }
}
