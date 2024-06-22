import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccountEmailAndPassProvider extends ChangeNotifier {
  bool _inProgressStatus = false;

  bool get getInProgressStatus => _inProgressStatus;

  Future<bool> createRequest({
    required email,
    required password,
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

      //   TODO: save user full name
    } catch (e) {
      requestSuccessStatus = false;
    }
    _inProgressStatus = false;
    notifyListeners();
    return requestSuccessStatus;
  }
}
