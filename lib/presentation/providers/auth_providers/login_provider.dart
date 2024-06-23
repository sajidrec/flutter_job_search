import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:job_search/data/models/user_credential_model.dart';
import 'package:job_search/presentation/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<bool> tryLogin({
    required String email,
    required String pass,
  }) async {
    bool result = false;
    _inProgress = true;
    notifyListeners();

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );

      result = true;

      UserCredentialModel user = UserCredentialModel(
        email: userCredential.user?.email,
        name: userCredential.user?.displayName,
        uid: userCredential.user?.uid,
      );

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      await sharedPreferences.setString(
        Constants.userCredentialKey,
        jsonEncode(user.toJson()),
      );
    } catch (e) {
      result = false;
    }

    _inProgress = false;
    notifyListeners();
    return result;
  }
}
