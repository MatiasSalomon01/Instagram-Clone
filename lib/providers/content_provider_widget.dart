import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:instagram_clone/models/content_post_model.dart';

class ContentProvider {
  static Future<String?> getRandomGif() async {
    String? gif;

    final url = Uri.https(
      'api.giphy.com',
      '/v1/gifs/random',
      {
        'api_key': 'PB72OCC69VnnqfuxzpIoLCdo9d1XDjJ1',
        'tag': '',
        'rating': 'pg-13',
      },
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var body = json.decode(response.body) as Map<String, dynamic>;
      gif = body['data']['images']['original']['mp4'];
      print(gif);
    }
    return gif;
  }
}
