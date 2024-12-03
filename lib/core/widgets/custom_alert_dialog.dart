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
              style: AppTextStyles.alertDialogButton,
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
              style: AppTextStyles.alertDialogButton,
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              AppStrings.yes,
              style: AppTextStyles.alertDialogButton,
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
        style: AppTextStyles.alertDialogTitle,
      ),
      titlePadding: const EdgeInsets.all(24).copyWith(bottom: 8),
      backgroundColor: AppColors.mainWhite,
      content: SizedBox(
        height: dialogHeight,
        child: SingleChildScrollView(
          child: Text(
            content,
            style: AppTextStyles.alertDialogContent,
          ),
        ),
      ),
      actions: actions,
    );
  }
}
