import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_form_app/core/widgets/custom_alert_dialog.dart';
import 'package:responsive_form_app/providers/form_provider.dart';
import 'package:responsive_form_app/screens/form_screen/form_screen.dart';

String formatDateForm(DateTime date) => DateFormat('dd/MM/yyyy').format(date);

String formatDateSummary(DateTime date) => DateFormat('d MMMM, y').format(date);

String computeAge(DateTime birthday) {
  final today = DateTime.now();
  int age = today.year - birthday.year;

  if (today.month < birthday.month ||
      (today.month == birthday.month && today.day < birthday.day)) {
    age--;
  }

  if (age == 0) return 'Newborn';
  return '$age years';
}

void navigateWithAnimation(BuildContext context, Widget nextPage,
    {bool replacePage = false}) {
  final pageRouteBuilder = PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => nextPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
  if (replacePage) {
    Navigator.of(context).pushAndRemoveUntil(
      pageRouteBuilder,
      (route) => false,
    );
  } else {
    Navigator.of(context).push(pageRouteBuilder);
  }
}

void retakeForm(BuildContext context, FormProvider formProvider) async {
  final shouldRetake = await CustomAlertDialog.showRetakeConfirmation(
    context: context,
  );

  if (context.mounted && shouldRetake == true) {
    formProvider.resetForm();
    navigateWithAnimation(
      context,
      const FormScreen(),
      replacePage: true,
    );
  }
}

EdgeInsets getPaddingForResolution(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  if (width > 1024) {
    return const EdgeInsets.symmetric(horizontal: 400);
  } else if (width > 600) {
    return const EdgeInsets.symmetric(horizontal: 80);
  } else {
    return const EdgeInsets.symmetric(horizontal: 24);
  }
}
