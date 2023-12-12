import 'package:flutter_test/flutter_test.dart';
import 'package:mountain_sharing/app/core/utils.dart';

void main() {
  group('String containsTag', () {
    test('should return true if the string contains the tag', () {
      List<(String, List<String>)> testCases = [
        ('This is a text with a #tag.', ['#tag']),
        ('This is a text with a #中文.', ['#中文']),
        ('long text #12345678901234567890123.', ['#12345678901234567890']),
        ('This a #tag. #tag2 #中文1 #中文2', ['#tag', '#tag2', '#中文1', '#中文2']),
        ('This a #tag#tag2#中文1#中文2', ['#tag', '#tag2', '#中文1', '#中文2']),
      ];

      for (var testCase in testCases) {
        expect(parseTags(testCase.$1), testCase.$2);
      }
    });
  });
}
