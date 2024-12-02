import 'package:flutter/material.dart';
import 'package:products/core/resources/colors.dart';
import 'package:products/core/utils/build_context.dart';
import 'package:products/products/domain/entities/products_entity.dart';
import 'package:products/products/presentation/view/widgets/network_image_widget.dart';

class ProductsImageGallery extends StatelessWidget {
  final IndividualProductEntity product;
  final List<Widget> Function(double rating) buildStars;

  const ProductsImageGallery(
      {super.key, required this.product, required this.buildStars});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: product.images.map((imageUrl) {
                  return Container(
                    height: context.screenHeight * 0.2,
                    width: context.screenWidth * 0.5,
                    margin: const EdgeInsets.only(right: 10),
                    child: NetworkImageWidget(
                      image: imageUrl,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "\$${product.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.priceColor,
                      ),
                    ),
                    const Spacer(),
                    ...buildStars(product.rating),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  product.category,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
