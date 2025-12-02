class Game {
  final int id;
  final String title;
  final String platform;
  final String genre;
  final double rating;
  final String coverUrl;
  final String reviewText;

  Game({
    required this.id,
    required this.title,
    required this.platform,
    required this.genre,
    required this.rating,
    required this.coverUrl,
    required this.reviewText,
  });
}
