import 'package:instagram_clone/models/models.dart';
import 'package:mock_data/mock_data.dart';

final stories = [
  StoryModel(username: "Tu historia", isMe: true),
  ...content.map((e) => e.storyModel).toList(),
];

final content = [
  ContentPostModel(
    storyModel: StoryModel(
      username: mockName(),
      hasStories: true,
      isVerified: true,
      profilePictureUrl:
          'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    createAt: mockDate(DateTime(2023, 5, 2)),
  ),
  ContentPostModel(
    storyModel: StoryModel(
      username: mockName(),
      profilePictureUrl:
          'https://images.pexels.com/photos/1707821/pexels-photo-1707821.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    createAt: mockDate(DateTime(2023, 6, 25)),
  ),
  ContentPostModel(
    storyModel: StoryModel(
      username: mockName(),
      hasStories: true,
      isVerified: true,
      profilePictureUrl:
          'https://images.pexels.com/photos/337909/pexels-photo-337909.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    caption: 'Este es el caption del post',
    createAt: mockDate(DateTime(2023, 7, 15)),
    likedBy: List.generate(3, (index) => StoryModel(username: mockName())),
  ),
  ContentPostModel(
    storyModel: StoryModel(
      username: mockName(),
      profilePictureUrl:
          'https://images.pexels.com/photos/9661324/pexels-photo-9661324.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    createAt: mockDate(DateTime(2023, 11, 9)),
  ),
  ContentPostModel(
      storyModel: StoryModel(
        username: mockName(),
        profilePictureUrl:
            'https://images.pexels.com/photos/19384491/pexels-photo-19384491/free-photo-of-a-woman-holding-a-camera.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      ),
      caption: 'Este es el caption del post',
      createAt: mockDate(DateTime(2023, 12, 28)),
      likedBy: List.generate(1, (index) => StoryModel(username: mockName())),
      images: [
        'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&w=600',
        'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&w=600',
      ]),
  ContentPostModel(
    storyModel: StoryModel(
      username: mockName(),
      profilePictureUrl:
          'https://images.pexels.com/photos/19326478/pexels-photo-19326478/free-photo-of-columns-near-vintage-door.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    ),
    caption: 'Este es el caption del post',
    createAt: DateTime.now(),
    likedBy: List.generate(9, (index) => StoryModel(username: mockName())),
  ),
  ContentPostModel(
    storyModel: StoryModel(
      username: mockName(),
    ),
    caption: 'Este es el caption del post',
    createAt: DateTime.now(),
    likedBy: List.generate(304, (index) => StoryModel(username: mockName())),
    totalComments: 54,
    images: [
      'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1707821/pexels-photo-1707821.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/337909/pexels-photo-337909.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/9661324/pexels-photo-9661324.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'https://images.pexels.com/photos/19384491/pexels-photo-19384491/free-photo-of-a-woman-holding-a-camera.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/19326478/pexels-photo-19326478/free-photo-of-columns-near-vintage-door.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1707821/pexels-photo-1707821.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/337909/pexels-photo-337909.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/9661324/pexels-photo-9661324.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'https://images.pexels.com/photos/19384491/pexels-photo-19384491/free-photo-of-a-woman-holding-a-camera.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/19326478/pexels-photo-19326478/free-photo-of-columns-near-vintage-door.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1707821/pexels-photo-1707821.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/337909/pexels-photo-337909.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/9661324/pexels-photo-9661324.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'https://images.pexels.com/photos/19384491/pexels-photo-19384491/free-photo-of-a-woman-holding-a-camera.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/19326478/pexels-photo-19326478/free-photo-of-columns-near-vintage-door.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    ],
  ),
];
