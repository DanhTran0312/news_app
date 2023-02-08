import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'web_view_state.dart';

class WebViewCubit extends Cubit<WebViewState> {
  WebViewCubit() : super(WebViewInitial()) {
    _webViewController = WebViewController()
      ..setJavaScriptMode(
        JavaScriptMode.unrestricted,
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) =>
              NavigationDecision.navigate,
          onPageStarted: _onPageStarted,
          onPageFinished: _onPageFinished,
          onWebResourceError: _onWebResourceError,
        ),
      );
  }

  late final WebViewController _webViewController;

  WebViewController get webViewController => _webViewController;

  void openUrl(String url) {
    try {
      emit(WebViewLoading(url: url));
      webViewController.loadRequest(
        Uri.parse(url),
      );
    } on Exception catch (e) {
      emit(WebViewError(error: e.toString()));
    }
  }

  void _onPageStarted(String url) {
    emit(WebViewLoading(url: url));
  }

  void _onPageFinished(String url) {
    emit(WebViewSuccess(url: url));
  }

  void _onWebResourceError(WebResourceError error) {
    emit(WebViewError(error: error.description));
  }
}
