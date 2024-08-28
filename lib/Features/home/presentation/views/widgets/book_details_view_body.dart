import 'package:booklywithcleanarchitecture/Features/home/data/repos/home_repo_impl.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/view_models/similar_cubit/similar_books_cubit.dart';
import 'package:booklywithcleanarchitecture/core/utils/functions/setup_service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import 'custom_app_bar_book_details.dart';
import 'sections/section_book_details.dart';
import 'sections/section_similar_books.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const CustomAppBarBookDetails(),
                  const SizedBox(height: 33),
                  SectionBookDetails(
                    book: book,
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  const SectionSimilarBooks(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
