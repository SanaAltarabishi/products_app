import 'package:flutter/material.dart';
import 'package:products/core/resources/colors.dart';

class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected; //void Function(String)
  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            return GestureDetector(
              onTap: () => onCategorySelected(category),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: selectedCategory == category
                      ? AppColors.primaryColor
                      : AppColors.textColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color: selectedCategory == category
                        ? AppColors.textColor
                        : AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: selectedCategory == category
                            ? AppColors.blackColor
                            : AppColors.secondaryColor,
                        offset: const Offset(0, 1),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
