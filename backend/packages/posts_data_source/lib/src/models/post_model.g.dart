part of 'post_model.dart';

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: json['id'] as String,
      mountainName: json['mountainName'] as String?,
      authorId: json['authorId'] as String?,
      title: json['title'] as String,
      content: json['content'] as String,
      img: json['img'] as String,
      tags: json['tags'] as List<String>,
      views: json['views'] as int,
      likes: json['likes'] as int,
      comments: json['comments'] as int,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{ 
      'id': instance.id,
      'mountainName': instance.mountainName,
      'authorId': instance.authorId,
      'title': instance.title,
      'content': instance.content,
      'img': instance.img,
      'tags': instance.tags,
      'views': instance.views,
      'likes': instance.likes,
      'comments': instance.comments,
    };