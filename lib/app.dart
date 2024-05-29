import 'package:flutter/material.dart';
import 'package:job_search/presentation/screens/signup_or_login_screen.dart';
import 'package:job_search/presentation/utils/app_colors.dart';

class JobSearchApp extends StatelessWidget {
  const JobSearchApp({super.key});

  final TextStyle _textStyle = const TextStyle(
    color: AppColors.textWhite,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildThemeData(),
      home: const SignupOrLoginScreen(),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.primary,
      textTheme: _buildTextTheme(),
    );
  }

  TextTheme _buildTextTheme() {
    return TextTheme(
      titleMedium: _textStyle,
      bodyLarge: _textStyle,
      bodyMedium: _textStyle,
      bodySmall: _textStyle,
      displayLarge: _textStyle,
      displayMedium: _textStyle,
      displaySmall: _textStyle,
      headlineLarge: _textStyle.copyWith(fontSize: 55),
      labelSmall: _textStyle,
      labelLarge: _textStyle,
      headlineMedium: _textStyle,
      headlineSmall: _textStyle,
      labelMedium: _textStyle,
      titleLarge: _textStyle,
      titleSmall: _textStyle,
    );
  }
}
