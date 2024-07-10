import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/custom_image_loading_indicator.dart';
import 'package:booklywithcleanarchitecture/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class FeaturedListViewLoadingIndicator extends StatelessWidget {
  const FeaturedListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) =>
            const CustomFadingWidget(child: CustomBookImageLoadingIndicator()),
        separatorBuilder: (BuildContext context, _) =>
            const SizedBox(width: 15),
      ),
    );
  }
}
