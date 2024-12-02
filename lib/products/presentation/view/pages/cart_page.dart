import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:products/core/resources/colors.dart';
import 'package:products/core/resources/strings.dart';
import 'package:products/products/presentation/provider/cart_provider.dart';
import 'package:products/products/presentation/view/widgets/cart_widget/cart_item_widget.dart';
import 'package:products/products/presentation/view/widgets/cart_widget/confirm_floating_button_widget.dart';
import 'package:products/products/presentation/view/widgets/cart_widget/empty_cart_widget.dart';
import 'package:products/products/presentation/view/widgets/products_app_bar.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItem = cartProvider.cartItems;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const ProductsAppBar(title: AppStrings.myCart),
      body: cartItem.isEmpty
          ? const EmptyCartWidget()
          : ListView.builder(
              itemCount: cartItem.length,
              itemBuilder: (context, index) {
                final product = cartItem[index];
                return CartItemWidget(
                  product: product,
                  cartProvider: cartProvider,
                ).animate().fade(
                    duration: (0.2 * index).seconds,
                    delay: (0.1 * index).seconds);
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          cartItem.isNotEmpty ? const ConfirmFloatinButton() : null,
    );
  }
}
