import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/resources/colors.dart';
import 'package:products/core/resources/keys.dart';
import 'package:products/core/resources/strings.dart';
import 'package:products/core/utils/build_context.dart';
import 'package:products/products/domain/entities/products_entity.dart';
import 'package:products/products/presentation/bloc/products_bloc.dart';
import 'package:products/products/presentation/view/widgets/products_widget/category_selector_widget.dart';
import 'package:products/products/presentation/view/widgets/products_widget/products_card_widget.dart';
import 'package:products/products/presentation/view/widgets/products_widget/products_failure_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String selectedCategory = AppStrings.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          AppStrings.productsTitle,
          style: TextStyle(
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
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppKeys.cartPageKey);
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.primaryColor,
            ),
          )
        ],
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsSuccess) {
            List<IndividualProductEntity> products =
                state.productsEntity.products;
            List<IndividualProductEntity> displayedProducts =
                filterProducts(products, selectedCategory);
            return Column(
              children: [
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                CategorySelector(
                  categories: AppStrings.categories,
                  selectedCategory: selectedCategory,
                  onCategorySelected: (category) {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                ).animate().fadeIn(duration: 0.5.seconds, delay: .2.seconds),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2 / 3,
                    ),
                    itemCount: displayedProducts.length,
                    itemBuilder: (context, index) {
                      var product = displayedProducts[index];
                      return ProductCard(product: product).animate().scaleXY(
                          duration: (0.02 * index).seconds,
                          delay: (0.01 * index).seconds);
                    },
                  ).animate().fadeIn(duration: 0.7.seconds, delay: .4.seconds),
                ),
              ],
            );
          } else if (state is ProductsFailure) {
            return ProductsFailureWidget(
              text: state.message,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.textColor,
              ),
            );
          }
        },
      ),
    );
  }

  List<IndividualProductEntity> filterProducts(
      List<IndividualProductEntity> products, String category) {
    if (category == AppStrings.all) {
      return products;
    } else if (category == AppStrings.beauty) {
      return products
          .where((IndividualProductEntity p) => p.category == 'beauty')
          .toList();
    } else if (category == AppStrings.groceries) {
      return products
          .where((IndividualProductEntity p) => p.category == 'groceries')
          .toList();
    } else if (category == AppStrings.fragrances) {
      return products
          .where((IndividualProductEntity p) => p.category == 'fragrances')
          .toList();
    } else if (category == AppStrings.furniture) {
      return products
          .where((IndividualProductEntity p) => p.category == 'furniture')
          .toList();
    }
    // } else if (category == 'Stock') {
    //   return products
    //       .where((IndividualProductEntity p) => p.stock > 0)
    //       .toList();
    // }
    return products;
  }
}
