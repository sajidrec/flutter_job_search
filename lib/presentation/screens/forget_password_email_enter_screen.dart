import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_search/presentation/utils/app_colors.dart';
import 'package:job_search/presentation/utils/assets_path.dart';

class ForgetPasswordEmailEnterScreen extends StatefulWidget {
  const ForgetPasswordEmailEnterScreen({super.key});

  @override
  State<ForgetPasswordEmailEnterScreen> createState() =>
      _ForgetPasswordEmailEnterScreenState();
}

class _ForgetPasswordEmailEnterScreenState
    extends State<ForgetPasswordEmailEnterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();

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
                const SizedBox(height: 12),
                _buildFormField(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Enter your email",
            ),
          ),
          const SizedBox(height: 20),
          _buildSendEmailButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSendEmailButton() {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(
            AppColors.primaryShade.withOpacity(0.2),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.all(18),
          ),
          backgroundColor: WidgetStateProperty.all(
            AppColors.secondary,
          ),
          foregroundColor: WidgetStateProperty.all(
            AppColors.textWhite,
          ),
        ),
        onPressed: () {},
        child: const Text(
          "Send email",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildScreenImageLogo() {
    return Center(
      child: SvgPicture.asset(
        AssetsPath.forgetPassImage,
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
  }
}
