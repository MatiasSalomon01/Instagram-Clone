import 'package:instagram_clone/models/models.dart';

class ContentPostModel {
  final StoryModel storyModel;
  final List<StoryModel> likedBy;
  final List<Posts> posts;
  final String caption;
  final int totalComments;
  final DateTime createAt;

  ContentPostModel({
    required this.storyModel,
    this.likedBy = const [],
    this.posts = const [],
    this.caption = '',
    this.totalComments = 0,
    required this.createAt,
  });
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
