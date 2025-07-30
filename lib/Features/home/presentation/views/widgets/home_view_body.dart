import 'package:booklywithcleanarchitecture/Features/home/presentation/view_models/newest_cubit/newest_books_cubit.dart';
import 'package:booklywithcleanarchitecture/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_list_view_bloc_builder.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view_bloc_consumer.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final ScrollController _scrollController;
  int nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    if (_scrollController.position.pixels >=
        0.7 * _scrollController.position.maxScrollExtent) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewestBooksCubit>(context)
            .fetchNewestBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: const [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedBooksListViewBlocConsumer(),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 49, bottom: 20),
                child: Text('Best Seller', style: Styles.style18),
              ),
            ],
          ),
        ),
        BestSellerListViewBlocConsumer(),
      ],
    );
  }
}
