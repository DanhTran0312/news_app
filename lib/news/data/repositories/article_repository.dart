import 'package:dio/dio.dart';
import 'package:news_app_test/news/data/models/models.dart';

class ArticleRepository {
  ArticleRepository({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  static const String _baseUrl =
      'https://newsapi.org/v2/top-headlines?country=us&pageSize=100&apiKey=';
  static const String _apiKey = '9d943a4235514e63ac9646538608618f';

  Future<Response<Map<dynamic, dynamic>>> getResponse() async {
    try {
      final response = await _dio.get<Map<dynamic, dynamic>>(
        '$_baseUrl$_apiKey',
      );
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<List<Article>> getArticles() async {
    try {
      final response = await getResponse();
      final articles = response.data!['articles'] as List<dynamic>;
      return articles
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioError {
      rethrow;
    }
  }
}
