
import 'package:flutter/material.dart';
import 'package:products/core/resources/colors.dart';
import 'package:products/products/domain/entities/sub_entities/review_entity.dart';

class ReviewsCardWidget extends StatelessWidget {
  final ReviewEntity review;
  final List<Widget> Function(double rating) buildStars;
  const ReviewsCardWidget(
      {super.key, required this.review, required this.buildStars});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.textColor,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 2,
      child: ListTile(
        title: Text(
          review.reviewerName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Row(
              children: buildStars(review.rating.toDouble()),
            ),
            const SizedBox(height: 5),
            Text(review.comment),
          ],
        ),
      ),
    );
  }
}
