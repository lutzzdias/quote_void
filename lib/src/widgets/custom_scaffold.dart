import 'package:flutter/material.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_colors.dart';

// !!! TODO: Change custom scaffold and use a better responsive approach

class CustomScaffold extends StatelessWidget {
  final Color? color;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;

  const CustomScaffold({
    super.key,
    this.color,
    this.appBar,
    required this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? AppColors.gray,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => Scaffold(
            appBar: appBar,
            floatingActionButton: floatingActionButton,
            body: SingleChildScrollView(
              child: SizedBox(
                height: constraints.maxHeight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.p20,
                    vertical: Sizes.p12,
                  ),
                  child: body,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
