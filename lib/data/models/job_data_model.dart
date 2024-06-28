import 'package:job_search/data/models/job_highlights_model.dart';
import 'package:job_search/data/models/job_required_education_model.dart';
import 'package:job_search/data/models/job_required_experience_model.dart';

class JobDataModel {
  JobDataModel({
    String? employerName,
    String? employerLogo,
    dynamic employerWebsite,
    String? employerCompanyType,
    String? jobPublisher,
    String? jobId,
    String? jobEmploymentType,
    String? jobTitle,
    String? jobApplyLink,
    bool? jobApplyIsDirect,
    num? jobApplyQualityScore,
    String? jobDescription,
    bool? jobIsRemote,
    num? jobPostedAtTimestamp,
    String? jobPostedAtDatetimeUtc,
    String? jobCity,
    String? jobState,
    String? jobCountry,
    num? jobLatitude,
    num? jobLongitude,
    dynamic jobBenefits,
    String? jobGoogleLink,
    String? jobOfferExpirationDatetimeUtc,
    num? jobOfferExpirationTimestamp,
    JobRequiredExperienceModel? jobRequiredExperience,
    dynamic jobRequiredSkills,
    JobRequiredEducationModel? jobRequiredEducation,
    bool? jobExperienceInPlaceOfEducation,
    dynamic jobMinSalary,
    dynamic jobMaxSalary,
    dynamic jobSalaryCurrency,
    dynamic jobSalaryPeriod,
    JobHighlightsModel? jobHighlights,
    dynamic jobJobTitle,
    String? jobPostingLanguage,
    String? jobOnetSoc,
    String? jobOnetJobZone,
    String? jobNaicsCode,
    String? jobNaicsName,
  }) {
    _employerName = employerName;
    _employerLogo = employerLogo;
    _employerWebsite = employerWebsite;
    _employerCompanyType = employerCompanyType;
    _jobPublisher = jobPublisher;
    _jobId = jobId;
    _jobEmploymentType = jobEmploymentType;
    _jobTitle = jobTitle;
    _jobApplyLink = jobApplyLink;
    _jobApplyIsDirect = jobApplyIsDirect;
    _jobApplyQualityScore = jobApplyQualityScore;
    _jobDescription = jobDescription;
    _jobIsRemote = jobIsRemote;
    _jobPostedAtTimestamp = jobPostedAtTimestamp;
    _jobPostedAtDatetimeUtc = jobPostedAtDatetimeUtc;
    _jobCity = jobCity;
    _jobState = jobState;
    _jobCountry = jobCountry;
    _jobLatitude = jobLatitude;
    _jobLongitude = jobLongitude;
    _jobBenefits = jobBenefits;
    _jobGoogleLink = jobGoogleLink;
    _jobOfferExpirationDatetimeUtc = jobOfferExpirationDatetimeUtc;
    _jobOfferExpirationTimestamp = jobOfferExpirationTimestamp;
    _jobRequiredExperience = jobRequiredExperience;
    _jobRequiredSkills = jobRequiredSkills;
    _jobRequiredEducation = jobRequiredEducation;
    _jobExperienceInPlaceOfEducation = jobExperienceInPlaceOfEducation;
    _jobMinSalary = jobMinSalary;
    _jobMaxSalary = jobMaxSalary;
    _jobSalaryCurrency = jobSalaryCurrency;
    _jobSalaryPeriod = jobSalaryPeriod;
    _jobHighlights = jobHighlights;
    _jobJobTitle = jobJobTitle;
    _jobPostingLanguage = jobPostingLanguage;
    _jobOnetSoc = jobOnetSoc;
    _jobOnetJobZone = jobOnetJobZone;
    _jobNaicsCode = jobNaicsCode;
    _jobNaicsName = jobNaicsName;
  }

