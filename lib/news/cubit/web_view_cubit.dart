import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'web_view_state.dart';

class WebViewCubit extends Cubit<WebViewState> {
  WebViewCubit() : super(WebViewInitial());

  final WebViewController _webViewController = WebViewController()
    ..setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) =>
            NavigationDecision.navigate,
      ),
    );

  WebViewController get webViewController => _webViewController;

  void openUrl(String url) {
    try {
      webViewController.loadRequest(
        Uri.parse(url),
      );
      emit(WebViewSuccess(url: url));
    } on Exception catch (e) {
      emit(WebViewError(error: e.toString()));
    }
  }
}
