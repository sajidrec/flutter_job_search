import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:job_search/data/models/job_card_model.dart';
import 'package:job_search/data/utils/urls.dart';
import 'package:job_search/secret/secret_info.dart';

class JobListProvider extends ChangeNotifier {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  final List<JobCardModel> _jobList = [];

  List<JobCardModel> get jobList => _jobList;

  Future<void> requestJobList({
    required String keyword,
  }) async {
    _jobList.clear();
    _inProgress = true;
    notifyListeners();
    try {
      final response = await Dio().get(
        Urls.getSearchUrl(
          keyword: keyword,
        ),
        options: Options(
          headers: SecretInfo.getHeader(),
        ),
      );

      for (int i = 0; i < (await response.data["data"].length ?? 0); i++) {
        _jobList.add(
          JobCardModel.fromJson(
            await response.data["data"][i],
          ),
        );
      }
      _inProgress = false;
      notifyListeners();
    } catch (e) {
      _inProgress = false;
      notifyListeners();
      rethrow;
    }
  }
}
