import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_form_app/core/utils/constants.dart';

class CardRowItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const CardRowItem({
    required this.icon,
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        icon,
        color: AppColors.mainWhite,
      ),
      const Gap(12),
      Text(
        '$label: ',
        style: AppTextStyles.cardRowLabel,
      ),
      Text(
        value,
        style: AppTextStyles.cardRowText,
      )
    ]);
  }
}
