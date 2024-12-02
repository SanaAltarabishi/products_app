import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/resources/colors.dart';

class ProductsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const ProductsAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w600,
          shadows: [
            Shadow(
              color: AppColors.primaryColor,
              offset: Offset(-2, -2),
              blurRadius: 2,
            )
          ],
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.textColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
