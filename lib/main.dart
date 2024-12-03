import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:test_tehnic_flaminjoy/core/utils/constants.dart';
import 'package:test_tehnic_flaminjoy/providers/form_provider.dart';
import 'package:test_tehnic_flaminjoy/screens/form_screen/form_screen.dart';
import 'package:test_tehnic_flaminjoy/screens/summary_screen/summary_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FormProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'GB'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: 'Responsive Form App',
      theme: ThemeData(
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.mainOrange;
            }
            return AppColors.mainWhite;
          }),
          checkColor: WidgetStateProperty.all(AppColors.mainWhite),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FormScreen(),
        '/summary': (context) => const SummaryScreen(),
      },
    );
  }
}
