import 'package:flutter/material.dart';
import 'package:job_search/presentation/providers/password_obscure_provider.dart';
import 'package:job_search/presentation/utils/app_colors.dart';
import 'package:provider/provider.dart';

class UpdateProfileScreen extends StatefulWidget {
  final String fullName;

  const UpdateProfileScreen({
    super.key,
    required this.fullName,
  });

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fullNameTEController.text = widget.fullName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildFormField(),
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
          const SizedBox(height: 10),
          _buildImagePicker(),
          const SizedBox(height: 16),
          TextFormField(
            maxLength: 35,
            maxLines: 1,
            controller: _fullNameTEController,
          ),
          const SizedBox(height: 16),
          _buildPasswordInputBox(),
          const SizedBox(height: 30),
          SizedBox(
            width: double.maxFinite,
            child: FilledButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  AppColors.secondary,
                ),
                foregroundColor: WidgetStateProperty.all(
                  AppColors.textWhite,
                ),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.all(14),
                ),
              ),
              child: const Text(
                "Update",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePicker() {
    return Column(
      children: [
        const Text(
          "anything that suite.jpg",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppColors.textWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {},
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: Colors.black87,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Select Image",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ],
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
          hintText: "Change password (Optional)",
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameTEController.dispose();
    _passwordTEController.dispose();
  }
}
