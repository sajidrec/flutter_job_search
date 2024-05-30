import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_search/presentation/screens/forget_password_email_enter_screen.dart';
import 'package:job_search/presentation/screens/login_screen.dart';
import 'package:job_search/presentation/screens/signup_screen.dart';
import 'package:job_search/presentation/utils/app_colors.dart';
import 'package:job_search/presentation/utils/assets_path.dart';

class SignupOrLoginScreen extends StatelessWidget {
  const SignupOrLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 10),
                _buildScreenImageLogo(),
                const SizedBox(height: 20),
                const Text(
                  "Find Your Dream Job For Bright Future",
                  style: TextStyle(fontSize: 40),
                ),
                const SizedBox(height: 20),
                _buildSignUpButton(context),
                const SizedBox(height: 25),
                _buildLoginButton(context),
                const SizedBox(height: 15),
                _buildForgetPasswordButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgetPasswordButton(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          AppColors.primaryShade,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ForgetPasswordEmailEnterScreen(),
          ),
        );
      },
      child: const Text(
        "Forget password?",
        style: TextStyle(
          color: AppColors.textWhite,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: OutlinedButton(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(
            AppColors.primaryShade,
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.all(16),
          ),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          side: WidgetStateProperty.all(
            const BorderSide(
              width: 2,
              color: AppColors.secondary,
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: FilledButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            const EdgeInsets.all(16),
          ),
          backgroundColor: WidgetStateProperty.all(
            AppColors.secondary,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignupScreen(),
            ),
          );
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildScreenImageLogo() {
    return Center(
      child: SvgPicture.asset(
        AssetsPath.signupOrLoginImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
