import 'package:flutter/material.dart';

class SlidingTextWidget extends StatelessWidget {
  const SlidingTextWidget({
    super.key,
    required this.slidingAnimation,
    required this.animationController,
  });

  final Animation<Offset> slidingAnimation;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text(
            'Read free Books',
            textAlign: TextAlign.center,
          ),
        );
      },
      animation: animationController,
    );
  }
}
