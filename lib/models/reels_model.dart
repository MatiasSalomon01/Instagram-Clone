import 'package:instagram_clone/models/models.dart';

class ReelsModel {
  final StoryModel storyModel;
  final String? caption;
  final String videoUrl;
  final int totalLikes;
  final int totalComments;
  final int totalShares;
  final String? friendName;
  final String? extraInfo;
  final bool showLikes;

  ReelsModel({
    required this.storyModel,
    this.caption,
    required this.videoUrl,
    this.totalLikes = 0,
    this.totalComments = 0,
    this.totalShares = 0,
    this.friendName,
    this.extraInfo,
    this.showLikes = false,
  });
}
