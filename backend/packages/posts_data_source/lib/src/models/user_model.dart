import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

enum Gender { male, female }

@JsonSerializable()
class User {
  int id;
  String name;
  String email;
  Gender gender;
  String? avatarUrl;
  @JsonKey(name: 'createEpoch', fromJson: epochToTime, toJson: timeToEpoch)
  DateTime createDate;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.createDate,
    this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

DateTime epochToTime(int epoch) {
  return DateTime.fromMillisecondsSinceEpoch(epoch);
}

int timeToEpoch(DateTime dateTime) {
  return dateTime.millisecondsSinceEpoch;
}
