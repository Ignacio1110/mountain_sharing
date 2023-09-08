part of 'properties.dart';

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      name: json['name'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) => <String, dynamic>{ 
      'name': instance.name,
      'type': instance.type,
    };