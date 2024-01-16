import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/others.dart';
import 'package:instagram_clone/models/models.dart';

class ContentProvider extends ChangeNotifier {
  List<ContentPostModel> content = [];
  List<StoryModel> stories = [];

  final int _interval = 4;
  int _takeContent = 0;
  int _takeStories = 0;

  bool isLoadingContent = false;
  bool isLoadingStories = false;

  ContentProvider();

  Future init() async {
    await Future.wait([getContent(), getStories()] as List<Future>);
  }

  getContent() async {
    startLoaderContent();

    var content = await supabase
        .from('ContentPosts')
        .select(
            'id, caption, createAt, totalComments, Stories!ContentPosts_storyid_fkey(id, username, profilePictureUrl)')
        .order('createAt', ascending: false)
        .range(_takeContent, _takeContent + _interval)
        .withConverter(
            (data) => data.map((e) => ContentPostModel.fromJson(e)).toList());

    var ids = content.map((e) => e.id!).toList();

    var prueba = await supabase
        .from('ContentPostsUrls')
        .select('id, url')
        .inFilter('contentId', ids)
        .range(_takeContent, _takeContent + _interval);

    print(prueba);

    this.content.addAll(content);
    _takeContent += _interval;
    finishLoaderContent();
  }

  Future refreshContent() async {
    _takeContent = 0;
    content.clear();
    await getContent();
  }

  getStories() async {
    startLoaderStories();

    var stories = await supabase
        .from('Stories')
        .select('id, username, isMe, hasStories, isVerified, profilePictureUrl')
        .range(_takeStories, _takeStories + _interval)
        .withConverter(
            (data) => data.map((e) => StoryModel.fromJson(e)).toList());

    this.stories.addAll(stories);
    _takeStories += _interval;
    finishLoaderStories();
  }

  startLoaderContent() {
    isLoadingContent = true;
    notifyListeners();
  }

  finishLoaderContent() {
    isLoadingContent = false;
    notifyListeners();
  }

  startLoaderStories() {
    isLoadingStories = true;
    notifyListeners();
  }

  finishLoaderStories() {
    isLoadingStories = false;
    notifyListeners();
  }
}
