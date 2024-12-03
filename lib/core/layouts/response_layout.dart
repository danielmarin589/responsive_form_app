import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget webLayout;

  const ResponsiveLayout({
    required this.mobileLayout,
    required this.tabletLayout,
    required this.webLayout,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width >= 1024) {
      return webLayout;
    } else if (width >= 600 && width < 1024) {
      return tabletLayout;
    } else {
      return mobileLayout;
    }
  }
}
