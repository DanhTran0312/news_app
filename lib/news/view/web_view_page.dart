import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_test/news/cubit/web_view_cubit.dart';
import 'package:news_app_test/news/widgets/web_view_body.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({
    super.key,
    required WebViewCubit webViewCubit,
  }) : _webViewCubit = webViewCubit;

  final WebViewCubit _webViewCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),
      ),
      body: BlocProvider(
        create: (context) => _webViewCubit,
        child: WebView(
          webViewCubit: _webViewCubit,
        ),
      ),
    );
  }
}

class WebView extends StatelessWidget {
  const WebView({super.key, required WebViewCubit webViewCubit})
      : _webViewCubit = webViewCubit;

  final WebViewCubit _webViewCubit;

  @override
  Widget build(BuildContext context) {
    return WebViewBody(
      webViewCubit: _webViewCubit,
    );
  }
}
