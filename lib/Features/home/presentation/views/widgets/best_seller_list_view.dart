import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/cupertino.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
        itemCount: 20,
        itemBuilder: (context, index) {
          return const BestSellerItem();
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20));
  }
}
