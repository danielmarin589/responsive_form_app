import 'package:flutter/material.dart';
import 'package:responsive_form_app/core/utils/constants.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;
  final double? dialogHeight;
  final EdgeInsets? insetPadding;

  const CustomAlertDialog({
    required this.title,
    required this.content,
    required this.actions,
    this.dialogHeight,
    this.insetPadding,
    super.key,
  });

  static Future<void> show({
    required BuildContext context,
    required String title,
    required String content,
    required double? height,
    EdgeInsets? insetPadding,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: title,
        content: content,
        dialogHeight: height,
        insetPadding: insetPadding,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              AppStrings.close,
              style: TextStyle(
                color: AppColors.mainOrange,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Future<bool?> showRetakeConfirmation({
    required BuildContext context,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: '${AppStrings.retakeForm}?',
        content: AppStrings.retakeFormWarning,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              AppStrings.no,
              style: TextStyle(
                color: AppColors.mainOrange,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              AppStrings.yes,
              style: TextStyle(
                color: AppColors.mainOrange,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: insetPadding ?? const EdgeInsets.all(24),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      titlePadding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: 8,
      ),
      backgroundColor: AppColors.mainWhite,
      content: SizedBox(
        height: dialogHeight,
        child: SingleChildScrollView(
          child: Text(
            content,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
      actions: actions,
    );
  }
}
