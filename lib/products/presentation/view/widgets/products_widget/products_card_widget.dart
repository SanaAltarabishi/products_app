import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/resources/colors.dart';
import 'package:products/core/resources/keys.dart';
import 'package:products/products/domain/entities/products_entity.dart';
import 'package:products/products/presentation/view/widgets/network_image_widget.dart';

class ProductCard extends StatelessWidget {
  final IndividualProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          AppKeys.productDetailsPageKey,
          extra: product,
        );
      },
      child: Card(
        color: AppColors.textColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: NetworkImageWidget(
                image: product.thumbnail,
              ),
            ),
            SizedBox(height: 10),
            Text(
              product.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              "\$${product.price.toStringAsFixed(2)}",
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
