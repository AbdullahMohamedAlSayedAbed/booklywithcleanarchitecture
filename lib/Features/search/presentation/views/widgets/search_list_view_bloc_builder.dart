// import 'dart:developer';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:booklywithcleanarchitecture/Features/search/presentation/view_model/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListViewBlocBuilder extends StatelessWidget {
  const SearchListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return BestSellerItem(
                  book: state.books[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 15),
            ),
          );
        } else if (state is SearchBooksFailure) {
          // log(state.errMessage);
          return const Center(child: Text('there is no results'));
        } else {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: LinearProgressIndicator(),
          );
        }
      },
    );
  }
}
