import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/cupertino.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {


  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return  BestSellerItem(book: widget.books[index],);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20));
  }
}
