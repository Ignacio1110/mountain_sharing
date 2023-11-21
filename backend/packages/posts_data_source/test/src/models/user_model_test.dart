import '../../../../users_data_source/lib/src/models/user_model.dart';
import 'package:test/test.dart';

void main() {
  group('User Tests', () {
    test('User.fromJson() should correctly parse JSON', () {
      final json = {
        'id': '1',
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'gender': 'male',
        'avatarUrl': null,
        'createEpoch': 1699365512000,
      };

      final user = UserModel.fromJson(json);

      expect(user.id, '1');
      expect(user.name, 'John Doe');
      expect(user.email, 'johndoe@example.com');
      expect(user.gender, Gender.male);
      expect(user.avatarUrl, isNull);
      expect(
          user.createDate, DateTime.fromMillisecondsSinceEpoch(1699365512000));
    });

    test('User.toJson() should correctly convert to JSON', () {
      final now = DateTime.now();
      final user = UserModel(
        id: '2',
        name: 'Jane Smith',
        email: 'janesmith@example.com',
        gender: Gender.female,
        createDate: now,
      );

      final json = user.toJson();

      expect(json['id'], '2');
      expect(json['name'], 'Jane Smith');
      expect(json['email'], 'janesmith@example.com');
      expect(json['gender'], 'female');
      expect(json['avatarUrl'], isNull);
      expect(json['createEpoch'], now.millisecondsSinceEpoch);
    });

    test('User.fromJson() should handle gender "other" correctly', () {
      final json = {
        'id': '3',
        'name': 'Alex',
        'email': 'alex@example.com',
        'gender': 'other',
        'avatarUrl': null,
      };

      expect(() => UserModel.fromJson(json), throwsArgumentError);
    });
  });
}
