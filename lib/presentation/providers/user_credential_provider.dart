import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:job_search/data/models/user_credential_model.dart';
import 'package:job_search/presentation/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCredentialProvider extends ChangeNotifier {
  UserCredentialModel _userInfo = UserCredentialModel(
    email: null,
    uid: null,
    name: null,
  );

  UserCredentialModel get userInfo => _userInfo;

  Future<void> requestUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _userInfo = UserCredentialModel.fromJson(
      jsonDecode(
        sharedPreferences.getString(Constants.userCredentialKey) ?? "",
      ),
    );
    notifyListeners();
  }
}
