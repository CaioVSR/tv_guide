// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:tv_guide/core/theme/app_colors.dart';

class HomePageInitial extends StatelessWidget {
  const HomePageInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'To get started, search for shows',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          'Your search results will appear here',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
