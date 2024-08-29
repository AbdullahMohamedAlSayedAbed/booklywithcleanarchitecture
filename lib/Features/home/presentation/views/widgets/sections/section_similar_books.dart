import 'package:booklywithcleanarchitecture/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../similar_books_bloc_builder.dart';

class SectionSimilarBooks extends StatelessWidget {
  const SectionSimilarBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text('You can also like',
              style: Styles.style14.copyWith(fontWeight: FontWeight.w600)),
        ),
        const SimilarBooksBlocBuilder(),
        const SizedBox(height: 40),
      ],
    );
  }
}
