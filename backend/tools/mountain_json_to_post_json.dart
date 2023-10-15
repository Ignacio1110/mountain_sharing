import 'dart:convert';
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:posts_data_source/posts_data_source.dart';

part 'mountain_json_to_post_json.g.dart';

void main() {
  print('Hello, Dart!');
  final filePath =
      '/Users/ignacio/Documents/Ignacio/mountain_sharing/assets/mountains.json'; // Replace with the actual file path

  // Create a File object
  final file = File(filePath);

  // Check if the file exists
  if (!file.existsSync()) {
    print('File does not exist.');
    return;
  }

  try {
    // Read the contents of the file as a string
    final jsonStr = file.readAsStringSync();
    final jsonData = jsonDecode(jsonStr);
    // Print the contents
    print('File jsonData:\n$jsonData');
    final list = jsonData as List<dynamic>;
    final trailList =
        list.map((e) => Trail.fromJson(e as Map<String, dynamic>)).toList();
    print(trailList);
    List<PostModel> postList = trailList
        .map((e) => PostModel(
            id: e.TRAILID,
            authorId: '台灣山林網',
            mountainName: e.TR_POSITION ?? '',
            title: e.TR_CNAME ?? '',
            content: '''
${e.TR_MAIN_SYS ?? ''}
${e.GUIDE_CONTENT ?? '未提供步道訊息'}
步道長度：${e.TR_LENGTH}
${e.TR_ADMIN ?? ''}
        ''',
            img:
                'https://recreation.forest.gov.tw/Files/RT/index/${e.TRAILID}.jpg',
            tags: [
              if (e.TR_TOUR != null) e.TR_TOUR!,
              if (e.TR_PAVE != null) e.TR_PAVE!,
            ],
            views: 2,
            likes: 0,
            comments: 0))
        .toList();
    // Write the JSON data to a file
    const outputFilePath =
        '/Users/ignacio/Documents/Ignacio/mountain_sharing/assets/posts.json'; // Replace with the desired output file path
    final outputFile = File(outputFilePath);

    final jsonString = jsonEncode(postList);
    outputFile.writeAsStringSync(jsonString);
  } catch (e) {
    print('Error: $e');
  }
}

@JsonSerializable(nullable: true)
class Trail {
  final String TRAILID;
  final String? TR_CNAME;
  final String? TR_CLASS;
  final String? TR_MAIN_SYS;
  final String? TR_SUB_SYS;
  final String? TR_ADMIN;
  final String? TR_ADMIN_PHONE;
  final String? TR_POSITION;
  final String? GUIDE_CONTENT;
  final List<TrailEntrance?>? TR_ENTRANCE;
  final String? TR_LENGTH;
  final double? TR_LENGTH_NUM;
  final String? TR_ALT;
  final int? TR_ALT_LOW;
  final int? TR_permit_stop;
  final String? TR_PAVE;
  final String? TR_DIF_CLASS;
  final String? TR_TOUR;
  final String? TR_BEST_SEASON;
  final String? TR_SPECIAL;
  final int? CAR;
  final int? M_BUS;
  final int? L_BUS;
  final String? TR_HUT_NAME;
  final String? TR_permit;
  final String? URL;

  Trail(
      this.TRAILID,
      this.TR_CNAME,
      this.TR_CLASS,
      this.TR_MAIN_SYS,
      this.TR_SUB_SYS,
      this.TR_ADMIN,
      this.TR_ADMIN_PHONE,
      this.TR_POSITION,
      this.GUIDE_CONTENT,
      this.TR_ENTRANCE,
      this.TR_LENGTH,
      this.TR_LENGTH_NUM,
      this.TR_ALT,
      this.TR_ALT_LOW,
      this.TR_permit_stop,
      this.TR_PAVE,
      this.TR_DIF_CLASS,
      this.TR_TOUR,
      this.TR_BEST_SEASON,
      this.TR_SPECIAL,
      this.CAR,
      this.M_BUS,
      this.L_BUS,
      this.TR_HUT_NAME,
      this.TR_permit,
      this.URL);

  factory Trail.fromJson(Map<String, dynamic> json) => _$TrailFromJson(json);

  Map<String, dynamic> toJson() => _$TrailToJson(this);
}

@JsonSerializable(nullable: true)
class TrailEntrance {
  final double? height;
  final double? x;
  final double? y;
  final String? memo;

  TrailEntrance(this.height, this.x, this.y, this.memo);

  factory TrailEntrance.fromJson(Map<String, dynamic> json) =>
      _$TrailEntranceFromJson(json);

  Map<String, dynamic> toJson() => _$TrailEntranceToJson(this);
}
