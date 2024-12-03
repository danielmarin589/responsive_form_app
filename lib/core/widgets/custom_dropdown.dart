import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_form_app/core/utils/constants.dart';

class CustomDropdown extends StatelessWidget {
  final FocusNode focusNode;
  final String labelText;
  final List<String> items;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Icon? icon;

  const CustomDropdown({
    required this.focusNode,
    required this.labelText,
    required this.items,
    this.validator,
    this.onChanged,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (event) {
        if (focusNode.hasFocus) {
          focusNode.unfocus();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
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
          ]),
          const Gap(4),
          DropdownButtonFormField<String>(
            hint: const Text(AppStrings.selectAGender),
            dropdownColor: AppColors.mainWhite,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
            focusNode: focusNode,
            decoration: InputDecoration(
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
                  color: Colors.grey,
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
            items: items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
            validator: validator,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