  JobDataModel.fromJson(dynamic json) {
    _employerName = json['employer_name'];
    _employerLogo = json['employer_logo'];
    _employerWebsite = json['employer_website'];
    _employerCompanyType = json['employer_company_type'];
    _jobPublisher = json['job_publisher'];
    _jobId = json['job_id'];
    _jobEmploymentType = json['job_employment_type'];
    _jobTitle = json['job_title'];
    _jobApplyLink = json['job_apply_link'];
    _jobApplyIsDirect = json['job_apply_is_direct'];
    _jobApplyQualityScore = json['job_apply_quality_score'];
    _jobDescription = json['job_description'];
    _jobIsRemote = json['job_is_remote'];
    _jobPostedAtTimestamp = json['job_posted_at_timestamp'];
    _jobPostedAtDatetimeUtc = json['job_posted_at_datetime_utc'];
    _jobCity = json['job_city'];
    _jobState = json['job_state'];
    _jobCountry = json['job_country'];
    _jobLatitude = json['job_latitude'];
    _jobLongitude = json['job_longitude'];
    _jobBenefits = json['job_benefits'];
    _jobGoogleLink = json['job_google_link'];
    _jobOfferExpirationDatetimeUtc = json['job_offer_expiration_datetime_utc'];
    _jobOfferExpirationTimestamp = json['job_offer_expiration_timestamp'];
    _jobRequiredExperience = json['job_required_experience'] != null
        ? JobRequiredExperienceModel.fromJson(json['job_required_experience'])
        : null;
    _jobRequiredSkills = json['job_required_skills'];
    _jobRequiredEducation = json['job_required_education'] != null
        ? JobRequiredEducationModel.fromJson(json['job_required_education'])
        : null;
    _jobExperienceInPlaceOfEducation =
        json['job_experience_in_place_of_education'];
    _jobMinSalary = json['job_min_salary'];
    _jobMaxSalary = json['job_max_salary'];
    _jobSalaryCurrency = json['job_salary_currency'];
    _jobSalaryPeriod = json['job_salary_period'];
    _jobHighlights = json['job_highlights'] != null
        ? JobHighlightsModel.fromJson(json['job_highlights'])
        : null;
    _jobJobTitle = json['job_job_title'];
    _jobPostingLanguage = json['job_posting_language'];
    _jobOnetSoc = json['job_onet_soc'];
    _jobOnetJobZone = json['job_onet_job_zone'];
    _jobNaicsCode = json['job_naics_code'];
    _jobNaicsName = json['job_naics_name'];
  }

  String? _employerName;
  String? _employerLogo;
  dynamic _employerWebsite;
  String? _employerCompanyType;
  String? _jobPublisher;
  String? _jobId;
  String? _jobEmploymentType;
  String? _jobTitle;
  String? _jobApplyLink;
  bool? _jobApplyIsDirect;
  num? _jobApplyQualityScore;
  String? _jobDescription;
  bool? _jobIsRemote;
  num? _jobPostedAtTimestamp;
  String? _jobPostedAtDatetimeUtc;
  String? _jobCity;
  String? _jobState;
  String? _jobCountry;
  num? _jobLatitude;
  num? _jobLongitude;
  dynamic _jobBenefits;
  String? _jobGoogleLink;
  String? _jobOfferExpirationDatetimeUtc;
  num? _jobOfferExpirationTimestamp;
  JobRequiredExperienceModel? _jobRequiredExperience;
  dynamic _jobRequiredSkills;
  JobRequiredEducationModel? _jobRequiredEducation;
  bool? _jobExperienceInPlaceOfEducation;
  dynamic _jobMinSalary;
  dynamic _jobMaxSalary;
  dynamic _jobSalaryCurrency;
  dynamic _jobSalaryPeriod;
  JobHighlightsModel? _jobHighlights;
  dynamic _jobJobTitle;
  String? _jobPostingLanguage;
  String? _jobOnetSoc;
  String? _jobOnetJobZone;
  String? _jobNaicsCode;
  String? _jobNaicsName;

