import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/custom_image.dart';
import 'package:booklywithcleanarchitecture/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../books_action.dart';

class SectionBookDetails extends StatelessWidget {
  const SectionBookDetails({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * .18),
          child: CustomImage(
            bookEntity: book,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          book.title ?? '',
          style: Styles.style30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Opacity(
          opacity: .7,
          child: Text(
            book.author ?? '',
            style: Styles.style18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        BookRating(
          book: book,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37),
        BooksAction(
          book: book,
        ),
      ],
    );
  }
}
