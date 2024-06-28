class JobRequiredEducationModel {
  JobRequiredEducationModel({
    bool? postgraduateDegree,
    bool? professionalCertification,
    bool? highSchool,
    bool? associatesDegree,
    bool? bachelorsDegree,
    bool? degreeMentioned,
    bool? degreePreferred,
    bool? professionalCertificationMentioned,
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

  bool? _postgraduateDegree;
  bool? _professionalCertification;
  bool? _highSchool;
  bool? _associatesDegree;
  bool? _bachelorsDegree;
  bool? _degreeMentioned;
  bool? _degreePreferred;
  bool? _professionalCertificationMentioned;

  JobRequiredEducationModel copyWith({
    bool? postgraduateDegree,
    bool? professionalCertification,
    bool? highSchool,
    bool? associatesDegree,
    bool? bachelorsDegree,
    bool? degreeMentioned,
    bool? degreePreferred,
    bool? professionalCertificationMentioned,
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

  bool? get postgraduateDegree => _postgraduateDegree;

  bool? get professionalCertification => _professionalCertification;

  bool? get highSchool => _highSchool;

  bool? get associatesDegree => _associatesDegree;

  bool? get bachelorsDegree => _bachelorsDegree;

  bool? get degreeMentioned => _degreeMentioned;

  bool? get degreePreferred => _degreePreferred;

  bool? get professionalCertificationMentioned =>
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
