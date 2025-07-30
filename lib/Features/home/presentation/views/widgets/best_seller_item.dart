import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/custom_image.dart';
import 'package:booklywithcleanarchitecture/core/utils/app_router.dart';
import 'package:booklywithcleanarchitecture/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'book_rating.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 110,
        child: Row(
          children: [
            CustomImage(bookEntity: book),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    // fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(book.title ?? "there is no title",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.style20),
                  ),
                  const SizedBox(height: 3),
                  FittedBox(
                    alignment: Alignment.centerLeft,
                    // fit: BoxFit.scaleDown,
                    child: Text(book.author ?? "there is no author", maxLines: 1, style: Styles.style14)),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${book.price}\$',
                        style: Styles.style20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      BookRating(
                        book: book,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
