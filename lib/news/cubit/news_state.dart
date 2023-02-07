part of 'news_cubit.dart';

/// {@template news}
/// NewsState description
/// {@endtemplate}
class NewsState extends Equatable {
  /// {@macro news}
  const NewsState({
    required this.articles,
  });

  /// A description for customProperty
  final List<Article>? articles;

  @override
  List<Object> get props => [articles!];

  /// Creates a copy of the current NewsState with property changes
  NewsState copyWith({
    List<Article>? newArticles,
  }) {
    return NewsState(
      articles: newArticles ?? articles,
    );
  }
}

/// {@template news_initial}
/// The initial state of NewsState
/// {@endtemplate}
class NewsInitial extends NewsState {
  /// {@macro news_initial}
  const NewsInitial()
      : super(
          articles: null,
        );

  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {
  const NewsLoading()
      : super(
          articles: null,
        );

  @override
  List<Object> get props => [];
}

class NewsLoaded extends NewsState {
  const NewsLoaded(
    List<Article>? articles,
  ) : super(
          articles: articles,
        );

  @override
  List<Object> get props => [articles!];
}

class NewsError extends NewsState {
  const NewsError({
    this.error,
  }) : super(
          articles: null,
        );

  final String? error;

  @override
  List<Object> get props => [articles!, error!];
}
