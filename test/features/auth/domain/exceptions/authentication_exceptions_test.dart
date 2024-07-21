import 'package:flutter_test/flutter_test.dart';
import 'package:tv_guide/features/auth/domain/exceptions/authentication_exceptions.dart';

void main() {
  group('InvalidCredentialsException', () {
    test('should create InvalidCredentialsException with a message', () {
      const message = 'Invalid credentials';
      final exception = InvalidCredentialsException(message);

      expect(exception.message, message);
    });

    test('should create InvalidCredentialsException without a message', () {
      final exception = InvalidCredentialsException();

      expect(exception.message, isNull);
    });
  });

  group('GenericAuthenticationException', () {
    test('should create GenericAuthenticationException with a message', () {
      const message = 'Generic authentication error';
      final exception = GenericAuthenticationException(message);

      expect(exception.message, message);
    });

    test('should create GenericAuthenticationException without a message', () {
      final exception = GenericAuthenticationException();

      expect(exception.message, isNull);
    });
  });
}
