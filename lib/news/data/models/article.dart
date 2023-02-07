import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_test/news/data/models/source.dart';

part 'article.g.dart';

/// {@template article}
/// Article description
/// {@endtemplate}
@JsonSerializable()
class Article extends Equatable {
  /// {@macro article}
  const Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  /// Creates a Article from Json map
  factory Article.fromJson(Map<String, dynamic> data) =>
      _$ArticleFromJson(data);

  /// A description for source
  final Source source;

  /// A description for author
  final String? author;

  /// A description for title
  final String? title;

  /// A description for description
  final String? description;

  /// A description for articleUrl
  final String? url;

  /// A description for imageUrl
  final String? urlToImage;

  /// A description for pubDate
  final String? publishedAt;

  /// A description for content
  final String? content;

  /// Creates a copy of the current Article with property changes
  Article copyWith({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? articleUrl,
    String? imageUrl,
    String? pubDate,
    String? content,
  }) {
    return Article(
      source: source ?? this.source,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: articleUrl ?? url,
      urlToImage: imageUrl ?? urlToImage,
      publishedAt: pubDate ?? publishedAt,
      content: content ?? this.content,
    );
  }

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];

  /// Creates a Json map from a Article
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
