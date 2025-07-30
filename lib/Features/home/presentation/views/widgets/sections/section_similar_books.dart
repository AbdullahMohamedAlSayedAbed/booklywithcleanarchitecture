import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/view_models/similar_cubit/similar_books_cubit.dart';
import 'package:booklywithcleanarchitecture/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../similar_books_bloc_builder.dart';

class SectionSimilarBooks extends StatefulWidget {
  const SectionSimilarBooks({super.key, required this.book});
  final BookEntity book;
  @override
  State<SectionSimilarBooks> createState() => _SectionSimilarBooksState();
}

class _SectionSimilarBooksState extends State<SectionSimilarBooks> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        categories: widget.book.categories?[0]??'programming');
    super.initState();
  }
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
