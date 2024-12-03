import 'package:flutter/material.dart';
import 'package:test_tehnic_flaminjoy/core/utils/constants.dart';
import 'mobile_summary_layout.dart';

class TabletSummaryLayout extends StatelessWidget {
  const TabletSummaryLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final sideBarWidth = screenWidth * 0.3;
    final contentWidth = screenWidth * 0.6;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.orangeAccent, AppColors.deepOrange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Row(
            children: [
              if (screenWidth > 800)
                Container(
                  width: sideBarWidth.clamp(200, 300),
                  color: Colors.transparent,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 60,
                        color: Colors.white,
                      ),
                      SizedBox(height: 16),
                      Text(
                        AppStrings.summary,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          AppStrings.reviewYourDataTablet,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              Expanded(
                flex: 2,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: contentWidth.clamp(400, 600),
                  ),
                  child: const MobileSummaryLayout(
                    isMobileResolution: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
