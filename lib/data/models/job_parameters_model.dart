class JobParametersModel {
  JobParametersModel({
    String? query,
    num? page,
    num? numPages,
  }) {
    _query = query;
    _page = page;
    _numPages = numPages;
  }

  JobParametersModel.fromJson(dynamic json) {
    _query = json['query'];
    _page = json['page'];
    _numPages = json['num_pages'];
  }

  String? _query;
  num? _page;
  num? _numPages;

  JobParametersModel copyWith({
    String? query,
    num? page,
    num? numPages,
  }) =>
      JobParametersModel(
        query: query ?? _query,
        page: page ?? _page,
        numPages: numPages ?? _numPages,
      );

  String? get query => _query;

  num? get page => _page;

  num? get numPages => _numPages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['query'] = _query;
    map['page'] = _page;
    map['num_pages'] = _numPages;
    return map;
  }
}
