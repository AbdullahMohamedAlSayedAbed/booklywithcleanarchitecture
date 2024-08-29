import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/custom_image_loading_indicator.dart';
import 'package:booklywithcleanarchitecture/core/widgets/custom_fading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BestSellerItemLoading extends StatelessWidget {
  const BestSellerItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 110,
      child: Row(
        children: [
          const CustomFadingWidget(child: CustomBookImageLoadingIndicator()),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomFadingWidget(
                    child: boxLoading(),
                  ),
                ),
                const SizedBox(height: 3),
                Expanded(
                  child: CustomFadingWidget(
                    child: boxLoading(),
                  ),
                ),
                const SizedBox(height: 3),
              ],
            ),
          )
        ],
      ),
    );
  }

  AspectRatio boxLoading() {
    return AspectRatio(
        aspectRatio: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: Colors.grey[50],
          ),
        ));
  }
}
