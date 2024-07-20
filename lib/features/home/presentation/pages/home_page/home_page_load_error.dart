// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:tv_guide/core/theme/app_colors.dart';
import 'package:tv_guide/core/theme/app_images_paths.dart';

class HomePageLoadError extends StatelessWidget {
  const HomePageLoadError({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AppImagePaths.error),
        const SizedBox(height: 16),
        Text(
          'An error occurred while loading the shows',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Please try again later',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
