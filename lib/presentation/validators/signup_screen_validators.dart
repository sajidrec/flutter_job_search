import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:job_search/presentation/utils/constants.dart';

class SignupScreenValidators {
  static String? passwordValidator({
    required value,
    required TextEditingController passwordTEController,
    required TextEditingController confirmPasswordTEController,
  }) {
    if ((value?.isEmpty ?? true) || (value.toString().length < 6)) {
      return "Password must be at least 6 character";
    } else if (passwordTEController.value.text !=
        confirmPasswordTEController.value.text) {
      return "Password and confirm password didn't matched";
    }
    return null;
  }

  static String? nameValidator(value) {
    if (value?.isEmpty ?? true) {
      return "Name can't be empty";
    }
    return null;
  }

  static String? emailValidator(email) {
    if (Constants.emailValidatorRegExp.hasMatch(email ?? "a")) {
      return null;
    }
    return "Enter valid email address";
  }
}
