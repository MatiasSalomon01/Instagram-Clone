class StoryModel {
  final String username;
  final bool isMe;
  final bool hasStories;

  StoryModel({
    required this.username,
    this.isMe = false,
    this.hasStories = false,
  });
}
