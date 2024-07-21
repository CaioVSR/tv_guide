// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_guide/app/app_route_manager.dart';
import 'package:tv_guide/core/theme/app_images_paths.dart';
import 'package:tv_guide/features/splash/presentation/cubit/splash_page_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final pageCubit = GetIt.I.get<SplashPageCubit>();

  @override
  void initState() {
    super.initState();
    pageCubit.init();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashPageCubit, SplashPageState>(
      bloc: pageCubit,
      listener: (context, state) {
        if (state is SplashAuthenticated) {
          context.goToHome();
        } else if (state is SplashUnauthenticated) {
          context.goToLogin();
        }
      },
      child: Scaffold(
        body: Center(
          child: Hero(
            tag: AppImagePaths.logoFull,
            child: Image.asset(AppImagePaths.logoFull),
          ),
        ),
      ),
    );
  }
}
