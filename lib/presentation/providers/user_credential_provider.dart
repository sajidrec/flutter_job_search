
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class UserCredentialProvider extends ChangeNotifier {
  User? getUserInfo() {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return firebaseAuth.currentUser;
  }
}
