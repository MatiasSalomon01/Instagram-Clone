class StoryModel {
  final int? id;
  final String username;
  final bool isMe;
  final bool hasStories;
  final bool isVerified;
  final String? profilePictureUrl;
  List<String> stories;

  StoryModel({
    this.id,
    required this.username,
    this.isMe = false,
    this.hasStories = false,
    this.isVerified = false,
    this.profilePictureUrl,
    this.stories = const [],
  });

  factory StoryModel.fromJson(Map<String, dynamic> map) {
    return StoryModel(
      id: map['id'],
      username: map['username'],
      isMe: map['isMe'],
      hasStories: map['hasStories'],
      isVerified: map['isVerified'],
      profilePictureUrl: map['profilePictureUrl'],
      // stories: map['StoriesUrls'] == null
      //     ? []
      //     : List<String>.from(map['StoriesUrls'].map((e) => e['url'] as String))
      //         .toList(),
    );
  }

  @override
  String toString() {
    return 'id: $id, username: $username, isMe: $isMe, hasStories: $hasStories, isVerified: $isVerified, profilePictureUrl: $profilePictureUrl';
  }
}
