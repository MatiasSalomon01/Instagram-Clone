import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/others.dart';
import 'package:instagram_clone/models/models.dart';

class ContentProvider extends ChangeNotifier {
  List<ContentPostModel> content = [];
  List<StoryModel> stories = [];

  final int _interval = 4;
  int _takeContent = 0;
  // int _takeStories = 0;

  bool isLoadingContent = false;
  bool isLoadingStories = false;

  ContentProvider();

  Future init() async {
    await Future.wait([getContent(), getStories()]);
  }

  Future<void> getContent() async {
    startLoaderContent();

    var content = await supabase
        .from('ContentPosts')
        .select(
            'id, caption, createAt, totalComments, Stories!ContentPosts_storyid_fkey(id, username, hasStories, isVerified, profilePictureUrl)')
        .order('createAt')
        .range(_takeContent, _takeContent + _interval)
        .withConverter((data) => data.map(ContentPostModel.fromJson).toList());

    // var ids = content.map((e) => e.id!).toList();

    // var postsUrl = await supabase
    //     .from('ContentPostsUrls')
    //     .select('id, contentId, url')
    //     .inFilter('contentId', ids)
    //     .withConverter(
    //         (data) => data.map(ContentPostUrlModel.fromJson).toList());

    // content = content.map((e) {
    //   var posts = postsUrl
    //       .where((element) => element.contentId == e.id)
    //       .map((e) => Posts(fileUrl: e.url))
    //       .toList();

    //   if (posts.isNotEmpty) {
    //     e.posts = posts;
    //   }

    //   return e;
    // }).toList();

    this.content.addAll(content);
    _takeContent += _interval;
    finishLoaderContent();
  }

  Future refreshContent() async {
    _takeContent = 0;
    content.clear();
    await getContent();
  }

  Future<void> getStories() async {
    startLoaderStories();

    var stories = await supabase
        .from('Stories')
        .select('id, username, isMe, hasStories, isVerified, profilePictureUrl')
        .order('id', ascending: true)
        // .range(_takeStories, _takeStories + _interval)
        .withConverter((data) => data.map(StoryModel.fromJson).toList());

    this.stories.addAll(stories);
    // _takeStories += _interval;
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
