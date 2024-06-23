import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccountEmailAndPassProvider extends ChangeNotifier {
  bool _inProgressStatus = false;

  bool get getInProgressStatus => _inProgressStatus;

  Future<bool> createRequest({
    required String email,
    required String password,
    required String fullName,
  }) async {
    _inProgressStatus = true;
    bool requestSuccessStatus;
    notifyListeners();
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      requestSuccessStatus = true;

      await userCredential.user?.updateDisplayName(fullName);
    } catch (e) {
      requestSuccessStatus = false;
    }
    _inProgressStatus = false;
    notifyListeners();
    return requestSuccessStatus;
  }
}
