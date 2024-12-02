import 'package:flutter/material.dart';
import 'package:products/core/resources/colors.dart';
import 'package:products/core/resources/strings.dart';
import 'package:products/products/domain/entities/products_entity.dart';

class DetailsCardWidget extends StatelessWidget {
  const DetailsCardWidget({
    super.key,
    required this.product,
  });

  final IndividualProductEntity product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: AppColors.textColor,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${AppStrings.brand}${product.brand}"),
              Text("${AppStrings.sku}${product.sku}"),
              Text("${AppStrings.stock}${product.stock}"),
              Text("${AppStrings.weight}${product.weight} g"),
// Text(
//     "${AppStrings.dimensions}${product.dimensions['width']} x ${product.dimensions['height']} x ${product.dimensions['depth']} cm"),
              Text("${AppStrings.warranty}${product.warrantyInformation}"),
            ],
          ),
        ),
      ),
    );
  }
}
