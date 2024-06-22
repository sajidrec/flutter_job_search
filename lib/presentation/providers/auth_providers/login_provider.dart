import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<bool> tryLogin({
    required String email,
    required String pass,
  }) async {
    _inProgress = true;
    notifyListeners();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      _inProgress = false;
      notifyListeners();
      return true;
    } catch (e) {
      _inProgress = false;
      notifyListeners();
      return false;
    }
  }
}
