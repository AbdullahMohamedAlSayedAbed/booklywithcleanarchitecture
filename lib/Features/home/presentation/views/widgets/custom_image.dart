import 'package:booklywithcleanarchitecture/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.bookDetailsView),
      child: AspectRatio(
        aspectRatio: 2.7/4,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.amber,
                  image:
                      DecorationImage(image: AssetImage('assets/images/test.png'),fit: BoxFit.fill)),
            )),
      ),
    );
  }
}
