// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:tv_guide/app/app_route_manager.dart';
import 'package:tv_guide/core/theme/app_colors.dart';
import 'package:tv_guide/core/theme/app_images_paths.dart';
import 'package:tv_guide/core/utils/fields_validator.dart';
import 'package:tv_guide/core/widgets/bottom_sheet_primary_button.dart';
import 'package:tv_guide/core/widgets/custom_scaffold.dart';
import 'package:tv_guide/features/auth/presentation/cubit/login_cubit.dart';
import 'package:tv_guide/features/auth/presentation/cubit/visibility_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginCubit = GetIt.I.get<LoginCubit>();
  final visibilityCubit = GetIt.I.get<VisibilityCubit>();
  final formKey = GlobalKey<FormState>();
  final overlayController = OverlayPortalController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    loginCubit.close();
    visibilityCubit.close();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      bloc: loginCubit,
      listener: (context, state) {
        if (state is LoginAuthenticationInProgress) {
          overlayController.show();
        } else if (overlayController.isShowing) {
          overlayController.hide();
        }

        if (state is LoginAuthenticationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message.toString(),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              backgroundColor: AppColors.error,
            ),
          );
        }

        if (state is LoginAuthenticationSucess) {
          context.goToHome();
        }
      },
      child: CustomScaffold(
        overlayPortalController: overlayController,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Hero(
                    tag: AppImagePaths.logoFull,
                    child: Image.asset(
                      AppImagePaths.logoTransparentBg,
                      height: 148,
                    ),
                  ),
                ),
                Text(
                  'Welcome to your TV Guide!',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColors.textSecondary, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter your email and password to access your account.',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: emailController,
                  style: const TextStyle(color: AppColors.textPrimary),
                  keyboardType: TextInputType.emailAddress,
                  validator: FieldsValidators.emailValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    suffixIcon: Icon(HeroiconsOutline.envelope),
                  ),
                ),
                const SizedBox(height: 16),
                BlocBuilder<VisibilityCubit, VisibilityState>(
                  bloc: visibilityCubit,
                  builder: (context, state) {
                    return TextFormField(
                      controller: passwordController,
                      style: const TextStyle(color: AppColors.textPrimary),
                      obscureText: state.obscurePassword,
                      validator: FieldsValidators.passwordValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: visibilityCubit.toggleVisibility,
                          child: Icon(state.obscurePassword ? HeroiconsOutline.eye : HeroiconsOutline.eyeSlash),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomSheet: BottomSheetPrimaryButton(
          label: 'Login',
          onTap: () {
            if (formKey.currentState?.validate() ?? false) {
              loginCubit.authenticate(
                email: emailController.text,
                password: passwordController.text,
              );
            }
          },
        ),
      ),
    );
  }
}
