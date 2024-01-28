import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      // bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class _Test extends StatefulWidget {
  const _Test({
    super.key,
  });

  @override
  State<_Test> createState() => _TestState();
}

class _TestState extends State<_Test> with SingleTickerProviderStateMixin {
  // late final AnimationController controller;
  // late final Animation animation;
  bool isExpanded = false;
  @override
  void initState() {
    super.initState();
    // controller = AnimationController(
    //   vsync: this,
    //   // upperBound: 150,
    //   // lowerBound: 20,
    //   duration: const Duration(milliseconds: 500),
    // );

    // animation = Tween<double?>(begin: 20.0, end: 150).animate(controller);
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //     onTap: () {
    //       setState(() => isExpanded = !isExpanded);
    //       if (isExpanded) {
    //         controller.forward();
    //       } else {
    //         controller.reverse();
    //       }
    //     },
    //     child: AnimatedBuilder(
    //       animation: animation,
    //       builder: (context, child) => Container(
    //         height: animation.isCompleted ? null : animation.value,
    //         color: lightBlue,
    //         child: Text(
    //           'asdasdadsasdas asdasdadsasdas asdasdadsasdas asdasdadsasdasasdasdadsasdasasdasdadsasdas asdasdadsasdas',
    //           maxLines: 500,
    //           style: TextStyle(color: white, overflow: TextOverflow.ellipsis),
    //         ),
    //       ),
    //     ));
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() => isExpanded ^= true);
          },
          child: AnimatedClipRect(
            onTap: () {},
            open: isExpanded,
            horizontalAnimation: false,
            verticalAnimation: true,
            // alignment: Alignment.center,
            duration: const Duration(milliseconds: 500),
            // curve: Curves.bounceOut,
            // reverseCurve: Curves.bounceIn,
            child: Container(
              color: Colors.lightGreenAccent,
              padding: const EdgeInsets.all(8),
              child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
            ),
          ),
        ),
        ElevatedButton(
            child: const Text("open/close"),
            onPressed: () {
              setState(() => isExpanded ^= true);
            }),
      ],
    );
  }
}

class AnimatedClipRect extends StatefulWidget {
  @override
  _AnimatedClipRectState createState() => _AnimatedClipRectState();

  final Widget child;
  final bool open;
  final bool horizontalAnimation;
  final bool verticalAnimation;
  final Alignment alignment;
  final Duration duration;
  final Duration? reverseDuration;
  final Curve curve;
  final Curve? reverseCurve;

  ///The behavior of the controller when [AccessibilityFeatures.disableAnimations] is true.
  final AnimationBehavior animationBehavior;
  final VoidCallback onTap;
  const AnimatedClipRect({
    Key? key,
    required this.child,
    required this.open,
    this.horizontalAnimation = true,
    this.verticalAnimation = true,
    this.alignment = Alignment.center,
    this.duration = const Duration(milliseconds: 500),
    this.reverseDuration,
    this.curve = Curves.linear,
    this.reverseCurve,
    this.animationBehavior = AnimationBehavior.normal,
    required this.onTap,
  }) : super(key: key);
}

class _AnimatedClipRectState extends State<AnimatedClipRect>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController = AnimationController(
        duration: widget.duration,
        reverseDuration: widget.reverseDuration ?? widget.duration,
        vsync: this,
        value: widget.open ? 1.0 : 0.0,
        animationBehavior: widget.animationBehavior);
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.curve,
      reverseCurve: widget.reverseCurve ?? widget.curve,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.open
        ? _animationController.forward()
        : _animationController.reverse();

    return ClipRect(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, child) {
          return Align(
            alignment: widget.alignment,
            heightFactor: widget.verticalAnimation ? _animation.value : 1.0,
            widthFactor: widget.horizontalAnimation ? _animation.value : 1.0,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
