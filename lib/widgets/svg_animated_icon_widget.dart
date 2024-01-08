import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import '../constants/colors.dart';

class SvgAnimatedIcon extends StatefulWidget {
  const SvgAnimatedIcon({
    super.key,
    required this.svgIcon,
    required this.svgIconPressed,
    this.isPressed = false,
    this.svgColor = white,
    this.svgColorSelected = white,
    this.height = 25,
    this.addCounter = false,
    this.counter,
  });

  final String svgIcon;
  final String svgIconPressed;
  final bool isPressed;
  final Color svgColor;
  final Color svgColorSelected;
  final double height;
  final bool addCounter;
  final int? counter;

  @override
  State<SvgAnimatedIcon> createState() => _SvgAnimatedIconState();
}

class _SvgAnimatedIconState extends State<SvgAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late Animation<double> scale;
  late bool isPressed;
  int? counter;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      reverseDuration: const Duration(milliseconds: 100),
    );
    scale = Tween<double>(begin: 1.0, end: 1.2).animate(controller);
    isPressed = widget.isPressed;
    if (widget.addCounter) {
      counter = widget.counter;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void animate() {
    controller.forward().whenComplete(() => controller.reverse());
    setState(() {
      isPressed = !isPressed;

      if (counter != null) {
        if (isPressed) {
          counter = counter! + 1;
        } else {
          counter = counter! - 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScaleTransition(
          scale: scale,
          child: GestureDetector(
            onTap: animate,
            child: SvgString(
              icon: isPressed ? widget.svgIconPressed : widget.svgIcon,
              color: isPressed ? widget.svgColorSelected : widget.svgColor,
              height: widget.height,
            ),
          ),
        ),
        if (widget.addCounter && counter != null) ...[
          VerticalSpace(4),
          Text(
            '$counter',
            style: TextStyle(
              color: greyText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]
      ],
    );
  }
}
