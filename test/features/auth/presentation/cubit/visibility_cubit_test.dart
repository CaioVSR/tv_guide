import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_guide/features/auth/presentation/cubit/visibility_cubit.dart';

void main() {
  group('VisibilityCubit', () {
    late VisibilityCubit visibilityCubit;

    setUp(() {
      visibilityCubit = VisibilityCubit();
    });

    tearDown(() {
      visibilityCubit.close();
    });

    test('initial state is VisibilityInitial with obscurePassword true', () {
      expect(visibilityCubit.state, isA<VisibilityState>());
      expect(visibilityCubit.state.obscurePassword, isTrue);
    });

    blocTest<VisibilityCubit, VisibilityState>(
      'emits [VisibilityInitial] with obscurePassword false when toggleVisibility is called',
      build: () => visibilityCubit,
      act: (cubit) => cubit.toggleVisibility(),
      expect: () => [
        const VisibilityState(obscurePassword: false),
      ],
    );

    blocTest<VisibilityCubit, VisibilityState>(
      'emits [VisibilityInitial] with obscurePassword true when toggleVisibility is called again',
      build: () => visibilityCubit,
      seed: () => const VisibilityState(obscurePassword: false),
      act: (cubit) => cubit.toggleVisibility(),
      expect: () => [
        const VisibilityState(obscurePassword: true),
      ],
    );
  });
}
