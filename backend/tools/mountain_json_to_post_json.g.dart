// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mountain_json_to_post_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trail _$TrailFromJson(Map<String, dynamic> json) => Trail(
      json['TRAILID'] as String,
      json['TR_CNAME'] as String?,
      json['TR_CLASS'] as String?,
      json['TR_MAIN_SYS'] as String?,
      json['TR_SUB_SYS'] as String?,
      json['TR_ADMIN'] as String?,
      json['TR_ADMIN_PHONE'] as String?,
      json['TR_POSITION'] as String?,
      json['GUIDE_CONTENT'] as String?,
      (json['TR_ENTRANCE'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : TrailEntrance.fromJson(e as Map<String, dynamic>),)
          .toList(),
      json['TR_LENGTH'] as String?,
      (json['TR_LENGTH_NUM'] as num?)?.toDouble(),
      json['TR_ALT'] as String?,
      json['TR_ALT_LOW'] as int?,
      json['TR_permit_stop'] as int?,
      json['TR_PAVE'] as String?,
      json['TR_DIF_CLASS'] as String?,
      json['TR_TOUR'] as String?,
      json['TR_BEST_SEASON'] as String?,
      json['TR_SPECIAL'] as String?,
      json['CAR'] as int?,
      json['M_BUS'] as int?,
      json['L_BUS'] as int?,
      json['TR_HUT_NAME'] as String?,
      json['TR_permit'] as String?,
      json['URL'] as String?,
    );

Map<String, dynamic> _$TrailToJson(Trail instance) => <String, dynamic>{
      'TRAILID': instance.TRAILID,
      'TR_CNAME': instance.TR_CNAME,
      'TR_CLASS': instance.TR_CLASS,
      'TR_MAIN_SYS': instance.TR_MAIN_SYS,
      'TR_SUB_SYS': instance.TR_SUB_SYS,
      'TR_ADMIN': instance.TR_ADMIN,
      'TR_ADMIN_PHONE': instance.TR_ADMIN_PHONE,
      'TR_POSITION': instance.TR_POSITION,
      'GUIDE_CONTENT': instance.GUIDE_CONTENT,
      'TR_ENTRANCE': instance.TR_ENTRANCE,
      'TR_LENGTH': instance.TR_LENGTH,
      'TR_LENGTH_NUM': instance.TR_LENGTH_NUM,
      'TR_ALT': instance.TR_ALT,
      'TR_ALT_LOW': instance.TR_ALT_LOW,
      'TR_permit_stop': instance.TR_permit_stop,
      'TR_PAVE': instance.TR_PAVE,
      'TR_DIF_CLASS': instance.TR_DIF_CLASS,
      'TR_TOUR': instance.TR_TOUR,
      'TR_BEST_SEASON': instance.TR_BEST_SEASON,
      'TR_SPECIAL': instance.TR_SPECIAL,
      'CAR': instance.CAR,
      'M_BUS': instance.M_BUS,
      'L_BUS': instance.L_BUS,
      'TR_HUT_NAME': instance.TR_HUT_NAME,
      'TR_permit': instance.TR_permit,
      'URL': instance.URL,
    };

TrailEntrance _$TrailEntranceFromJson(Map<String, dynamic> json) =>
    TrailEntrance(
      (json['height'] as num?)?.toDouble(),
      (json['x'] as num?)?.toDouble(),
      (json['y'] as num?)?.toDouble(),
      json['memo'] as String?,
    );

Map<String, dynamic> _$TrailEntranceToJson(TrailEntrance instance) =>
    <String, dynamic>{
      'height': instance.height,
      'x': instance.x,
      'y': instance.y,
      'memo': instance.memo,
    };
