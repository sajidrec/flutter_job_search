/// employer_logo : ""
/// job_title : ""
/// job_publisher : ""
/// job_posted_at_timestamp : ""
library;

class JobCardModel {
  JobCardModel({
    String? employerLogo,
    String? jobTitle,
    String? jobPublisher,
    int? jobPostedAtTimestamp,
  }) {
    _employerLogo = employerLogo;
    _jobTitle = jobTitle;
    _jobPublisher = jobPublisher;
    _jobPostedAtTimestamp = jobPostedAtTimestamp;
  }

  JobCardModel.fromJson(dynamic json) {
    _employerLogo = json['employer_logo'];
    _jobTitle = json['job_title'];
    _jobPublisher = json['job_publisher'];
    _jobPostedAtTimestamp = json['job_posted_at_timestamp'];
  }

  String? _employerLogo;
  String? _jobTitle;
  String? _jobPublisher;
  int? _jobPostedAtTimestamp;

  JobCardModel copyWith({
    String? employerLogo,
    String? jobTitle,
    String? jobPublisher,
    int? jobPostedAtTimestamp,
  }) =>
      JobCardModel(
        employerLogo: employerLogo ?? _employerLogo,
        jobTitle: jobTitle ?? _jobTitle,
        jobPublisher: jobPublisher ?? _jobPublisher,
        jobPostedAtTimestamp: jobPostedAtTimestamp ?? _jobPostedAtTimestamp,
      );

  String? get employerLogo => _employerLogo;

  String? get jobTitle => _jobTitle;

  String? get jobPublisher => _jobPublisher;

  int? get jobPostedAtTimestamp => _jobPostedAtTimestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employer_logo'] = _employerLogo;
    map['job_title'] = _jobTitle;
    map['job_publisher'] = _jobPublisher;
    map['job_posted_at_timestamp'] = _jobPostedAtTimestamp;
    return map;
  }
}
