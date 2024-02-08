import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/icons.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import '../models/models.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({
    super.key,
    required this.pageIndex,
    required this.model,
    required this.nextPage,
  });

  final int pageIndex;
  final StoryModel model;
  final Function(int) nextPage;

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  int currentIndex = 0;
  late String url;
  Map<int, bool> map = {0: true};
  @override
  void initState() {
    super.initState();
    url = widget.model.stories[0];

    for (var i = 1; i < widget.model.stories.length; i++) {
      map[i] = false;
    }

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        nextStory();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height * .85,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        url,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12,
                      left: 15,
                      right: 15,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorColor: white,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: transparent,
                              contentPadding: const EdgeInsets.only(left: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    const BorderSide(color: greyText, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    const BorderSide(color: greyText, width: 1),
                              ),
                              hintText: 'Enviar mensaje',
                              hintStyle:
                                  const TextStyle(color: white, fontSize: 14),
                            ),
                          ),
                        ),
                        const HorizontalSpace(20),
                        const SvgString(icon: favoriteIcon),
                        const HorizontalSpace(20),
                        const SvgString(icon: shareIcon),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                      child: Row(
                        children: List.generate(
                          widget.model.stories.length,
                          (index) => Expanded(
                            child: AnimatedBuilder(
                              animation: controller,
                              builder: (context, child) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 1.5),
                                child: Slider(
                                  value: index == currentIndex
                                      ? controller.value
                                      : map[index]!
                                          ? 1
                                          : 0.0,
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ProfilePicture(
                          radius: 16,
                          padding: 2,
                          model: StoryModel(
                            hasStories: false,
                            username: widget.model.username,
                            profilePictureUrl: widget.model.profilePictureUrl,
                          ),
                        ),
                        const HorizontalSpace(5),
                        Text(
                          widget.model.username,
                          style: const TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (widget.model.isVerified) ...[
                          const HorizontalSpace(5),
                          const Icon(Icons.verified, color: white, size: 18)
                        ],
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: previousStory,
                child: Container(
                  height: size.height * .85,
                  width: 70,
                  color: transparent,
                ),
              ),
              GestureDetector(
                onTap: nextStory,
                child: Container(
                  margin: const EdgeInsets.only(left: 70),
                  height: size.height * .85,
                  width: size.width - 70,
                  color: transparent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void previousStory() {
    if (currentIndex != 0) {
      setState(() {
        if (map[currentIndex]!) {
          map[currentIndex] = false;
        }
        currentIndex = currentIndex - 1;
        url = widget.model.stories[currentIndex];
      });
      load();
    }
  }

  void nextStory() {
    if (currentIndex < widget.model.stories.length - 1) {
      setState(() {
        currentIndex = currentIndex + 1;

        url = widget.model.stories[currentIndex];

        if (!map[currentIndex]!) {
          map[currentIndex] = true;
        }
      });
      load();
    } else {
      widget.nextPage(widget.pageIndex + 1);
    }
  }

  load() {
    controller.reset();
    controller.forward();
  }
}
