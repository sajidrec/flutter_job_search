import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_search/presentation/providers/create_account_email_and_pass_provider.dart';
import 'package:job_search/presentation/providers/password_obscure_provider.dart';
import 'package:job_search/presentation/screens/auth_screens/login_screen.dart';
import 'package:job_search/presentation/utils/app_colors.dart';
import 'package:job_search/presentation/utils/assets_path.dart';
import 'package:job_search/presentation/validators/signup_screen_validators.dart';
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => SignupScreenValidators.nameValidator(value),
            maxLength: 35,
            controller: _fullNameTEController,
            decoration: const InputDecoration(
              hintText: "Full name",
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _emailTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) => SignupScreenValidators.emailValidator(
              email,
            ),
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
          _buildSignUpButton(
            context: context,
            formKey: _formKey,
            emailTEController: _emailTEController,
            passTEController: _passwordTEController,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSignUpButton({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailTEController,
    required TextEditingController passTEController,
  }) {
    return SizedBox(
      width: double.maxFinite,
      child: Consumer<CreateAccountEmailAndPassProvider>(
          builder: (context, createAccountEmailAndPassProvider, child) {
        return FilledButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              const EdgeInsets.all(16),
            ),
            backgroundColor: WidgetStateProperty.all(
              AppColors.secondary,
            ),
          ),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              bool res = await createAccountEmailAndPassProvider.createRequest(
                email: emailTEController.text.trim(),
                password: passTEController.text,
              );
              if (res) {
                Fluttertoast.showToast(
                  msg: "Success",
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  toastLength: Toast.LENGTH_LONG,
                );
                if (mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                }
              } else {
                Fluttertoast.showToast(
                  msg: "Something went wrong",
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  toastLength: Toast.LENGTH_LONG,
                );
              }
            }
          },
          child: createAccountEmailAndPassProvider.getInProgressStatus
              ? const CircularProgressIndicator()
              : const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20),
                ),
        );
      }),
    );
  }

  Widget _buildPasswordInputBox({
    required String hintMessage,
    required TextEditingController teController,
  }) {
    return Consumer<PasswordObscureProvider>(builder: (context, value, child) {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => SignupScreenValidators.passwordValidator(
          value: value,
          passwordTEController: _passwordTEController,
          confirmPasswordTEController: _confirmPasswordTEController,
        ),
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
