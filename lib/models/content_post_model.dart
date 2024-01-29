import 'dart:math';

import 'package:instagram_clone/models/models.dart';
import 'package:mock_data/mock_data.dart';

class ContentPostModel {
  final int? id;
  final StoryModel storyModel;
  final List<StoryModel> likedBy;
  List<Posts> posts;
  final String caption;
  final int totalComments;
  final DateTime createAt;
  final String? friendName;
  final bool showLikes;
  final int totalLikes;

  ContentPostModel({
    this.id,
    required this.storyModel,
    this.likedBy = const [],
    this.posts = const [],
    this.caption = '',
    this.totalComments = 0,
    required this.createAt,
    this.friendName,
    this.showLikes = true,
    this.totalLikes = 0,
  });

  factory ContentPostModel.fromJson(Map<String, dynamic> map) {
    return ContentPostModel(
      id: map['id'],
      caption: map['caption'],
      totalComments: map['totalComments'],
      createAt: DateTime.parse(map['createAt']),
      storyModel: StoryModel(
        id: map['Stories']['id'],
        username: map['Stories']['username'],
        profilePictureUrl: map['Stories']['profilePictureUrl'],
        hasStories: map['Stories']['hasStories'],
        isVerified: map['Stories']['isVerified'],
      ),
      friendName: mockName(),
      showLikes: Random().nextBool(),
      totalLikes: Random().nextInt(600000),
    );
  }

  @override
  String toString() {
    return '$id, $caption, $totalComments, $createAt, ${storyModel.username}, ${storyModel.profilePictureUrl}';
  }
}

class Posts {
  final String fileUrl;

  Posts({required this.fileUrl});

  bool isVideo() {
    return fileUrl.endsWith('.mp4') ||
        fileUrl.startsWith('https://firebasestorage.googleapis') ||
        fileUrl.startsWith('https://media') ||
        fileUrl.startsWith('https://player.vimeo.com');
  }
}
