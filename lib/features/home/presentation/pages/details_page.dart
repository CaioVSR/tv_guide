// ignore_for_file: public_member_api_docs

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:html_tags_cleaner/html_tags_cleaner.dart';

import 'package:tv_guide/core/theme/app_colors.dart';
import 'package:tv_guide/core/theme/app_images_paths.dart';
import 'package:tv_guide/features/home/domain/entities/show_entity.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    required this.details,
    super.key,
  });

  final ShowEntity details;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(HeroiconsOutline.arrowLeft),
        ),
        title: Text(
          'TV GUIDE',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: PhysicalModel(
              color: Colors.transparent,
              elevation: 12,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: widget.details.image!,
                  fit: BoxFit.cover,
                  width: MediaQuery.sizeOf(context).width / 2,
                  placeholder: (context, url) => Image.asset(
                    AppImagePaths.questionMark,
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    AppImagePaths.questionMark,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.details.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      const Icon(HeroiconsOutline.star, color: AppColors.accent),
                      const SizedBox(width: 8),
                      Text(
                        '${widget.details.rating ?? '--'}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textPrimary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 16,
                    children: [
                      ...widget.details.genres.map(
                        (genre) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.textSecondary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            genre,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.backgroundVariant, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        HtmlTagsCleaner.clean(widget.details.summary),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
