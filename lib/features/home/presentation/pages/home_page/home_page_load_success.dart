// ignore_for_file: public_member_api_docs

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tv_guide/core/theme/app_colors.dart';
import 'package:tv_guide/core/theme/app_images_paths.dart';
import 'package:tv_guide/features/home/domain/entities/show_summary_entity.dart';

class HomePageLoadSuccess extends StatelessWidget {
  const HomePageLoadSuccess({
    required this.showsList,
    required this.onShowSelected,
    super.key,
  });

  final List<ShowSummaryEntity> showsList;
  final Future<void> Function(int) onShowSelected;

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.sizeOf(context).width / 4;

    if (showsList.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Oops! No shows found',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            'Maybe try searching for something else',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
          ),
        ],
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: showsList.length,
      primary: false,
      itemBuilder: (context, index) {
        final show = showsList[index];

        return GestureDetector(
          onTap: () => onShowSelected(show.id),
          child: Container(
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 8),
            clipBehavior: Clip.antiAlias,
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.textSecondary,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: show.imageUrl!,
                    width: imageWidth,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Image.asset(AppImagePaths.questionMark),
                    errorWidget: (context, url, error) => Image.asset(AppImagePaths.questionMark),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      show.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
