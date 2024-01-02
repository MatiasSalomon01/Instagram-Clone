import 'package:flutter/material.dart';
import 'package:instagram_clone/mock/mock_data.dart';
import 'package:instagram_clone/widgets/widgets.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: content.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ContentItem(model: content[index]),
      separatorBuilder: (context, index) => const VerticalSpace(15),
    );
  }
}
