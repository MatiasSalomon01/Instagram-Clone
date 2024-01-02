class StoryModel {
  final String username;
  final bool isMe;
  final bool hasStories;
  final bool isVerified;

  StoryModel({
    required this.username,
    this.isMe = false,
    this.hasStories = false,
    this.isVerified = false,
  });
}
