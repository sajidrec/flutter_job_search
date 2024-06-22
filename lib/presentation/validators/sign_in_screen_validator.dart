import 'package:job_search/presentation/utils/constants.dart';

class SignInScreenValidator {
  static String? emailValidator(email) {
    if (Constants.emailValidatorRegExp.hasMatch(email ?? "a")) {
      return null;
    }
    return "Enter valid email address";
  }

  static String? passwordValidator({
    required value,
  }) {
    if ((value?.isEmpty ?? true) || (value.toString().length < 6)) {
      return "Password must be at least 6 character";
    }
    return null;
  }
}
