part of 'web_view_cubit.dart';

abstract class WebViewState extends Equatable {
  const WebViewState();

  @override
  List<Object> get props => [];
}

class WebViewInitial extends WebViewState {}

class WebViewLoading extends WebViewState {
  const WebViewLoading({required this.url});

  final String url;

  @override
  List<Object> get props => [url];
}

class WebViewSuccess extends WebViewState {
  const WebViewSuccess({required this.url});

  final String url;

  @override
  List<Object> get props => [url];
}

class WebViewError extends WebViewState {
  const WebViewError({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}
