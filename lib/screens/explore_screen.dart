import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:instagram_clone/widgets/widgets.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({
    super.key,
    this.model,
  });

  final ContentPostModel? model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: const IconThemeData(color: white),
        title: const Text(
          'Explorar',
          style: TextStyle(
            color: white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ContentItem(model: model!),
        itemCount: 1,
      ),
    );
  }
}
