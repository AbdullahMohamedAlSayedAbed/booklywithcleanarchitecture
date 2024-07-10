import 'package:booklywithcleanarchitecture/Features/home/presentation/views/widgets/feature_list_view_item_loading_indector.dart';
import 'package:booklywithcleanarchitecture/core/utils/app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, this.image});
  final String? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.kBookDetailsView),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const FeaturedListViewLoadingIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl: image ?? '')),
      ),
    );
  }
}
