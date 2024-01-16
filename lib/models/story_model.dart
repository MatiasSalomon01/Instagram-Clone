class StoryModel {
  final int? id;
  final String username;
  final bool isMe;
  final bool hasStories;
  final bool isVerified;
  final String? profilePictureUrl;

  StoryModel({
    this.id,
    required this.username,
    this.isMe = false,
    this.hasStories = false,
    this.isVerified = false,
    this.profilePictureUrl,
  });

  factory StoryModel.fromJson(Map<String, dynamic> map) {
    return StoryModel(
      id: map['id'],
      username: map['username'],
      isMe: map['isMe'],
      hasStories: map['hasStories'],
      isVerified: map['isVerified'],
      profilePictureUrl: map['profilePictureUrl'],
    );
  }
}
