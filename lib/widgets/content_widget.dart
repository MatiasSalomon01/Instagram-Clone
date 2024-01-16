import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/content_provider.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ContentProvider>(
      builder: (context, contentProvider, child) => ListView.separated(
        itemCount: contentProvider.content.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) =>
            ContentItem(model: contentProvider.content[index]),
        separatorBuilder: (context, index) => const VerticalSpace(15),
      ),
    );
  }
}
