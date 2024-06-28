import 'package:job_search/data/models/job_data_model.dart';
import 'package:job_search/data/models/job_parameters_model.dart';

class JobDetailsListModel {
  JobDetailsListModel({
    String? status,
    String? requestId,
    JobParametersModel? parameters,
    List<JobDataModel>? data,
  }) {
    _status = status;
    _requestId = requestId;
    _parameters = parameters;
    _data = data;
  }

  JobDetailsListModel.fromJson(dynamic json) {
    _status = json['status'];
    _requestId = json['request_id'];
    _parameters = json['parameters'] != null
        ? JobParametersModel.fromJson(json['parameters'])
        : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(JobDataModel.fromJson(v));
      });
    }
  }

  String? _status;
  String? _requestId;
  JobParametersModel? _parameters;
  List<JobDataModel>? _data;

  JobDetailsListModel copyWith({
    String? status,
    String? requestId,
    JobParametersModel? parameters,
    List<JobDataModel>? data,
  }) =>
      JobDetailsListModel(
        status: status ?? _status,
        requestId: requestId ?? _requestId,
        parameters: parameters ?? _parameters,
        data: data ?? _data,
      );

  String? get status => _status;

  String? get requestId => _requestId;

  JobParametersModel? get parameters => _parameters;

  List<JobDataModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['request_id'] = _requestId;
    if (_parameters != null) {
      map['parameters'] = _parameters?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
