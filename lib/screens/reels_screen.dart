import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/reels_provider.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReelsProvider(),
      builder: (context, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Consumer<ReelsProvider>(
                  builder: (context, state, child) => PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => ReelItem(
                      index: index,
                      controller: state.mapVideos[index]!,
                      model: state.reelsContent[index]!,
                    ),
                    itemCount: state.mapVideos.length,
                    onPageChanged: state.onPageChanged,
                  ),
                ),
              ),
              const Positioned(
                right: 21,
                top: 10,
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: white,
                  size: 30,
                ),
              ),
              // const Positioned(
              //   left: 21,
              //   top: 5,
              //   child: Text(
              //     'Reels',
              //     style: TextStyle(
              //       color: white,
              //       fontSize: 25,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
