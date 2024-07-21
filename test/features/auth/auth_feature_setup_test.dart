import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_guide/app/app_injections.dart';
import 'package:tv_guide/features/auth/auth_feature_setup.dart';
import 'package:tv_guide/features/auth/data/local_data_source/auth_local_data_source.dart';
import 'package:tv_guide/features/auth/data/remote_data_source/auth_remote_data_source.dart';
import 'package:tv_guide/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tv_guide/features/auth/domain/repositories/auth_repository.dart';
import 'package:tv_guide/features/auth/domain/use_cases/authenticate_use_case.dart';
import 'package:tv_guide/features/auth/presentation/cubit/login_cubit.dart';
import 'package:tv_guide/features/auth/presentation/cubit/visibility_cubit.dart';

void main() {
  group('Auth Feature Setup Injection Tests', () {
    final injector = GetIt.I;

    setUpAll(() {
      AppInjections.setupInjections();
      AuthFeatureSetup.setupInjections();
    });

    test('Check if all instances where injected', () {
      final authLocalDataSource = injector.get<AuthLocalDataSource>();
      final authRemoteDataSource = injector.get<AuthRemoteDataSource>();
      final authRepository = injector.get<AuthRepository>();
      final authenticateUseCase = injector.get<AuthenticateUseCase>();
      final visibilityCubit = injector.get<VisibilityCubit>();
      final loginCubit = injector.get<LoginCubit>();

      expect(authLocalDataSource, isA<AuthLocalDataSource>());
      expect(authLocalDataSource, isA<AuthLocalDataSourceImpl>());
      expect(authRemoteDataSource, isA<AuthRemoteDataSource>());
      expect(authRemoteDataSource, isA<AuthRemoteDataSourceImpl>());
      expect(authRepository, isA<AuthRepository>());
      expect(authRepository, isA<AuthRepositoryImpl>());
      expect(authenticateUseCase, isA<AuthenticateUseCase>());
      expect(visibilityCubit, isA<VisibilityCubit>());
      expect(loginCubit, isA<LoginCubit>());
    });

    test('Check if the injections where disposed properly', () async {
      await AuthFeatureSetup.dispose();

      expect(injector.isRegistered<AuthLocalDataSource>(), isFalse);
      expect(injector.isRegistered<AuthRemoteDataSource>(), isFalse);
      expect(injector.isRegistered<AuthRepository>(), isFalse);
      expect(injector.isRegistered<AuthenticateUseCase>(), isFalse);
      expect(injector.isRegistered<VisibilityCubit>(), isFalse);
      expect(injector.isRegistered<LoginCubit>(), isFalse);
    });
  });
}
