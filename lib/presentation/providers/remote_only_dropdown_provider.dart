import 'package:flutter/material.dart';

class RemoteOnlyDropdownProvider extends ChangeNotifier {
  bool _remoteOnly = false;

  set setRemoteOnlyStatus(bool value) {
    _remoteOnly = value;
    notifyListeners();
  }

  bool get getRemoteOnlyStatus => _remoteOnly;
}
