import 'package:job_search/presentation/utils/constants.dart';

class ForgetPasswordScreenValidator {
  static String? emailValidator(email) {
    if (Constants.emailValidatorRegExp.hasMatch(email ?? "a")) {
      return null;
    }
    return "Enter valid email address";
  }
}
