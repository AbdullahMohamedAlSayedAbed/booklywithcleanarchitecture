import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/best_seller_list_view_loading_indicator.dart';
import 'package:booklywithcleanarchitecture/Features/search/presentation/view_model/search_books_cubit/search_books_cubit.dart';
import 'package:booklywithcleanarchitecture/core/utils/functions/build_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: CustomTextField(
            onChanged: (value) {
              BlocProvider.of<SearchBooksCubit>(context)
                  .fetchSearchBooks(value);
            },
          ),
        ),
        const SearchListViewBlocBuilder()
      ],
    );
  }
}

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
          return buildErrorFunctions(errMessage: state.errMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
