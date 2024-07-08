import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListViewItem extends StatelessWidget {
  const FeaturedBooksListViewItem(
      {super.key, required this.height, this.width});
  final double height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * height,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) => const CustomImage(),
        separatorBuilder: (BuildContext context, _) =>
            SizedBox(width: width ?? 15),
      ),
    );
  }
}
