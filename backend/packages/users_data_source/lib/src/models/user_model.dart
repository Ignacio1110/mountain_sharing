import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_model.g.dart';

enum Gender { male, female }

@immutable
@JsonSerializable()
class UserModel extends Equatable {

  /// 構造函式
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.createDate,
    this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  final String id;
  final String name;
  final String email;
  final Gender gender;
  final String? avatarUrl;
  @JsonKey(name: 'createEpoch', fromJson: epochToTime, toJson: timeToEpoch)
  final DateTime createDate;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [id, name, email];
}

DateTime epochToTime(int epoch) {
  return DateTime.fromMillisecondsSinceEpoch(epoch);
}

int timeToEpoch(DateTime dateTime) {
  return dateTime.millisecondsSinceEpoch;
}
