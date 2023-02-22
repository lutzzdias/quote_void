
import 'package:flutter/material.dart';
import 'package:quote_void/src/constants/theme/app_colors.dart';

typedef ResponsiveBuilder = Widget Function(
  BuildContext context,
  Size size,
);

class CustomSafeArea extends StatelessWidget {
  final Color? color;
  final ResponsiveBuilder responsiveBuilder;

  const CustomSafeArea({
    super.key,
    required ResponsiveBuilder builder,
    this.color,
  }) : responsiveBuilder = builder;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? AppColors.gray,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) =>
              responsiveBuilder(context, constraints.biggest),
        ),
      ),
    );
  }
}
