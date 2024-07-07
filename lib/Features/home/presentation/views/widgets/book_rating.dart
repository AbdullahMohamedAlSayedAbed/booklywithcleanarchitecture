import 'package:booklywithcleanarchitecture/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, this.mainAxisAlignment = MainAxisAlignment.start});
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 13,
          color: Color(0xffFFDD4F),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 6.3, right: 9),
          child: Text('4.8', style: Styles.style16),
        ),
        Opacity(
            opacity: .5,
            child: Text('(2390)',
                style: Styles.style14.copyWith(fontWeight: FontWeight.w400))),
      ],
    );
  }
}
