import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:products/core/resources/colors.dart';
import 'package:products/core/resources/strings.dart';
import 'package:products/products/domain/entities/products_entity.dart';
import 'package:products/products/presentation/view/widgets/details_widget/add_to_card_button.dart';
import 'package:products/products/presentation/view/widgets/details_widget/details_card_widget.dart';
import 'package:products/products/presentation/view/widgets/products_app_bar.dart';
import 'package:products/products/presentation/view/widgets/details_widget/products_image_gallery_widget.dart';
import 'package:products/products/presentation/view/widgets/details_widget/review_card_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  final IndividualProductEntity product;

  const ProductDetailsPage({required this.product, super.key});

  List<Widget> _buildStars(double rating) {
    int fullStars = rating.floor();
    int halfStars = (rating - fullStars >= 0.5) ? 1 : 0;
    int emptyStars = 5 - fullStars - halfStars;

    return [
      for (int i = 0; i < fullStars; i++)
        const Icon(Icons.star, color: AppColors.starsColor),
      for (int i = 0; i < halfStars; i++)
        const Icon(Icons.star_half, color: AppColors.starsColor),
      for (int i = 0; i < emptyStars; i++)
        const Icon(Icons.star_border, color: AppColors.starsColor),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const ProductsAppBar(
        title: AppStrings.productDetailsTitle,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductsImageGallery(
              product: product,
              buildStars: _buildStars,
            ).animate().fade(delay: 0.1.seconds, duration: 0.2.seconds),
            const SizedBox(height: 10),
            _buildSectionHeader(AppStrings.details)
                .animate()
                .fade(delay: 0.15.seconds, duration: 0.25.seconds),
            const SizedBox(height: 10),
            DetailsCardWidget(product: product)
                .animate()
                .fade(delay: 0.2.seconds, duration: 0.3.seconds),
            const SizedBox(height: 10),
            _buildSectionHeader(AppStrings.reviews)
                .animate()
                .fade(delay: 0.25.seconds, duration: 0.35.seconds),
            const SizedBox(height: 10),
            ...product.reviews.map(
              (review) {
                return ReviewsCardWidget(
                  review: review,
                  buildStars: _buildStars,
                ).animate().fade(delay: 0.3.seconds, duration: 0.4.seconds);
              },
            ),
            const SizedBox(height: 20),
            AddToCardButton(product: product)
                .animate()
                .fade(delay: 0.35.seconds, duration: 0.45.seconds),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
      ),
    );
  }
}