  JobDataModel copyWith({
    String? employerName,
    String? employerLogo,
    dynamic employerWebsite,
    String? employerCompanyType,
    String? jobPublisher,
    String? jobId,
    String? jobEmploymentType,
    String? jobTitle,
    String? jobApplyLink,
    bool? jobApplyIsDirect,
    num? jobApplyQualityScore,
    String? jobDescription,
    bool? jobIsRemote,
    num? jobPostedAtTimestamp,
    String? jobPostedAtDatetimeUtc,
    String? jobCity,
    String? jobState,
    String? jobCountry,
    num? jobLatitude,
    num? jobLongitude,
    dynamic jobBenefits,
    String? jobGoogleLink,
    String? jobOfferExpirationDatetimeUtc,
    num? jobOfferExpirationTimestamp,
    JobRequiredExperienceModel? jobRequiredExperience,
    dynamic jobRequiredSkills,
    JobRequiredEducationModel? jobRequiredEducation,
    bool? jobExperienceInPlaceOfEducation,
    dynamic jobMinSalary,
    dynamic jobMaxSalary,
    dynamic jobSalaryCurrency,
    dynamic jobSalaryPeriod,
    JobHighlightsModel? jobHighlights,
    dynamic jobJobTitle,
    String? jobPostingLanguage,
    String? jobOnetSoc,
    String? jobOnetJobZone,
    String? jobNaicsCode,
    String? jobNaicsName,
  }) =>
      JobDataModel(
        employerName: employerName ?? _employerName,
        employerLogo: employerLogo ?? _employerLogo,
        employerWebsite: employerWebsite ?? _employerWebsite,
        employerCompanyType: employerCompanyType ?? _employerCompanyType,
        jobPublisher: jobPublisher ?? _jobPublisher,
        jobId: jobId ?? _jobId,
        jobEmploymentType: jobEmploymentType ?? _jobEmploymentType,
        jobTitle: jobTitle ?? _jobTitle,
        jobApplyLink: jobApplyLink ?? _jobApplyLink,
        jobApplyIsDirect: jobApplyIsDirect ?? _jobApplyIsDirect,
        jobApplyQualityScore: jobApplyQualityScore ?? _jobApplyQualityScore,
        jobDescription: jobDescription ?? _jobDescription,
        jobIsRemote: jobIsRemote ?? _jobIsRemote,
        jobPostedAtTimestamp: jobPostedAtTimestamp ?? _jobPostedAtTimestamp,
        jobPostedAtDatetimeUtc:
            jobPostedAtDatetimeUtc ?? _jobPostedAtDatetimeUtc,
        jobCity: jobCity ?? _jobCity,
        jobState: jobState ?? _jobState,
        jobCountry: jobCountry ?? _jobCountry,
        jobLatitude: jobLatitude ?? _jobLatitude,
        jobLongitude: jobLongitude ?? _jobLongitude,
        jobBenefits: jobBenefits ?? _jobBenefits,
        jobGoogleLink: jobGoogleLink ?? _jobGoogleLink,
        jobOfferExpirationDatetimeUtc:
            jobOfferExpirationDatetimeUtc ?? _jobOfferExpirationDatetimeUtc,
        jobOfferExpirationTimestamp:
            jobOfferExpirationTimestamp ?? _jobOfferExpirationTimestamp,
        jobRequiredExperience: jobRequiredExperience ?? _jobRequiredExperience,
        jobRequiredSkills: jobRequiredSkills ?? _jobRequiredSkills,
        jobRequiredEducation: jobRequiredEducation ?? _jobRequiredEducation,
        jobExperienceInPlaceOfEducation:
            jobExperienceInPlaceOfEducation ?? _jobExperienceInPlaceOfEducation,
        jobMinSalary: jobMinSalary ?? _jobMinSalary,
        jobMaxSalary: jobMaxSalary ?? _jobMaxSalary,
        jobSalaryCurrency: jobSalaryCurrency ?? _jobSalaryCurrency,
        jobSalaryPeriod: jobSalaryPeriod ?? _jobSalaryPeriod,
        jobHighlights: jobHighlights ?? _jobHighlights,
        jobJobTitle: jobJobTitle ?? _jobJobTitle,
        jobPostingLanguage: jobPostingLanguage ?? _jobPostingLanguage,
        jobOnetSoc: jobOnetSoc ?? _jobOnetSoc,
        jobOnetJobZone: jobOnetJobZone ?? _jobOnetJobZone,
        jobNaicsCode: jobNaicsCode ?? _jobNaicsCode,
        jobNaicsName: jobNaicsName ?? _jobNaicsName,
      );

  String? get employerName => _employerName;

  String? get employerLogo => _employerLogo;

  dynamic get employerWebsite => _employerWebsite;

  String? get employerCompanyType => _employerCompanyType;

  String? get jobPublisher => _jobPublisher;

  String? get jobId => _jobId;

  String? get jobEmploymentType => _jobEmploymentType;

  String? get jobTitle => _jobTitle;

  String? get jobApplyLink => _jobApplyLink;

  bool? get jobApplyIsDirect => _jobApplyIsDirect;

  num? get jobApplyQualityScore => _jobApplyQualityScore;

  String? get jobDescription => _jobDescription;

