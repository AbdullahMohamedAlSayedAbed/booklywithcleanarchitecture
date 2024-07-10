import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/view_models/featured_cubit/featured_books_cubit.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewItem extends StatefulWidget {
  const FeaturedBooksListViewItem(
      {super.key, required this.height, this.width, required this.bookEntity});
  final double height;
  final double? width;
  final List<BookEntity> bookEntity;

  @override
  State<FeaturedBooksListViewItem> createState() =>
      _FeaturedBooksListViewItemState();
}

class _FeaturedBooksListViewItemState extends State<FeaturedBooksListViewItem> {
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
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage++);
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * widget.height,
      child: ListView.separated(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.bookEntity.length,
        itemBuilder: (context, index) => CustomImage(
          image: widget.bookEntity[index].image,
        ),
        separatorBuilder: (BuildContext context, _) =>
            SizedBox(width: widget.width ?? 15),
      ),
    );
  }
}
