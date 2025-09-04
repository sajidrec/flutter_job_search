class JobRequiredExperienceModel {
  JobRequiredExperienceModel({
    dynamic noExperienceRequired,
    dynamic requiredExperienceInMonths,
    dynamic experienceMentioned,
    dynamic experiencePreferred,
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

  dynamic _noExperienceRequired;
  dynamic _requiredExperienceInMonths;
  dynamic _experienceMentioned;
  dynamic _experiencePreferred;

  JobRequiredExperienceModel copyWith({
    dynamic noExperienceRequired,
    dynamic requiredExperienceInMonths,
    dynamic experienceMentioned,
    dynamic experiencePreferred,
  }) =>
      JobRequiredExperienceModel(
        noExperienceRequired: noExperienceRequired ?? _noExperienceRequired,
        requiredExperienceInMonths:
            requiredExperienceInMonths ?? _requiredExperienceInMonths,
        experienceMentioned: experienceMentioned ?? _experienceMentioned,
        experiencePreferred: experiencePreferred ?? _experiencePreferred,
      );

  dynamic get noExperienceRequired => _noExperienceRequired;

  dynamic get requiredExperienceInMonths => _requiredExperienceInMonths;

  dynamic get experienceMentioned => _experienceMentioned;

  dynamic get experiencePreferred => _experiencePreferred;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['no_experience_required'] = _noExperienceRequired;
    map['required_experience_in_months'] = _requiredExperienceInMonths;
    map['experience_mentioned'] = _experienceMentioned;
    map['experience_preferred'] = _experiencePreferred;
    return map;
  }
}
