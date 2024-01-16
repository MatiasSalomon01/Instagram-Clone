import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:instagram_clone/constants/others.dart';
import 'package:instagram_clone/models/models.dart';

class ContentProvider extends ChangeNotifier {
  List<ContentPostModel> content = [];
  List<StoryModel> stories = [];

  final int _interval = 4;
  int _take = 0;

  bool isLoading = false;

  ContentProvider() {
    getContent();
  }

  getContent() async {
    isLoading = true;
    notifyListeners();

    var content = await supabase
        .from('ContentPosts')
        .select(
            'id, caption, createAt, totalComments, Stories!ContentPosts_storyid_fkey(id, username, profilePictureUrl)')
        .order('createAt', ascending: false)
        .range(_take, _take + _interval)
        .withConverter(
            (data) => data.map((e) => ContentPostModel.fromJson(e)).toList());

    this.content.addAll(content);
    _take += _interval;
    isLoading = false;
    notifyListeners();
  }
}
