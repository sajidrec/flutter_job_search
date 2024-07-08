import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

class ProfileUpdateProvider extends ChangeNotifier {
  Future<bool> uploadImage({required File uploadFile}) async {
    final firebaseStorage = FirebaseStorage.instance.ref();
    FirebaseAuth firebaseauth = FirebaseAuth.instance;
    final testChild = firebaseStorage
        .child("user_profile_pics/${firebaseauth.currentUser?.uid}");
    try {
      await testChild.putFile(uploadFile);
      return true;
    } catch (e) {
      return false;
    }
  }
}
