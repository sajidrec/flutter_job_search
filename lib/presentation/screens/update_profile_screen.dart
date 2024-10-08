import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_search/presentation/providers/image_picker_provider.dart';
import 'package:job_search/presentation/providers/password_obscure_provider.dart';
import 'package:job_search/presentation/providers/profile_update_provider.dart';
import 'package:job_search/presentation/providers/user_credential_provider.dart';
import 'package:job_search/presentation/screens/main_bottom_nav_screen.dart';
import 'package:job_search/presentation/utils/app_colors.dart';
import 'package:provider/provider.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({
    super.key,
    // required this.fullName,
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
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<ImagePickerProvider>(context, listen: false)
            .clearPreviousState();
      },
    );
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
          const SizedBox(height: 12),
          Consumer<ImagePickerProvider>(
              builder: (context, imagePickerProvider, child) {
            return Text(
              imagePickerProvider.getPickedImageName,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            );
          }),
          const SizedBox(height: 10),
          _buildImagePicker(),
          const SizedBox(height: 16),
          Consumer<UserCredentialProvider>(builder: (context, user, child) {
            _fullNameTEController.text =
                user.getUserInfo()?.displayName ?? "Unknown";
            return TextFormField(
              maxLength: 35,
              maxLines: 1,
              controller: _fullNameTEController,
              validator: (value) {
                if (value == null) {
                  return "Name Can't be empty";
                } else if (value.isEmpty) {
                  return "Name Can't be empty";
                }
                return null;
              },
            );
          }),
          const SizedBox(height: 16),
          _buildPasswordInputBox(),
          const SizedBox(height: 30),
          SizedBox(
            width: double.maxFinite,
            child: Consumer<ImagePickerProvider>(
                builder: (context, imagePickerProvider, child) {
              return Consumer<ProfileUpdateProvider>(
                  builder: (context, profileUpdateProvider, child) {
                return profileUpdateProvider.getInProgressStatus
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.secondary,
                        ),
                      )
                    : FilledButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (imagePickerProvider.pickedImage != null) {
                              File file = File(
                                  imagePickerProvider.pickedImage!.paths[0] ??
                                      "");
                              bool imageUploaded = await profileUpdateProvider
                                  .uploadImage(uploadFile: file);
                              if (imageUploaded) {
                                Fluttertoast.showToast(
                                  msg: "Image Upload Successful",
                                  backgroundColor: Colors.green,
                                  textColor: AppColors.textWhite,
                                );
                              } else {
                                Fluttertoast.showToast(
                                  msg: "Image upload failed",
                                  backgroundColor: Colors.red,
                                  textColor: AppColors.textWhite,
                                );
                              }
                            }

                            await profileUpdateProvider.updateNameAndPassword(
                              name: _fullNameTEController.text.trim(),
                              password: _passwordTEController.text,
                            );

                            if (context.mounted) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MainBottomNavScreen(),
                                ),
                                (route) => false,
                              );
                            }
                          }
                        },
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
                      );
              });
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePicker() {
    return Column(
      children: [
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppColors.textWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Consumer<ImagePickerProvider>(
              builder: (context, imagePickerProvider, child) {
            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () async {
                FilePickerResult? pickedImage =
                    await imagePickerProvider.pickImage();
                if (pickedImage == null) {
                  Fluttertoast.showToast(
                    msg: "Nothing selected",
                    backgroundColor: Colors.red,
                    textColor: AppColors.textWhite,
                  );
                }
              },
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
            );
          }),
        ),
      ],
    );
  }

  Consumer<PasswordObscureProvider> _buildPasswordInputBox() {
    return Consumer<PasswordObscureProvider>(builder: (context, value, child) {
      return TextFormField(
        obscureText: value.isObscure,
        keyboardType: TextInputType.text,
        controller: _passwordTEController,
        validator: (value) {
          if (value == null) {
            return null;
          } else if (value.isEmpty) {
            return null;
          } else if (value.length < 6) {
            return "Password must be at least 6 character long";
          }
          return null;
        },
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
