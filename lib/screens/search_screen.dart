import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      builder: (context, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: SizedBox(
          width: size.width,
          child: Consumer<SearchProvider>(
            builder: (context, state, child) => Stack(
              children: [
                ListView.builder(
                  controller: state.controller,
                  itemCount: state.urls.length,
                  itemBuilder: (context, index) => SeachItemLayout(
                    index: index,
                    photos: state.urls[index],
                  ),
                ),
                if (state.isLoading)
                  Container(
                    color: backgroundColor.withOpacity(.5),
                    child: const Loader(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
