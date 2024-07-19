// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    required this.details,
    super.key,
  });

  final Object? details;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
