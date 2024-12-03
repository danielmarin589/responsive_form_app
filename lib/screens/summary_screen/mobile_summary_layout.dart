import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:test_tehnic_flaminjoy/core/utils/constants.dart';
import 'package:test_tehnic_flaminjoy/core/utils/helpers.dart';
import 'package:test_tehnic_flaminjoy/core/widgets/custom_elevated_button.dart';
import 'package:test_tehnic_flaminjoy/screens/summary_screen/widgets/birthday_countdown_widget.dart';
import 'package:test_tehnic_flaminjoy/screens/summary_screen/widgets/card_row_item.dart';
import '../../providers/form_provider.dart';

class MobileSummaryLayout extends StatelessWidget {
  final bool isMobileResolution;
  const MobileSummaryLayout({this.isMobileResolution = true, super.key});

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.mainOrange,
      appBar: isMobileResolution
          ? AppBar(
              leading: IconButton(
                  onPressed: () {
                    retakeForm(context, formProvider);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.mainWhite,
                  )),
              title: const Text(
                AppStrings.summary,
                style: TextStyle(
                  color: AppColors.mainWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: isMobileResolution
                  ? AppColors.mainOrange
                  : Colors.transparent,
            )
          : null,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.mainWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isMobileResolution ? 32 : 0),
            topRight: Radius.circular(isMobileResolution ? 32 : 0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${AppStrings.hello}, ${formProvider.name}! 👋',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(8),
              const Text(
                '${AppStrings.submittedData}: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(24),
              SizedBox(
                width: double.infinity,
                child: Card(
                  color: AppColors.mainNavy,
                  elevation: 8,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardRowItem(
                          icon: Icons.badge,
                          label: AppStrings.name,
                          value: formProvider.name,
                        ),
                        const Gap(8),
                        CardRowItem(
                          icon: Icons.person,
                          label: AppStrings.gender,
                          value: formProvider.gender,
                        ),
                        const Gap(8),
                        CardRowItem(
                          icon: Icons.calendar_month,
                          label: AppStrings.dateOfBirth,
                          value: formProvider.dob != null
                              ? formatDateSummary(formProvider.dob!)
                              : AppStrings.unavailable,
                        ),
                        const Gap(8),
                        CardRowItem(
                          icon: Icons.cake,
                          label: AppStrings.age,
                          value: formProvider.dob != null
                              ? computeAge(formProvider.dob!)
                              : AppStrings.unavailable,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(24),
              BirthdayCountdownWidget(
                birthday: formProvider.dob,
              ),
              const Gap(28),
              const Text(
                AppStrings.anotherTry,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(8),
              CustomElevatedButton(
                text: AppStrings.retakeForm,
                icon: Icons.refresh,
                onPressed: () {
                  retakeForm(context, formProvider);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
