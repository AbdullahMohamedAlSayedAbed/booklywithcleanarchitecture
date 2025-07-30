import 'package:booklywithcleanarchitecture/core/utils/app_router.dart';
import 'package:booklywithcleanarchitecture/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'sliding_text_widget.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    initSlidingAnimation();
    navigateToHome();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsDate.logo),
        const SizedBox(height: 4),
        SlidingTextWidget(
            slidingAnimation: slidingAnimation,
            animationController: animationController),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  Future<Null> navigateToHome() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        }
      },
    );
  }
}
