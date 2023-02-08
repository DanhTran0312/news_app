import 'package:dio/dio.dart';
import 'package:news_app_test/news/data/models/models.dart';

class ArticleRepository {
  ArticleRepository({
    required Dio dio,
  }) : _dio = dio;

  // TODO: Update this with your own API key
  static const String _apiKey = 'YOUR_API_KEY_HERE';

  // Change the country code to get news from different countries (e.g. 'us')
  static const String _baseUrl =
      'https://newsapi.org/v2/top-headlines?country=us&pageSize=100&apiKey=';

  final Dio _dio;

  Future<Response<Map<dynamic, dynamic>>> fetchResponse() async {
    try {
      final response = await _dio.get<Map<dynamic, dynamic>>(
        '$_baseUrl$_apiKey',
      );
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<List<Article>> fetchArticles() async {
    try {
      final response = await fetchResponse();
      final articles = response.data!['articles'] as List<dynamic>;
      return articles
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioError {
      rethrow;
    }
  }
}
