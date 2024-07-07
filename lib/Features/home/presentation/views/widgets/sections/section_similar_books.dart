import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/featured_books_list_view_item.dart';
import 'package:booklywithcleanarchitecture/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';

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
        const FeaturedBooksListViewItem(height: .15,width: 10),
        const SizedBox(height: 40),
      ],
    );
  }
}
