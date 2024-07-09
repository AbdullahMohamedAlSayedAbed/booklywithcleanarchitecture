import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListViewItem extends StatelessWidget {
  const FeaturedBooksListViewItem(
      {super.key, required this.height, this.width, required this.bookEntity});
  final double height;
  final double? width;
  final List<BookEntity> bookEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * height,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: bookEntity.length,
        itemBuilder: (context, index) =>  CustomImage(image: bookEntity[index].image,),
        separatorBuilder: (BuildContext context, _) =>
            SizedBox(width: width ?? 15),
      ),
    );
  }
}
