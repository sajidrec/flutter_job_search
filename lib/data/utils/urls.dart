class Urls {
  static const String _baseUrl = "https://jsearch.p.rapidapi.com";

  static String getSearchUrl({
    required String keyword,
    String datePosted = "3days",
    String remoteOnly = "false",
    int pageNumber = 1,
    int numPages = 1,
  }) {
    return "$_baseUrl/search?query=$keyword&page=$pageNumber&num_pages=$numPages&date_posted=$datePosted&remote_jobs_only=$remoteOnly";
  }
}
