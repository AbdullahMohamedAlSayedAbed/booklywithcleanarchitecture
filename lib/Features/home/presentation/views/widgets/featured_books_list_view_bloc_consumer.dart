import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/view_models/featured_cubit/featured_books_cubit.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/feature_list_view_item_loading_indector.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/featured_books_list_view_item.dart';
import 'package:booklywithcleanarchitecture/core/utils/functions/build_error_snack_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() =>
      _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState
    extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorFunctions(errMessage: state.errMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksListViewItem(
            isSimilar: false,
            bookEntity: books,
            height: .3,
          );
        } else if (state is FeaturedBooksFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          // return const Center(child: CircularProgressIndicator());
          return const FeaturedListViewLoadingIndicator();
        }
      },
    );
  }
}
