class CommentModel {
  final String username;
  final String caption;
  final int days;
  final int countResponses;
  final int countLikes;

  CommentModel({
    required this.username,
    required this.caption,
    required this.days,
    required this.countResponses,
    required this.countLikes,
  });
}
