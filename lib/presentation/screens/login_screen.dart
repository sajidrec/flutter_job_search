import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_search/presentation/providers/password_obscure_provider.dart';
import 'package:job_search/presentation/screens/forget_password_email_enter_screen.dart';
import 'package:job_search/presentation/utils/app_colors.dart';
import 'package:job_search/presentation/utils/assets_path.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();

  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                const SizedBox(height: 15),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildEmailInputBox(),
                      const SizedBox(height: 15),
                      _buildPasswordInputBox(),
                      const SizedBox(height: 35),
                      _buildLoginButton(context),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                _buildForgetPasswordButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Consumer<PasswordObscureProvider> _buildPasswordInputBox() {
    return Consumer<PasswordObscureProvider>(builder: (context, value, child) {
      return TextFormField(
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
          hintText: "Enter your password",
        ),
      );
    });
  }

  Widget _buildEmailInputBox() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: "Enter your email",
        suffixIcon: Icon(
          Icons.email_rounded,
          color: AppColors.secondary,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
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
        onPressed: () {},
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildScreenImageLogo() {
    return Center(
      child: SvgPicture.asset(
        AssetsPath.loginImage,
        fit: BoxFit.fill,
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
            builder: (context) => const ForgetPasswordEmailEnterScreen(),
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
}
