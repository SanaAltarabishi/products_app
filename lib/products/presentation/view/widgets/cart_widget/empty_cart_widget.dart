import 'package:flutter/material.dart';
import 'package:products/core/resources/colors.dart';
import 'package:products/core/resources/strings.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppStrings.cartEmpty,
        style: TextStyle(
          color: AppColors.textColor,
          fontSize: 30,
          shadows: [
            Shadow(
              color: AppColors.blackColor,
              offset: Offset(-3, 2),
            )
          ],
        ),
      ),
    );
  }
}
