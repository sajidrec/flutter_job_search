import 'package:flutter/foundation.dart';

class PasswordObscureProvider extends ChangeNotifier {
  bool _isObscure = true;

  bool get isObscure => _isObscure;

  void toggleObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
}
