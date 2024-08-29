import 'package:booklywithcleanarchitecture/Features/search/presentation/view_model/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_text_field.dart';
import 'search_list_view_bloc_builder.dart';

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
