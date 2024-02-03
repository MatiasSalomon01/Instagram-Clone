import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:instagram_clone/models/models.dart';

import '../constants/others.dart';

class SearchProvider extends ChangeNotifier {
  ScrollController controller = ScrollController();

  List<List<Photos>> urls = [];

  int _page = 0;

  SearchProvider() {
    getPexelsImages();
    controller.addListener(() async {
      if (controller.position.atEdge && controller.offset > 0) {
        await getPexelsImages(page: _page++);
      }
    });
  }

  bool isLoading = false;

  String getSearchWord() {
    return queryWords[random.nextInt(queryWords.length)];
  }

  String getColorWord() {
    return colorWords[random.nextInt(queryWords.length)];
  }

  Future<bool> getPexelsImages({int page = 1}) async {
    isLoading = true;
    notifyListeners();
    print('PETICION A PEXELS Images');

    final word = getSearchWord();
    // final color = getColorWord();
    // print('query: $word');
    final url = Uri.https(
      authority,
      '/v1/search',
      {
        'query': word,
        // 'orientation': 'portrait',
        'page': '$page',
        // 'color': color,
        'per_page': '22'
      },
    );

    var response = await http.get(url, headers: headers);

    if (response.statusCode != 200) return false;

    var decodedBody = json.decode(response.body) as Map<String, dynamic>;
    var model = SearchModel.fromJson(decodedBody);

    for (var i = 0; i < model.photos.length; i += 11) {
      var values = model.photos.skip(i).take(11).toList();
      urls.add(values);
    }

    // for (var pexel in searchModel.photos) {}
    isLoading = false;
    notifyListeners();
    return true;
  }

  @override
  void dispose() {
    controller.dispose();
    urls.clear();
    super.dispose();
  }
}
