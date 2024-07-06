import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:job_search/data/models/job_details_list_model.dart';
import 'package:job_search/data/utils/urls.dart';
import 'package:job_search/secret/secret_info.dart';

class JobListProvider extends ChangeNotifier {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  JobDetailsListModel _jobList = JobDetailsListModel();

  JobDetailsListModel get jobList => _jobList;

  Future<void> requestJobList({
    required String keyword,
    String datePosted = "all",
    bool remoteOnly = false,
  }) async {
    _inProgress = true;
    notifyListeners();

    try {
      final response = await Dio().get(
        Urls.getSearchUrl(
          keyword: keyword,
          remoteOnly: remoteOnly ? "true" : "false",
          datePosted: datePosted,
        ),
        options: Options(
          headers: SecretInfo.getHeader(),
        ),
      );

      _jobList = JobDetailsListModel.fromJson(await response.data);

      _inProgress = false;
      notifyListeners();
    } catch (e) {
      _inProgress = false;
      notifyListeners();
      rethrow;
    }
  }
}
