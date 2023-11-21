// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) => PostResponse(
      id: json['id'] as String,
      authorId: json['authorId'] as String,
      mountainName: json['mountainName'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      img: json['img'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      views: json['views'] as int,
      likes: json['likes'] as int,
      comments: json['comments'] as int,
      userModel: json['userModel'] == null
          ? null
          : UserModel.fromJson(json['userModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostResponseToJson(PostResponse instance) =>
    <String, dynamic>{
      'userModel': instance.userModel,
      'id': instance.id,
      'authorId': instance.authorId,
      'mountainName': instance.mountainName,
      'title': instance.title,
      'content': instance.content,
      'img': instance.img,
      'tags': instance.tags,
      'views': instance.views,
      'likes': instance.likes,
      'comments': instance.comments,
    };
