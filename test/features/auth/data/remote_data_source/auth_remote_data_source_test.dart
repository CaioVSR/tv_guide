import 'package:flutter_test/flutter_test.dart';
import 'package:tv_guide/features/auth/data/remote_data_source/auth_remote_data_source.dart';

void main() {
  late AuthRemoteDataSourceImpl authRemoteDataSource;

  setUp(() {
    authRemoteDataSource = AuthRemoteDataSourceImpl();
  });

  group('AuthRemoteDataSourceImpl', () {
    test('authenticate should return UserCredentialsModel for valid credentials', () async {
      const email = 'admin@example.com';
      const password = 'admin';

      final result = await authRemoteDataSource.authenticate(email, password);

      expect(result, isNotNull);
      expect(result?.userName, 'admin');
      expect(result?.jwt, 'admin-admin@example.com');
      
    });

    test('authenticate should throw exception for invalid credentials', () async {
      const email = 'user@example.com';
      const password = 'wrongpassword';

      expect(
        () async => authRemoteDataSource.authenticate(email, password),
        throwsA(isA<Exception>().having((e) => e.toString(), 'description', contains('Invalid credentials'))),
      );
    });
  });
}
