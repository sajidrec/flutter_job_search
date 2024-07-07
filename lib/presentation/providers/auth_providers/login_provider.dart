
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );

      result = true;
    } catch (e) {
      result = false;
    }

    _inProgress = false;
    notifyListeners();
    return result;
  }
}
