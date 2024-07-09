import 'package:booklywithcleanarchitecture/Features/home/presentation/view_models/newest_cubit/newest_books_cubit.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewBlocBuilder extends StatelessWidget {
  const BestSellerListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return BestSellerListView(
            books: state.books,
          );
        } else if (state is NewestBooksFailure) {
          print('error ::::: ${state.errMessage}');
          return SliverToBoxAdapter(child: Text(state.errMessage));
        } else {
          return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
