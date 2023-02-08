import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

/// {@template source}
/// Source description
/// {@endtemplate}
@JsonSerializable()
class Source extends Equatable {
  /// {@macro source}
  const Source({
    required this.id,
    required this.name,
  });

  /// Creates a Source from Json map
  factory Source.fromJson(Map<String, dynamic> data) => _$SourceFromJson(data);

  /// A description for id
  final String? id;

  /// A description for name
  final String? name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  /// Creates a copy of the current Source with property changes
  Source copyWith({
    String? id,
    String? name,
  }) {
    return Source(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  /// Creates a Json map from a Source
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
