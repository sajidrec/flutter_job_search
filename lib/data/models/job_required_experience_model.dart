class JobRequiredExperienceModel {
  JobRequiredExperienceModel({
    String? noExperienceRequired,
    dynamic requiredExperienceInMonths,
    String? experienceMentioned,
    String? experiencePreferred,
  }) {
    _noExperienceRequired = noExperienceRequired;
    _requiredExperienceInMonths = requiredExperienceInMonths;
    _experienceMentioned = experienceMentioned;
    _experiencePreferred = experiencePreferred;
  }

  JobRequiredExperienceModel.fromJson(dynamic json) {
    _noExperienceRequired = json['no_experience_required'];
    _requiredExperienceInMonths = json['required_experience_in_months'];
    _experienceMentioned = json['experience_mentioned'];
    _experiencePreferred = json['experience_preferred'];
  }

  String? _noExperienceRequired;
  dynamic _requiredExperienceInMonths;
  String? _experienceMentioned;
  String? _experiencePreferred;

  JobRequiredExperienceModel copyWith({
    String? noExperienceRequired,
    dynamic requiredExperienceInMonths,
    String? experienceMentioned,
    String? experiencePreferred,
  }) =>
      JobRequiredExperienceModel(
        noExperienceRequired: noExperienceRequired ?? _noExperienceRequired,
        requiredExperienceInMonths:
            requiredExperienceInMonths ?? _requiredExperienceInMonths,
        experienceMentioned: experienceMentioned ?? _experienceMentioned,
        experiencePreferred: experiencePreferred ?? _experiencePreferred,
      );

  String? get noExperienceRequired => _noExperienceRequired;

  dynamic get requiredExperienceInMonths => _requiredExperienceInMonths;

  String? get experienceMentioned => _experienceMentioned;

  String? get experiencePreferred => _experiencePreferred;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['no_experience_required'] = _noExperienceRequired;
    map['required_experience_in_months'] = _requiredExperienceInMonths;
    map['experience_mentioned'] = _experienceMentioned;
    map['experience_preferred'] = _experiencePreferred;
    return map;
  }
}
