import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:mock_data/mock_data.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:word_generator/word_generator.dart';

class ReelsProvider extends ChangeNotifier {
  Map<int, VideoPlayerController> mapVideos = {};
  Map<int, String> videosFromApi = {};
  Map<int, ReelsModel> reelsContent = {};
  int _currentIndex = 0;
  int _page = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  ReelsProvider() {
    getVideosFromApi();
  }

  Future<void> getVideosFromApi() async {
    int count = mapVideos.isEmpty ? 0 : videosFromApi.length;

    _page += 1;

    bool finished = await getPexelsVideos(count: count);
    if (!finished) return;

    // videosFromApi[0] =
    //     'https://player.vimeo.com/external/479728625.sd.mp4?s=f4f886d3d45a0312d8d47419647788178535a2c6&profile_id=165&oauth2_token_id=57447761';

    if (count == 0) await loadInitialVideos(0);
  }

  Future<void> loadInitialVideos(int index) async {
    //Inicializar primer video
    await initializeVideo(index);

    //Reproducir primer video
    await playVideo(index);

    //Inicializar segundo video
    await initializeVideo(index + 1);

    notifyListeners();
  }

  Future<void> initializeVideo(int index) async {
    if (!videosFromApi.containsKey(index)) return;
    final controller = VideoPlayerController.networkUrl(
      Uri.parse(videosFromApi[index]!),
    );

    mapVideos[index] = controller;

    await controller.initialize();
  }

  Future<void> playVideo(int index) async {
    if (!mapVideos.containsKey(index)) return;

    await mapVideos[index]!.setLooping(true);
    await mapVideos[index]!.play();
  }

  Future<void> resetVideo(int index) async {
    if (!mapVideos.containsKey(index)) return;

    await mapVideos[index]!.pause();
    await mapVideos[index]!.seekTo(const Duration());
  }

  Future<void> disposeVideo(int index) async {
    if (!mapVideos.containsKey(index)) return;

    await mapVideos[index]!.dispose();
  }

  Future<void> nextVideo(int index) async {
    await disposeVideo(index - 2);

    await resetVideo(index - 1);

    await playVideo(index);

    await initializeVideo(index + 1);

    _currentIndex = index;
    notifyListeners();
  }

  Future<void> previousVideo(int index) async {
    await disposeVideo(index + 2);

    await resetVideo(index + 1);

    await playVideo(index);

    await initializeVideo(index - 1);

    _currentIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    for (var item in mapVideos.entries) {
      item.value.dispose();
    }
    super.dispose();
  }

  static const _authority = 'api.pexels.com';
  static const _headers = {
    'Authorization': 'c9P0gvk7SKSG0ypDARLPKSEHUEnNJJNAFvGwHnjoabJZLAzn3m9iEzT5'
  };

  Future<bool> getPexelsVideos({int count = 0}) async {
    print('PETICION A PEXELS');

    final url = Uri.https(
      _authority,
      '/videos/search',
      {
        'query': 'nature',
        'orientation': 'portrait',
        'page': '$_page',
        'per_page': '5'
      },
    );

    var response = await http.get(url, headers: _headers);

    if (response.statusCode != 200) return false;

    var decodedBody = json.decode(response.body) as Map<String, dynamic>;
    var pexelsReponse = PexelsResponse.fromJson(decodedBody);

    final random = Random();
    final wordGenerator = WordGenerator();
    for (var pexel in pexelsReponse.videos) {
      var videoFile = pexel.videoFiles.firstWhere(
        (v) => v.height == 1080 && v.width == 1920,
        orElse: () => pexel.videoFiles.firstWhere(
          (vi) => vi.height <= 1080 && vi.width <= 1920,
          orElse: () => VideoFile.empty(),
        ),
      );

      if (videoFile.id == 0) continue;

      var user = pexel.user;
      videosFromApi[count] = videoFile.link;
      reelsContent[count] = ReelsModel(
        caption: wordGenerator.randomSentence(random.nextInt(70) + 2),
        storyModel: StoryModel(
          id: user.id,
          username: user.name,
          hasStories: true,
          isVerified: true,
          profilePictureUrl: pexel.image,
        ),
        videoUrl: videoFile.link,
        totalComments: random.nextInt(10000),
        totalLikes: random.nextInt(600000),
        totalShares: random.nextInt(50000),
        extraInfo: user.url,
        friendName: mockName(),
        showLikes: random.nextBool(),
      );
      count++;
    }

    notifyListeners();
    return true;
  }

  onPageChanged(int value) async {
    if (value > _currentIndex) {
      if (videosFromApi.length == value + 1) {
        _page += 1;
        await getPexelsVideos(
          count: mapVideos.isEmpty ? 0 : videosFromApi.length,
        );
      }
      nextVideo(value);
    } else {
      previousVideo(value);
    }
  }
}
