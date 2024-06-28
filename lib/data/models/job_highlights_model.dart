class JobHighlightsModel {
  JobHighlightsModel({
    List<String>? qualifications,
    List<String>? responsibilities,
    List<String>? benefits,
  }) {
    _qualifications = qualifications;
    _responsibilities = responsibilities;
    _benefits = benefits;
  }

  JobHighlightsModel.fromJson(dynamic json) {
    _qualifications = json['Qualifications'] != null
        ? json['Qualifications'].cast<String>()
        : [];
    _responsibilities = json['Responsibilities'] != null
        ? json['Responsibilities'].cast<String>()
        : [];
    _benefits = json['Benefits'] != null ? json['Benefits'].cast<String>() : [];
  }

  List<String>? _qualifications;
  List<String>? _responsibilities;
  List<String>? _benefits;

  JobHighlightsModel copyWith({
    List<String>? qualifications,
    List<String>? responsibilities,
    List<String>? benefits,
  }) =>
      JobHighlightsModel(
        qualifications: qualifications ?? _qualifications,
        responsibilities: responsibilities ?? _responsibilities,
        benefits: benefits ?? _benefits,
      );

  List<String>? get qualifications => _qualifications;

  List<String>? get responsibilities => _responsibilities;

  List<String>? get benefits => _benefits;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Qualifications'] = _qualifications;
    map['Responsibilities'] = _responsibilities;
    map['Benefits'] = _benefits;
    return map;
  }
}
