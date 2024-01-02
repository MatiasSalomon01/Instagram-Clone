import 'package:instagram_clone/models/models.dart';
import 'package:mock_data/mock_data.dart';

final stories = [
  StoryModel(username: "Tu historia", isMe: true),
  ...content,
];

final content = [
  StoryModel(
    username: mockName(),
    hasStories: true,
    isVerified: true,
    profilePictureUrl:
        'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&w=600',
  ),
  StoryModel(
    username: mockName(),
    profilePictureUrl:
        'https://images.pexels.com/photos/1707821/pexels-photo-1707821.jpeg?auto=compress&cs=tinysrgb&w=600',
  ),
  StoryModel(
    username: mockName(),
    hasStories: true,
    isVerified: true,
    profilePictureUrl:
        'https://images.pexels.com/photos/337909/pexels-photo-337909.jpeg?auto=compress&cs=tinysrgb&w=600',
  ),
  StoryModel(
    username: mockName(),
    profilePictureUrl:
        'https://images.pexels.com/photos/9661324/pexels-photo-9661324.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  ),
  StoryModel(
    username: mockName(),
    profilePictureUrl:
        'https://images.pexels.com/photos/19384491/pexels-photo-19384491/free-photo-of-a-woman-holding-a-camera.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  ),
];
