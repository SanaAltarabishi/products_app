import 'package:flutter/material.dart';
import 'package:products/core/resources/colors.dart';
import 'package:products/core/utils/build_context.dart';

class NetworkImageWidget extends StatelessWidget {
  final String image;
  const NetworkImageWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: BoxFit.fill,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    (loadingProgress.expectedTotalBytes ?? 1)
                : null,
            color: AppColors.backgroundColor,
          ),
        );
      },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return Container(
          color: AppColors.textColor,
          height: context.screenHeight * 0.09,
          width: context.screenWidth * 0.3,
          child: Icon(
            Icons.broken_image,
            color: AppColors.backgroundColor,
            size: context.screenHeight * 0.05,
          ),
        );
      },
    );
  }
}
