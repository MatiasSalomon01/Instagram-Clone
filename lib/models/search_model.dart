class SearchModel {
  List<Photos> photos;
  SearchModel({required this.photos});

  factory SearchModel.fromJson(Map<String, dynamic> map) {
    return SearchModel(
      photos: List<Photos>.from(map['photos'].map((e) => Photos.fromJson(e))),
    );
  }
}

class Photos {
  final String photographer;
  final Source src;

  Photos({
    required this.photographer,
    required this.src,
  });

  factory Photos.fromJson(Map<String, dynamic> map) {
    return Photos(
      photographer: map['photographer'],
      src: Source.fromJson(map['src']),
    );
  }
}

class Source {
  final String original;
  final String large;
  final String medium;
  final String small;
  final String portrait;
  final String landscape;
  final String tiny;

  Source({
    required this.original,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  factory Source.fromJson(Map<String, dynamic> map) {
    return Source(
      original: map['original'],
      large: map['large'],
      medium: map['medium'],
      small: map['small'],
      portrait: map['portrait'],
      landscape: map['landscape'],
      tiny: map['tiny'],
    );
  }
}
