import 'package:flutter/material.dart';
import 'package:products/core/resources/colors.dart';
import 'package:products/core/resources/strings.dart';
import 'package:products/core/utils/build_context.dart';
import 'package:products/products/domain/entities/products_entity.dart';
import 'package:products/products/presentation/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class AddToCardButton extends StatefulWidget {
  const AddToCardButton({
    super.key,
    required this.product,
  });

  final IndividualProductEntity product;

  @override
  State<AddToCardButton> createState() => _AddToCardButtonState();
}

class _AddToCardButtonState extends State<AddToCardButton> {
  bool isExpanded = false;
  void _toggleButton() {
    setState(() {
      isExpanded = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          isExpanded = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _toggleButton();
          final cartProvider =
              Provider.of<CartProvider>(context, listen: false);
          cartProvider.addToCart(widget.product);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.priceColor,
              content: Text(
                '${widget.product.title}${AppStrings.addedToCard}',
              ),
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          height: context.screenHeight * 0.07,
          width: isExpanded
              ? context.screenWidth * 0.4
              : context.screenWidth * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isExpanded ? 50 : 10),
            color: isExpanded ? AppColors.secondaryColor : AppColors.textColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isExpanded)
                SizedBox(
                  width: context.screenWidth * 0.05,
                ),
              Icon(
                isExpanded ? Icons.check : Icons.shopping_cart,
                color:
                    isExpanded ? AppColors.textColor : AppColors.secondaryColor,
              ),
              if (isExpanded)
                const Expanded(
                  child: Text(
                    AppStrings.addToCart,
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
