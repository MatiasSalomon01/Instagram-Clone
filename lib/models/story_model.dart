class StoryModel {
  final int? id;
  final String username;
  final bool isMe;
  final bool hasStories;
  final bool isVerified;
  final String? profilePictureUrl;
  final List<String> stories = [
    'https://images.pexels.com/photos/354939/pexels-photo-354939.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/1266808/pexels-photo-1266808.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/354939/pexels-photo-354939.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
    'https://images.pexels.com/photos/1509534/pexels-photo-1509534.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800'
  ];

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

  @override
  String toString() {
    return 'id: $id, username: $username, isMe: $isMe, hasStories: $hasStories, isVerified: $isVerified, profilePictureUrl: $profilePictureUrl';
  }
}
