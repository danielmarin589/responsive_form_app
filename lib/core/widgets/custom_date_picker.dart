import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_form_app/core/utils/constants.dart';
import 'package:responsive_form_app/core/utils/helpers.dart';

class CustomDatePicker extends StatefulWidget {
  final FocusNode focusNode;
  final String labelText;
  final DateTime? initialDate;
  final ValueChanged<DateTime?> onDateSelected;
  final Icon? icon;

  const CustomDatePicker({
    required this.focusNode,
    required this.labelText,
    required this.initialDate,
    required this.onDateSelected,
    this.icon,
    super.key,
  });

  @override
  CustomDatePickerState createState() => CustomDatePickerState();
}

class CustomDatePickerState extends State<CustomDatePicker> {
  late TextEditingController _controller;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _controller = TextEditingController(
      text: _selectedDate != null ? formatDateForm(_selectedDate!) : '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('en', 'GB'),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.orange,
            colorScheme: const ColorScheme.light(
              primary: Colors.orange,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.orange,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (date != null) {
      setState(() {
        _selectedDate = date;
        _controller.text = formatDateForm(_selectedDate!);
      });
      widget.onDateSelected(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text(
            widget.labelText,
            style: AppTextStyles.customFieldLabel,
          ),
          const Text(
            '*',
            style: AppTextStyles.mandatoryAsterisk,
          ),
        ]),
        const Gap(4),
        TapRegion(
          onTapInside: (event) {
            _pickDate(context);
            widget.focusNode.requestFocus();
          },
          child: TextFormField(
            style: AppTextStyles.customFieldText,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            readOnly: true,
            onTapOutside: (event) => widget.focusNode.unfocus(),
            controller: _controller,
            focusNode: widget.focusNode,
            decoration: InputDecoration(
              prefixIcon: widget.icon,
              hintText: AppStrings.selectADate,
              hintStyle: AppTextStyles.customFieldHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.mainRed,
                  width: 2.0,
                ),
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
                ),
              ),
            ),
            validator: (value) =>
                _selectedDate == null ? AppStrings.dateRequired : null,
          ),
        ),
      ],
    );
  }
}
