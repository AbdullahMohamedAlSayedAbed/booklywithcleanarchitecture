import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/featured_books_list_view_item.dart';
import 'package:booklywithcleanarchitecture/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'custom_app_bar_book_details.dart';
import 'sections/section_book_details.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: CustomAppBarBookDetails()),
            const SliverToBoxAdapter(child: SizedBox(height: 33)),
            const SliverToBoxAdapter(child: SectionBookDetails()),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 50,
            )),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text('You can also like',
                  style: Styles.style14.copyWith(fontWeight: FontWeight.w600)),
            )),
            const SliverToBoxAdapter(
                child: FeaturedBooksListViewItem(height: .15)),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }
}
