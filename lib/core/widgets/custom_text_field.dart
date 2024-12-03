import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_form_app/core/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final Icon? icon;
  final int? maxLength;

  const CustomTextField({
    required this.labelText,
    required this.hintText,
    required this.focusNode,
    required this.textInputAction,
    this.onSaved,
    this.onFieldSubmitted,
    this.validator,
    this.icon,
    this.maxLength,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              labelText,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              '*',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.mainRed,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const Gap(4),
        TextFormField(
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          maxLength: maxLength,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autocorrect: false,
          onTapOutside: (event) => focusNode.unfocus(),
          focusNode: focusNode,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            counterText: '',
            hintText: hintText,
            prefixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.lightOrange,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.mainGrey,
                width: 1.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.mainRed,
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.mainRed,
                width: 2.5,
              ),
            ),
          ),
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
        ),
      ],
    );
  }
}
