class ContentPostUrlModel {
  final int id;
  final int contentId;
  final String url;

  ContentPostUrlModel({
    required this.id,
    required this.contentId,
    required this.url,
  });

  factory ContentPostUrlModel.fromJson(Map<String, dynamic> map) {
    return ContentPostUrlModel(
      id: map['id'],
      contentId: map['contentId'],
      url: map['url'],
    );
  }
}
