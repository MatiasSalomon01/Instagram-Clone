import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 1,
      shrinkWrap: true,
      itemBuilder: (context, index) => const ContentItem(),
      separatorBuilder: (context, index) => const VerticalSpace(15),
    );
  }
}
