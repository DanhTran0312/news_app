import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_test/news/data/models/models.dart';
import 'package:news_app_test/news/data/repositories/article_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit({
    required ArticleRepository newsRepository,
  })  : _newsRepository = newsRepository,
        super(const NewsInitial());

  final ArticleRepository _newsRepository;
  final RefreshController _refreshController = RefreshController();

  RefreshController get refreshController => _refreshController;

  Future<void> fetchNews() async {
    try {
      emit(const NewsLoading());
      final articles = await _newsRepository.fetchArticles();
      emit(NewsLoaded(articles));
      _refreshController.refreshCompleted();
    } on DioError catch (e) {
      emit(NewsError(error: e.error.toString()));
    }
  }
}
