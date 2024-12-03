import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:test_tehnic_flaminjoy/core/utils/constants.dart';
import 'package:test_tehnic_flaminjoy/core/utils/helpers.dart';
import 'package:test_tehnic_flaminjoy/core/validators/form_validator.dart';
import 'package:test_tehnic_flaminjoy/core/widgets/custom_alert_dialog.dart';
import 'package:test_tehnic_flaminjoy/core/widgets/custom_date_picker.dart';
import 'package:test_tehnic_flaminjoy/core/widgets/custom_dropdown.dart';
import 'package:test_tehnic_flaminjoy/core/widgets/custom_elevated_button.dart';
import 'package:test_tehnic_flaminjoy/core/widgets/custom_snackbar.dart';
import 'package:test_tehnic_flaminjoy/core/widgets/custom_text_field.dart';
import 'package:test_tehnic_flaminjoy/screens/summary_screen/summary_screen.dart';
import '../../providers/form_provider.dart';

class MobileFormLayout extends StatefulWidget {
  final bool isMobileResolution;
  const MobileFormLayout({this.isMobileResolution = true, super.key});

  @override
  State<MobileFormLayout> createState() => _MobileFormLayoutState();
}

class _MobileFormLayoutState extends State<MobileFormLayout> {
  final _formKey = GlobalKey<FormState>();
  final _nameNode = FocusNode();
  final _genderNode = FocusNode();
  final _birthdayNode = FocusNode();

  @override
  void dispose() {
    _nameNode.dispose();
    _genderNode.dispose();
    _birthdayNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProvider>(context);
    return SizedBox(
      child: Scaffold(
        backgroundColor: AppColors.mainOrange,
        appBar: widget.isMobileResolution
            ? AppBar(
                automaticallyImplyLeading: false,
                title: const Text(
                  AppStrings.form,
                  style: TextStyle(
                    color: AppColors.mainWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                backgroundColor: AppColors.mainOrange)
            : null,
        body: Container(
          decoration: BoxDecoration(
            color: AppColors.mainWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.isMobileResolution ? 32 : 0),
              topRight: Radius.circular(widget.isMobileResolution ? 32 : 0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  CustomTextField(
                    maxLength: 100,
                    hintText: AppStrings.enterName,
                    icon: const Icon(Icons.badge),
                    labelText: AppStrings.name,
                    focusNode: _nameNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) => _genderNode.requestFocus(),
                    onSaved: (value) => formProvider.name = value ?? '',
                    validator: FormValidator.validateName,
                  ),
                  const Gap(24),
                  CustomDropdown(
                    icon: const Icon(Icons.person),
                    focusNode: _genderNode,
                    labelText: AppStrings.gender,
                    items: const ['Male', 'Female', 'Other'],
                    validator: FormValidator.validateGender,
                    onChanged: (value) => formProvider.gender = value ?? '',
                  ),
                  const Gap(24),
                  CustomDatePicker(
                    icon: const Icon(Icons.calendar_month),
                    focusNode: _birthdayNode,
                    labelText: AppStrings.dateOfBirth,
                    initialDate: formProvider.dob,
                    onDateSelected: (date) {
                      formProvider.dob = date;
                    },
                    validator: FormValidator.validateDateOfBirth,
                  ),
                  const Gap(24),
                  Row(
                    children: [
                      Checkbox(
                        value: formProvider.termsAccepted,
                        onChanged: (value) =>
                            formProvider.termsAccepted = value ?? false,
                      ),
                      const Gap(8),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: AppStrings.agreeTo,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    '${AppStrings.termsAndConditions.toLowerCase()}.',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: AppColors.mainOrange,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    CustomAlertDialog.show(
                                      insetPadding:
                                          getPaddingForResolution(context),
                                      context: context,
                                      height:
                                          MediaQuery.sizeOf(context).height / 2,
                                      title: AppStrings.termsAndConditions,
                                      content: AppStrings
                                          .termsAndConditionsPlaceholder,
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(32),
                  CustomElevatedButton(
                      text: AppStrings.submit,
                      onPressed: () {
                        final isFormValid =
                            _formKey.currentState?.validate() ?? false;

                        final termsValid = FormValidator.validateTermsAccepted(
                                formProvider.termsAccepted) ==
                            null;

                        if (!termsValid) {
                          CustomSnackbar.showError(
                            context,
                            message: AppStrings.termsAndConditionsNeeded,
                          );
                          return;
                        }

                        if (isFormValid) {
                          _formKey.currentState?.save();
                          navigateWithAnimation(context, const SummaryScreen());
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
