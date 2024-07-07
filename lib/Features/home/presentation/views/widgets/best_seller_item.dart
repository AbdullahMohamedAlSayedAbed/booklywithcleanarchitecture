import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/custom_image.dart';
import 'package:booklywithcleanarchitecture/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';

import 'book_rating.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 110,
      child: Row(
        children: [
          const CustomImage(),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Harry Potter and the Goblet of Fire',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                    style: Styles.style20),
                const SizedBox(height: 3),
                const Text('J.K. Rowling', maxLines: 1, style: Styles.style14),
                Row(
                  children: [
                    Text(
                      '19.99 €',
                      style:
                          Styles.style20.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const BookRating(),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}