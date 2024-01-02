class StoryModel {
  final String username;
  final bool isMe;
  final bool hasStories;
  final bool isVerified;
  final String? profilePictureUrl;

  StoryModel({
    required this.username,
    this.isMe = false,
    this.hasStories = false,
    this.isVerified = false,
    this.profilePictureUrl,
  });
}
