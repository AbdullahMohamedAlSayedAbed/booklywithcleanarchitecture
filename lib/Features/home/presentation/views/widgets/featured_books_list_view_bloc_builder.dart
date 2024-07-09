import 'package:booklywithcleanarchitecture/Features/home/presentation/view_models/featured_cubit/featured_books_cubit.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/featured_books_list_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class featuredBooksListViewBlocBuilder extends StatelessWidget {
  const featuredBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return FeaturedBooksListViewItem(
            bookEntity: state.books,
            height: .3,
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
