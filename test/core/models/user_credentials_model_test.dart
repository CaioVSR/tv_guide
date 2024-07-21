import 'package:flutter_test/flutter_test.dart';
import 'package:tv_guide/core/models/user_credentials_model.dart';

void main() {
  group('UserCredentialsModel', () {
    test('fromJson should return a valid model', () {
      final json = {
        'user_name': 'John Doe',
        'jwt': 'some-jwt-token',
      };

      final model = UserCredentialsModel.fromJson(json);

      expect(model.userName, 'John Doe');
      expect(model.jwt, 'some-jwt-token');

      expect(model.userName, isA<String>());
      expect(model.jwt, isA<String>());
    });

    test('toJson should return a valid map', () {
      final json = UserCredentialsModel(
        userName: 'John Doe',
        jwt: 'some-jwt-token',
      ).toJson();

      expect(json['user_name'], 'John Doe');
      expect(json['jwt'], 'some-jwt-token');
    });
  });
}
