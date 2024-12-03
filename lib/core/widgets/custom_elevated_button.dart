import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_form_app/core/utils/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Function() onPressed;

  const CustomElevatedButton({
    required this.text,
    required this.onPressed,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 16,
          ),
          backgroundColor: AppColors.mainOrange,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: AppColors.mainWhite,
              ),
              const Gap(16),
            ],
            Text(
              text,
              style: AppTextStyles.elevatedButtonText,
            ),
          ],
        ));
  }
}
