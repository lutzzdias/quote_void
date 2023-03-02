import 'package:flutter/material.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';

class TextWithLink extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback onTap;
  const TextWithLink({
    super.key,
    required this.text,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyle.body,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            linkText,
            style: AppTextStyle.linkBold,
          ),
        ),
      ],
    );
  }
}
