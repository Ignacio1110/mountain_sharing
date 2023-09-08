import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'properties.g.dart';

/// {@template properties}
/// Properties description
/// {@endtemplate}
@JsonSerializable()
class Properties extends Equatable {
  /// {@macro properties}
  const Properties({ 
  required this.name,
  required this.type,
  });

    /// Creates a Properties from Json map
  factory Properties.fromJson(Map<String, dynamic> data) => _$PropertiesFromJson(data);

  /// A description for name
  final String name;

  /// A description for type
  final String type;

    /// Creates a copy of the current Properties with property changes
  Properties copyWith({ 
    String? name,
    String? type,
  }) {
    return Properties(
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }


    @override
  List<Object?> get props => [
        name,
        type,
      ];

    /// Creates a Json map from a Properties
  Map<String, dynamic> toJson() => _$PropertiesToJson(this);

    /// Creates a toString() override for Properties
  @override
  String toString() => 'Properties(name: $name, type: $type)';
}
