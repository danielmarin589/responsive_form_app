import 'package:flutter/material.dart';
import 'package:responsive_form_app/core/layouts/response_layout.dart';
import 'package:responsive_form_app/screens/form_screen/mobile_form_layout.dart';
import 'package:responsive_form_app/screens/form_screen/tablet_form_laoyout.dart';
import 'package:responsive_form_app/screens/form_screen/web_form_layout.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: MobileFormLayout(),
      tabletLayout: TabletFormLayout(),
      webLayout: WebFormLayout(),
    );
  }
}
