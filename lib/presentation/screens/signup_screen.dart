import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_search/presentation/providers/password_obscure_provider.dart';
import 'package:job_search/presentation/utils/app_colors.dart';
import 'package:job_search/presentation/utils/assets_path.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              children: [
                _buildScreenImageLogo(),
                _buildFormField(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _fullNameTEController,
            decoration: const InputDecoration(
              hintText: "Full name",
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Email",
            ),
          ),
          const SizedBox(height: 15),
          _buildPasswordInputBox(
            hintMessage: "Password",
            teController: _passwordTEController,
          ),
          const SizedBox(height: 15),
          _buildPasswordInputBox(
            hintMessage: "Confirm Password",
            teController: _confirmPasswordTEController,
          ),
          const SizedBox(height: 25),
          _buildSignUpButton(context),
          const SizedBox(height: 20),
        ],
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
        onPressed: () {},
        child: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Consumer<PasswordObscureProvider> _buildPasswordInputBox({
    required String hintMessage,
    required TextEditingController teController,
  }) {
    return Consumer<PasswordObscureProvider>(builder: (context, value, child) {
      return TextFormField(
        controller: teController,
        obscureText: value.isObscure,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              value.toggleObscure();
            },
            icon: Icon(
              (value.isObscure ? Icons.visibility_off : Icons.visibility),
              color: AppColors.secondary,
            ),
          ),
          hintText: hintMessage,
        ),
      );
    });
  }

  Widget _buildScreenImageLogo() {
    return Center(
      child: SvgPicture.asset(
        AssetsPath.signupImage,
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
  }
}
