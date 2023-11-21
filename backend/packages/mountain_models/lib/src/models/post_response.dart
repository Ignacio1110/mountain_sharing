import 'package:json_annotation/json_annotation.dart';
import 'package:users_data_source/users_data_source.dart';

part 'post_response.g.dart';

@JsonSerializable()
class PostResponse {
  /// {@macro post_model}
  PostResponse({
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
    this.userModel,
  });

  /// Creates a PostModel from Json map
  factory PostResponse.fromJson(Map<String, dynamic> data) =>
      _$PostResponseFromJson(data);

  /// to Json map
  Map<String, dynamic> toJson() => _$PostResponseToJson(this);

  UserModel? userModel;

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
}
