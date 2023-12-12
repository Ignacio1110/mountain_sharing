import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'post_model.g.dart';

/// {@template post_model}
/// PostModel description
/// {@endtemplate}
@immutable
@JsonSerializable()
class PostModel extends Equatable {
  /// {@macro post_model}
  const PostModel({
    required this.id,
    required this.authorId,
    required this.mountainName,
    required this.title,
    required this.content,
    required this.img,
    required this.tags,
    required this.views,
    required this.likes,
    required this.comments,
  });

  /// Creates a PostModel from Json map
  factory PostModel.fromJson(Map<String, dynamic> data) =>
      _$PostModelFromJson(data);

  /// A description for id
  final String id;

  /// A description for authorId
  final String authorId;

  /// A description for mountainName
  final String mountainName;

  /// A description for title
  final String title;

  /// A description for content
  final String content;

  /// A description for img
  final String img;

  /// A description for tags
  final List<String> tags;

  /// A description for views
  final int views;

  /// A description for likes
  final int likes;

  /// A description for comments
  final int comments;

  /// Creates a copy of the current PostModel with property changes
  PostModel copyWith({
    String? id,
    String? authorId,
    String? mountainName,
    String? title,
    String? content,
    String? img,
    List<String>? tags,
    int? views,
    int? likes,
    int? comments,
  }) {
    return PostModel(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      mountainName: mountainName ?? this.mountainName,
      title: title ?? this.title,
      content: content ?? this.content,
      img: img ?? this.img,
      tags: tags ?? this.tags,
      views: views ?? this.views,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
    );
  }

  @override
  List<Object?> get props => [
        id,
        authorId,
        mountainName,
        title,
        content,
        img,
        tags,
        views,
        likes,
        comments,
      ];

  /// Creates a Json map from a PostModel
  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  /// Creates a toString() override for PostModel
  @override
  String toString() =>
      'PostModel(id: $id, authorId: $authorId, mountainName: $mountainName, title: $title, content: $content, img: $img, tags: $tags, views: $views, likes: $likes, comments: $comments)';
}
