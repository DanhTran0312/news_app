import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app_test/news/cubit/cubit.dart';
import 'package:news_app_test/news/widgets/article_tile.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// {@template news_body}
/// Body of the NewsPage.
///
/// Add what it does
/// {@endtemplate}
class NewsBody extends StatelessWidget {
  /// {@macro news_body}
  const NewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        if (state is NewsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is NewsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsLoaded) {
          return Stack(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const Divider(
                  height: 0,
                ),
                shrinkWrap: true,
                itemCount: state.articles!.length,
                itemBuilder: (context, index) {
                  return ArticleTile(
                    article: state.articles![index],
                  );
                },
              ),
              WebViewWidget(
                controller: context.read<WebViewCubit>().webViewController,
              ),
            ],
          );
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }
}
