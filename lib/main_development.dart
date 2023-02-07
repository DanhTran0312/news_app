import 'package:dio/dio.dart';
import 'package:news_app_test/app/app.dart';
import 'package:news_app_test/bootstrap.dart';
import 'package:news_app_test/news/cubit/cubit.dart';
import 'package:news_app_test/news/data/repositories/article_repository.dart';

void main() {
  final dio = Dio();
  final newsRepository = ArticleRepository(dio: dio);
  final newsCubit = NewsCubit(newsRepository: newsRepository);
  final webViewCubit = WebViewCubit();
  bootstrap(
    () => App(
      newsCubit: newsCubit,
      webViewCubit: webViewCubit,
    ),
  );
}
