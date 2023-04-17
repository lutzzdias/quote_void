import 'package:flutter/material.dart';
import 'package:quote_void/src/constants/app_sizes.dart';

/// Reusable widget for showing a child with a maximum content width constraint.
/// If available width is larger than the maximum width, the child will be
/// centered.
/// If available width is smaller than the maximum width, the child use all the
/// available width.
class ResponsiveCenter extends StatelessWidget {
  const ResponsiveCenter({
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: Sizes.p16),
    required this.child,
  });

  final EdgeInsetsGeometry padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Use Center as it has *unconstrained* width (loose constraints)
    return Center(
      // together with SizedBox to specify the max width (tight constraints)
      // See this thread for more info:
      // https://twitter.com/biz84/status/1445400059894542337
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

/// Sliver-equivalent of [ResponsiveCenter].
class ResponsiveSliverCenter extends StatelessWidget {
  const ResponsiveSliverCenter({
    super.key,
    this.padding = EdgeInsets.zero,
    required this.child,
  });
  final EdgeInsetsGeometry padding;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ResponsiveCenter(
        padding: padding,
        child: child,
      ),
    );
  }
}
