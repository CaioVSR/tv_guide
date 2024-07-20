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

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }
}
