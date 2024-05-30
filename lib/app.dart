import 'package:flutter/material.dart';
import 'package:job_search/presentation/providers/password_obscure_provider.dart';
import 'package:job_search/presentation/screens/signup_or_login_screen.dart';
import 'package:job_search/presentation/utils/app_colors.dart';
import 'package:provider/provider.dart';

class JobSearchApp extends StatelessWidget {
  const JobSearchApp({super.key});

  final TextStyle _textStyle = const TextStyle(
    color: AppColors.textWhite,
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PasswordObscureProvider(),
        ),
      ],
      child: MaterialApp(
        theme: _buildThemeData(),
        home: const SignupOrLoginScreen(),
      ),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.primary,
      textTheme: _buildTextTheme(),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.textWhite,
      ),
      inputDecorationTheme: _buildInputDecorationTheme(),
    );
  }

  InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey.shade500),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 18,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1.2,
          color: AppColors.secondary,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1.2,
          color: AppColors.textWhite,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1.2,
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
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
