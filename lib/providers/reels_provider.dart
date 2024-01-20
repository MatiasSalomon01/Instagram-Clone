import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelsProvider extends ChangeNotifier {
  Map<int, VideoPlayerController> mapVideos = {};
  Map<int, String> videosFromApi = {};
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  var _list = [
    'https://player.vimeo.com/external/226685105.hd.mp4?s=b6a194faf216cac660ec198e72b4e939cd74dee3&profile_id=174&oauth2_token_id=57447761',
    "https://player.vimeo.com/external/296210754.hd.mp4?s=08c03c14c04f15d65901f25b542eb2305090a3d7&profile_id=175&oauth2_token_id=57447761",
    "https://player.vimeo.com/external/370467553.hd.mp4?s=ce49c8c6d8e28a89298ffb4c53a2e842bdb11546&profile_id=174&oauth2_token_id=57447761",
    "https://player.vimeo.com/external/316506213.hd.mp4?s=1e169a0741d406dc6ff688d22a97cbeaf0261463&profile_id=175&oauth2_token_id=57447761",
    'https://player.vimeo.com/external/424526465.hd.mp4?s=a7612c49100e87ab5470112277ce5c87a3222bb1&profile_id=175&oauth2_token_id=57447761',
  ];

  ReelsProvider() {
    getVideosFromApi();
  }

  Future<void> getVideosFromApi() async {
    int count = mapVideos.isEmpty ? 0 : videosFromApi.length;

    for (String url in _list) {
      videosFromApi[count] = url;
      count++;
    }

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
}
