class ShowSummaryEntity {
  ShowSummaryEntity({
    required this.title,
    required this.imageUrl,
    this.averageScore,
  });

  final String title;
  final String imageUrl;
  final double? averageScore;
}
