import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                _buildSignUpButton(),
                const SizedBox(height: 25),
                _buildLoginButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.maxFinite,
      child: OutlinedButton(
        style: ButtonStyle(
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
        onPressed: () {},
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
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
        onPressed: () {},
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
