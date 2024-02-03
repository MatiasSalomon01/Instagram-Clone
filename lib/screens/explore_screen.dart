import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:instagram_clone/providers/providers.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({
    super.key,
    required this.model,
  });

  final ContentPostModel model;

  @override
  Widget build(BuildContext context) {
    var content = context.read<ContentProvider>().content;
    content.insert(0, model);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              floating: true,
              backgroundColor: backgroundColor,
              iconTheme: IconThemeData(color: white),
              title: Text(
                'Explorar',
                style: TextStyle(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SliverList.separated(
              itemCount: content.length,
              itemBuilder: (context, index) =>
                  ContentItem(model: content[index]),
              separatorBuilder: (context, index) => const VerticalSpace(15),
            )
          ],
        ),
      ),
    );
  }
}
