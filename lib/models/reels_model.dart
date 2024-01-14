import 'package:instagram_clone/models/models.dart';

class ReelsModel {
  final StoryModel storyModel;
  final String videoUrl;
  final int totalLikes;
  final int totalComments;

  ReelsModel({
    required this.storyModel,
    required this.videoUrl,
    this.totalLikes = 0,
    this.totalComments = 0,
  });
}
