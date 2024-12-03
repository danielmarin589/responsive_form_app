import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_tehnic_flaminjoy/core/utils/constants.dart';
import 'mobile_form_layout.dart';

class TabletFormLayout extends StatelessWidget {
  const TabletFormLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final formWidth = screenWidth * 0.6;
    final sideBarWidth = screenWidth * 0.3;

    return Scaffold(
      backgroundColor: AppColors.mainOrange,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (screenWidth <= 800)
              Container(
                width: formWidth.clamp(400, 600),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.orangeAccent, AppColors.deepOrange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: const MobileFormLayout(),
              ),
            if (screenWidth > 800)
              Expanded(
                flex: 1,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: sideBarWidth.clamp(200, 300),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.orangeAccent, AppColors.deepOrange],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.assignment,
                          size: 60,
                          color: Colors.white,
                        ),
                        Gap(16),
                        Text(
                          AppStrings.getStarted,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.mainWhite,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (screenWidth > 800)
              Expanded(
                flex: 2,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: formWidth.clamp(400, 600),
                  ),
                  child: const MobileFormLayout(
                    isMobileResolution: false,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
