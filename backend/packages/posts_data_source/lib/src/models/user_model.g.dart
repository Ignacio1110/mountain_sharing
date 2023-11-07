// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      createDate: epochToTime(json['createEpoch'] as int),
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'gender': _$GenderEnumMap[instance.gender]!,
      'avatarUrl': instance.avatarUrl,
      'createEpoch': timeToEpoch(instance.createDate),
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
