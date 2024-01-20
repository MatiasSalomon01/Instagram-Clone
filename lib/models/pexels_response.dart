class PexelsResponse {
  List<Video> videos;
  String nextPage;

  PexelsResponse({
    required this.videos,
    required this.nextPage,
  });

  factory PexelsResponse.empty() => PexelsResponse(videos: [], nextPage: '');

  factory PexelsResponse.fromJson(Map<String, dynamic> json) => PexelsResponse(
        videos: List<Video>.from(json["videos"].map((e) => Video.fromJson(e))),
        nextPage: json["next_page"],
      );
}

class Video {
  int id;
  int width;
  int height;
  String image;
  User user;
  List<VideoFile> videoFiles;

  Video({
    required this.id,
    required this.width,
    required this.height,
    required this.image,
    required this.user,
    required this.videoFiles,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        image: json["image"],
        user: User.fromJson(json["user"]),
        videoFiles: List<VideoFile>.from(
            json["video_files"].map((e) => VideoFile.fromJson(e))),
      );
}

class User {
  int id;
  String name;
  String url;

  User({
    required this.id,
    required this.name,
    required this.url,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );
}

class VideoFile {
  int id;
  int width;
  int height;
  String link;

  VideoFile({
    required this.id,
    required this.width,
    required this.height,
    required this.link,
  });

  factory VideoFile.fromJson(Map<String, dynamic> json) => VideoFile(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        link: json["link"],
      );
}
