import 'package:flutter/material.dart';
import 'package:responsive_form_app/core/layouts/response_layout.dart';
import 'package:responsive_form_app/screens/summary_screen/mobile_summary_layout.dart';
import 'package:responsive_form_app/screens/summary_screen/tablet_summary_layout.dart';
import 'package:responsive_form_app/screens/summary_screen/web_summary_layout.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: MobileSummaryLayout(),
      tabletLayout: TabletSummaryLayout(),
      webLayout: WebSummaryLayout(),
    );
  }
}
