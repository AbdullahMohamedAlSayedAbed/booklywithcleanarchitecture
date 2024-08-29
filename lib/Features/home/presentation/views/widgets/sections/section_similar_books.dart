import 'package:booklywithcleanarchitecture/Features/home/presentation/view_models/similar_cubit/similar_books_cubit.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/custom_image_loading_indicator.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/featured_books_list_view_item.dart';
import 'package:booklywithcleanarchitecture/core/utils/styles.dart';
import 'package:booklywithcleanarchitecture/core/widgets/custom_fading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../similar_books_bloc_builder.dart';

class SectionSimilarBooks extends StatelessWidget {
  const SectionSimilarBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text('You can also like',
              style: Styles.style14.copyWith(fontWeight: FontWeight.w600)),
        ),
        const SimilarBooksBlocBuilder(),
        const SizedBox(height: 40),
      ],
    );
  }
}
