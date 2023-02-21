import 'package:flutter/material.dart';
import 'package:quote_void/src/constants/theme/app_colors.dart';

class ColoredSafeArea extends StatelessWidget {
  final Widget child;
  final Color? color;
  const ColoredSafeArea({
    super.key,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? AppColors.gray,
      child: SafeArea(
        child: child,
      ),
    );
  }
}
