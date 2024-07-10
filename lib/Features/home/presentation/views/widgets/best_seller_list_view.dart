import 'package:booklywithcleanarchitecture/Features/home/domain/entities/book_entity.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/cupertino.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return  BestSellerItem(book: books[index],);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20));
  }
}
