import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

class ProfileUpdateProvider extends ChangeNotifier {
  bool _inProgress = false;

  bool get getInProgressStatus => _inProgress;

  Future<bool> uploadImage({required File uploadFile}) async {
    _inProgress = true;
    notifyListeners();
    final firebaseStorage = FirebaseStorage.instance.ref();
    FirebaseAuth firebaseauth = FirebaseAuth.instance;
    final testChild = firebaseStorage
        .child("user_profile_pics/${firebaseauth.currentUser?.uid}");
    try {
      await testChild.putFile(uploadFile);
      await firebaseauth.currentUser!.updatePhotoURL(
        await testChild.getDownloadURL(),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> updateNameAndPassword({
    required String? name,
    required String? password,
  }) async {
    _inProgress = true;
    notifyListeners();
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    if (name != null) {
      if (name.isNotEmpty) {
        await firebaseAuth.currentUser!.updateDisplayName(name);
      }
    }
    if (password != null) {
      if (password.length >= 6) {
        await firebaseAuth.currentUser!.updatePassword(password);
      }
    }
    _inProgress = false;
    notifyListeners();
  }
}
