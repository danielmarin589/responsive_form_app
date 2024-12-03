import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_tehnic_flaminjoy/core/utils/constants.dart';
import 'mobile_summary_layout.dart';

class WebSummaryLayout extends StatelessWidget {
  const WebSummaryLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainOrange,
      body: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.orangeAccent,
                    AppColors.deepOrange,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 80,
                    color: Colors.white,
                  ),
                  Gap(16),
                  Text(
                    AppStrings.summary,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      AppStrings.reviewYourDataWeb,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 800,
            child: MobileSummaryLayout(
              isMobileResolution: false,
            ),
          ),
        ],
      ),
    );
  }
}
