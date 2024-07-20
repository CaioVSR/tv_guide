// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:tv_guide/features/home/domain/entities/show_summary_entity.dart';

class HomePageLoadSuccess extends StatelessWidget {
  const HomePageLoadSuccess({
    required this.showsList,
    super.key,
  });

  final List<ShowSummaryEntity> showsList;

  @override
  Widget build(BuildContext context) {
    if (showsList.isEmpty) {
      return const Center(
        child: Text('No shows found', ),
      );
    }

    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }
}
