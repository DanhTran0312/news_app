import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_test/news/cubit/cubit.dart';
import 'package:news_app_test/news/widgets/news_body.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// {@template news_page}
/// A description for NewsPage
/// {@endtemplate}
class NewsPage extends StatelessWidget {
  /// {@macro news_page}
  const NewsPage({
    super.key,
    required NewsCubit newsCubit,
    required WebViewCubit webViewCubit,
  })  : _newsCubit = newsCubit,
        _webViewCubit = webViewCubit;

  final NewsCubit _newsCubit;
  final WebViewCubit _webViewCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _newsCubit..fetchNews(),
        ),
        BlocProvider(
          create: (context) => _webViewCubit,
        ),
      ],
      child: Scaffold(
        body: SmartRefresher(
          header: const MaterialClassicHeader(),
          controller: _newsCubit.refreshController,
          onRefresh: _newsCubit.fetchNews,
          child: const NewsView(),
        ),
      ),
    );
  }
}

/// {@template news_view}
/// Displays the Body of NewsView
/// {@endtemplate}
class NewsView extends StatelessWidget {
  /// {@macro news_view}
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NewsBody();
  }
}
