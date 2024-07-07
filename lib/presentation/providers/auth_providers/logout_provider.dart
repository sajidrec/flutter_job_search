import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class LogoutProvider extends ChangeNotifier {
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
