import 'package:flutter/material.dart';
import 'package:products/core/resources/colors.dart';
import 'package:products/core/utils/build_context.dart';

class ProductsFailureWidget extends StatelessWidget {
  final String text;
  const ProductsFailureWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off,
            color: AppColors.primaryColor,
            size: 40,
          ),
          SizedBox(
            width: context.screenWidth * 0.03,
          ),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
