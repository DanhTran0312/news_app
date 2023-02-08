import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_test/news/cubit/web_view_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewBody extends StatelessWidget {
  const WebViewBody({super.key, required WebViewCubit webViewCubit})
      : _webViewCubit = webViewCubit;

  final WebViewCubit _webViewCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WebViewCubit, WebViewState>(
      bloc: _webViewCubit,
      builder: (context, state) {
        if (state is WebViewInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WebViewLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WebViewSuccess) {
          return WebViewWidget(
            controller: _webViewCubit.webViewController,
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
