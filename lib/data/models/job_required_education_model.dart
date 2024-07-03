class JobRequiredEducationModel {
  JobRequiredEducationModel({
    dynamic postgraduateDegree,
    dynamic professionalCertification,
    dynamic highSchool,
    dynamic associatesDegree,
    dynamic bachelorsDegree,
    dynamic degreeMentioned,
    dynamic degreePreferred,
    dynamic professionalCertificationMentioned,
  }) {
    _postgraduateDegree = postgraduateDegree;
    _professionalCertification = professionalCertification;
    _highSchool = highSchool;
    _associatesDegree = associatesDegree;
    _bachelorsDegree = bachelorsDegree;
    _degreeMentioned = degreeMentioned;
    _degreePreferred = degreePreferred;
    _professionalCertificationMentioned = professionalCertificationMentioned;
  }

  JobRequiredEducationModel.fromJson(dynamic json) {
    _postgraduateDegree = json['postgraduate_degree'];
    _professionalCertification = json['professional_certification'];
    _highSchool = json['high_school'];
    _associatesDegree = json['associates_degree'];
    _bachelorsDegree = json['bachelors_degree'];
    _degreeMentioned = json['degree_mentioned'];
    _degreePreferred = json['degree_preferred'];
    _professionalCertificationMentioned =
        json['professional_certification_mentioned'];
  }

  dynamic _postgraduateDegree;
  dynamic _professionalCertification;
  dynamic _highSchool;
  dynamic _associatesDegree;
  dynamic _bachelorsDegree;
  dynamic _degreeMentioned;
  dynamic _degreePreferred;
  dynamic _professionalCertificationMentioned;

  JobRequiredEducationModel copyWith({
    dynamic postgraduateDegree,
    dynamic professionalCertification,
    dynamic highSchool,
    dynamic associatesDegree,
    dynamic bachelorsDegree,
    dynamic degreeMentioned,
    dynamic degreePreferred,
    dynamic professionalCertificationMentioned,
  }) =>
      JobRequiredEducationModel(
        postgraduateDegree: postgraduateDegree ?? _postgraduateDegree,
        professionalCertification:
            professionalCertification ?? _professionalCertification,
        highSchool: highSchool ?? _highSchool,
        associatesDegree: associatesDegree ?? _associatesDegree,
        bachelorsDegree: bachelorsDegree ?? _bachelorsDegree,
        degreeMentioned: degreeMentioned ?? _degreeMentioned,
        degreePreferred: degreePreferred ?? _degreePreferred,
        professionalCertificationMentioned:
            professionalCertificationMentioned ??
                _professionalCertificationMentioned,
      );

  dynamic get postgraduateDegree => _postgraduateDegree;

  dynamic get professionalCertification => _professionalCertification;

  dynamic get highSchool => _highSchool;

  dynamic get associatesDegree => _associatesDegree;

  dynamic get bachelorsDegree => _bachelorsDegree;

  dynamic get degreeMentioned => _degreeMentioned;

  dynamic get degreePreferred => _degreePreferred;

  dynamic get professionalCertificationMentioned =>
      _professionalCertificationMentioned;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['postgraduate_degree'] = _postgraduateDegree;
    map['professional_certification'] = _professionalCertification;
    map['high_school'] = _highSchool;
    map['associates_degree'] = _associatesDegree;
    map['bachelors_degree'] = _bachelorsDegree;
    map['degree_mentioned'] = _degreeMentioned;
    map['degree_preferred'] = _degreePreferred;
    map['professional_certification_mentioned'] =
        _professionalCertificationMentioned;
    return map;
  }
}
