import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_form_app/core/utils/constants.dart';
import 'mobile_form_layout.dart';

class WebFormLayout extends StatelessWidget {
  const WebFormLayout({super.key});

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
                    Icons.assignment,
                    size: 80,
                    color: Colors.white,
                  ),
                  Gap(16),
                  Text(
                    AppStrings.welcomeForm,
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
                      AppStrings.fillOutForm,
                      style: TextStyle(
                        fontSize: 15,
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
            width: 600,
            child: MobileFormLayout(
              isMobileResolution: false,
            ),
          ),
        ],
      ),
    );
  }
}
