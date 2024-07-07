import 'package:booklywithcleanarchitecture/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'featured_books_list_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        FeaturedBooksListViewItem(),
        Padding(
          padding: EdgeInsets.only(left: 30,top: 49,bottom: 20),
          child: Text('Best Seller', style: Styles.style18),
        ),
      ],
    );
  }
}
