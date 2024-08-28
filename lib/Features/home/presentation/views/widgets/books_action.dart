import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/core/utils/functions/launch_url.dart';
import 'package:booklywithcleanarchitecture/core/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            onPressed: () => launchCustomUr(context, book.previewLink),
            text: '${book.price.toString()} \$',
            backgroundColor: Colors.white,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12), topLeft: Radius.circular(12)),
          )),
          Expanded(
              child: CustomButton(
            onPressed: () {
              launchCustomUr(context, book.previewLink);
            },
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(12)),
          )),
        ],
      ),
    );
  }
}
