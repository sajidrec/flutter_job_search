import 'package:flutter/widgets.dart';
import 'package:job_search/presentation/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutProvider extends ChangeNotifier {
  Future<void> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(Constants.userCredentialKey);
    await sharedPreferences.remove(Constants.userLoggedInKey);
  }
}
