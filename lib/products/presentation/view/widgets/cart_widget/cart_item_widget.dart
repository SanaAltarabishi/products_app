import 'package:flutter/material.dart';
import 'package:products/core/resources/colors.dart';
import 'package:products/core/resources/strings.dart';
import 'package:products/core/utils/build_context.dart';
import 'package:products/products/domain/entities/products_entity.dart';
import 'package:products/products/presentation/provider/cart_provider.dart';
import 'package:products/products/presentation/view/widgets/network_image_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.product,
    required this.cartProvider,
  });

  final IndividualProductEntity product;
  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.18,
      child: Card(
        color: AppColors.textColor,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListTile(
          leading: NetworkImageWidget(
            image: product.thumbnail,
          ),
          title: Text(
            product.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("${AppStrings.price}${product.price}"),
          trailing: IconButton(
            onPressed: () {
              cartProvider.removeFromCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.redColor,
                  content:
                      Text("${product.title}${AppStrings.removedFromCart}"),
                ),
              );
            },
            icon: const Icon(
              Icons.delete,
              color: AppColors.redColor,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
