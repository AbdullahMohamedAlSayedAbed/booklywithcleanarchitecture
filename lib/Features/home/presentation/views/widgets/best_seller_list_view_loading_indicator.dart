import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'best_seller_item_loading.dart';

class BestSellerListLoadingIndicator extends StatelessWidget {
  const BestSellerListLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const BestSellerItemLoading();
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20));
  }
}
