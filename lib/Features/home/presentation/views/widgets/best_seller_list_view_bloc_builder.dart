import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/view_models/newest_cubit/newest_books_cubit.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/best_seller_list_view_loading_indicator.dart';
import 'package:booklywithcleanarchitecture/core/utils/functions/build_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewBlocConsumer extends StatefulWidget {
  const BestSellerListViewBlocConsumer({
    super.key,
  });

  @override
  State<BestSellerListViewBlocConsumer> createState() =>
      _BestSellerListViewBlocConsumerState();
}

class _BestSellerListViewBlocConsumerState
    extends State<BestSellerListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is NewestBooksPaginationFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(buildErrorFunctions(errMessage: state.errMessage));
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationLoading ||
            state is NewestBooksPaginationFailure) {
          return BestSellerListView(
            books: books,
          );
        } else if (state is NewestBooksFailure) {
          // print('error ::::: ${state.errMessage}');
          return SliverToBoxAdapter(
              child: Center(
                  child: Text(
            state.errMessage,
            textAlign: TextAlign.center,
          )));
        } else {
          return const BestSellerListLoadingIndicator();
        }
      },
    );
  }
}
