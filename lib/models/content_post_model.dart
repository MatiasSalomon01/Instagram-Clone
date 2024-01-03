import 'package:instagram_clone/models/models.dart';

class ContentPostModel {
  final StoryModel storyModel;
  final List<StoryModel> likedBy;
  final List<String> images;
  final String caption;
  final int totalComments;
  final DateTime createAt;

  ContentPostModel({
    required this.storyModel,
    this.likedBy = const [],
    this.images = const [],
    this.caption = '',
    this.totalComments = 0,
    required this.createAt,
  });
}
