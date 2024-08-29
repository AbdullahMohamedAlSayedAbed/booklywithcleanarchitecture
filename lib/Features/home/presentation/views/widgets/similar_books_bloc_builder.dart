import 'package:booklywithcleanarchitecture/Features/home/presentation/view_models/similar_cubit/similar_books_cubit.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/feature_list_view_item_loading_indector.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/featured_books_list_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksBlocBuilder extends StatelessWidget {
  const SimilarBooksBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return FeaturedBooksListViewItem(
            isSimilar: true,
            height: .15,
            width: 10,
            bookEntity: state.books,
          );
        } else if (state is SimilarBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const FeaturedListViewLoadingIndicator(
            height: .15,
          );
        }
      },
    );
  }
}
