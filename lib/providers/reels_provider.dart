import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class ReelsProvider extends ChangeNotifier {
  Map<int, VideoPlayerController> mapVideos = {};
  Map<int, String> videosFromApi = {};
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

    await loadInitialVideos();
  }

  loadInitialVideos() async {
    //Inicializar primer video
    await initializeVideo(0);

    //Reproducir primer video
    await playVideo(0);

    //Inicializar segundo video
    await initializeVideo(1);

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

    for (var pexel in pexelsReponse.videos) {
      var videoFiles = pexel.videoFiles
          .where((e) => e.height <= 900 && e.width <= 540)
          .toList();
      if (videoFiles.isEmpty) continue;

      videosFromApi[count] = videoFiles.first.link;
      count++;
    }
    notifyListeners();
    return true;
  }
}
