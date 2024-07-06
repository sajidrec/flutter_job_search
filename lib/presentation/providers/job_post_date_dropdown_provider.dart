import 'package:flutter/material.dart';

class JobPostDateDropdownProvider extends ChangeNotifier {
  String _jobPostedDateRange = "all";

  set setJobPostedDateRange(String value) {
    _jobPostedDateRange = value;
    notifyListeners();
  }

  String get getJobPostedDateRange => _jobPostedDateRange;
}