  bool? get jobIsRemote => _jobIsRemote;

  num? get jobPostedAtTimestamp => _jobPostedAtTimestamp;

  String? get jobPostedAtDatetimeUtc => _jobPostedAtDatetimeUtc;

  String? get jobCity => _jobCity;

  String? get jobState => _jobState;

  String? get jobCountry => _jobCountry;

  num? get jobLatitude => _jobLatitude;

  num? get jobLongitude => _jobLongitude;

  dynamic get jobBenefits => _jobBenefits;

  String? get jobGoogleLink => _jobGoogleLink;

  String? get jobOfferExpirationDatetimeUtc => _jobOfferExpirationDatetimeUtc;

  num? get jobOfferExpirationTimestamp => _jobOfferExpirationTimestamp;

  JobRequiredExperienceModel? get jobRequiredExperience =>
      _jobRequiredExperience;

  dynamic get jobRequiredSkills => _jobRequiredSkills;

  JobRequiredEducationModel? get jobRequiredEducation => _jobRequiredEducation;

  bool? get jobExperienceInPlaceOfEducation => _jobExperienceInPlaceOfEducation;

  dynamic get jobMinSalary => _jobMinSalary;

  dynamic get jobMaxSalary => _jobMaxSalary;

  dynamic get jobSalaryCurrency => _jobSalaryCurrency;

  dynamic get jobSalaryPeriod => _jobSalaryPeriod;

  JobHighlightsModel? get jobHighlights => _jobHighlights;

  dynamic get jobJobTitle => _jobJobTitle;

  String? get jobPostingLanguage => _jobPostingLanguage;

  String? get jobOnetSoc => _jobOnetSoc;

  String? get jobOnetJobZone => _jobOnetJobZone;

  String? get jobNaicsCode => _jobNaicsCode;

  String? get jobNaicsName => _jobNaicsName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employer_name'] = _employerName;
    map['employer_logo'] = _employerLogo;
    map['employer_website'] = _employerWebsite;
    map['employer_company_type'] = _employerCompanyType;
    map['job_publisher'] = _jobPublisher;
    map['job_id'] = _jobId;
    map['job_employment_type'] = _jobEmploymentType;
    map['job_title'] = _jobTitle;
    map['job_apply_link'] = _jobApplyLink;
    map['job_apply_is_direct'] = _jobApplyIsDirect;
    map['job_apply_quality_score'] = _jobApplyQualityScore;
    map['job_description'] = _jobDescription;
    map['job_is_remote'] = _jobIsRemote;
    map['job_posted_at_timestamp'] = _jobPostedAtTimestamp;
    map['job_posted_at_datetime_utc'] = _jobPostedAtDatetimeUtc;
    map['job_city'] = _jobCity;
    map['job_state'] = _jobState;
    map['job_country'] = _jobCountry;
    map['job_latitude'] = _jobLatitude;
    map['job_longitude'] = _jobLongitude;
    map['job_benefits'] = _jobBenefits;
    map['job_google_link'] = _jobGoogleLink;
    map['job_offer_expiration_datetime_utc'] = _jobOfferExpirationDatetimeUtc;
    map['job_offer_expiration_timestamp'] = _jobOfferExpirationTimestamp;
    if (_jobRequiredExperience != null) {
      map['job_required_experience'] = _jobRequiredExperience?.toJson();
    }
    map['job_required_skills'] = _jobRequiredSkills;
    if (_jobRequiredEducation != null) {
      map['job_required_education'] = _jobRequiredEducation?.toJson();
    }
    map['job_experience_in_place_of_education'] =
        _jobExperienceInPlaceOfEducation;
    map['job_min_salary'] = _jobMinSalary;
    map['job_max_salary'] = _jobMaxSalary;
    map['job_salary_currency'] = _jobSalaryCurrency;
    map['job_salary_period'] = _jobSalaryPeriod;
    if (_jobHighlights != null) {
      map['job_highlights'] = _jobHighlights?.toJson();
    }
    map['job_job_title'] = _jobJobTitle;
    map['job_posting_language'] = _jobPostingLanguage;
    map['job_onet_soc'] = _jobOnetSoc;
    map['job_onet_job_zone'] = _jobOnetJobZone;
    map['job_naics_code'] = _jobNaicsCode;
    map['job_naics_name'] = _jobNaicsName;
    return map;
  }
}
