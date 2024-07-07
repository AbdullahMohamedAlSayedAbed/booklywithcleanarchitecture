import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/custom_image.dart';
import 'package:booklywithcleanarchitecture/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../books_action.dart';

class SectionBookDetails extends StatelessWidget {
  const SectionBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * .18),
          child: const CustomImage(),
        ),
        const SizedBox(height: 40),
        const Text(
          'The Jungle Book',
          style: Styles.style30,
        ),
        const SizedBox(height: 4),
        Opacity(
          opacity: .7,
          child: Text(
            'The Jungle Book',
            style: Styles.style18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37),
        const BooksAction(),
      ],
    );
  }
}
