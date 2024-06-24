import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<bool> sendCodeInEmail({required String email}) async {
    bool requestSuccess;
    _inProgress = true;
    notifyListeners();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      requestSuccess = true;
    } catch (e) {
      requestSuccess = false;
    }

    _inProgress = false;
    notifyListeners();

    return requestSuccess;
  }
}
