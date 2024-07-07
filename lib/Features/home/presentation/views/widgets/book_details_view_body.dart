import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/custom_image.dart';
import 'package:booklywithcleanarchitecture/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'custom_app_bar_book_details.dart';
import 'sections/section_book_details.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          children: [
            CustomAppBarBookDetails(),
            SizedBox(height: 33),
            SectionBookDetails(),
          ],
        ),
      ),
    );
  }
}
