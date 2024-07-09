import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'custom_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: CustomTextField(),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: 1,
            itemBuilder: (context, index) {
              // return const BestSellerItem();
              return Container();
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 15),
          ),
        )
      ],
    );
  }
}
