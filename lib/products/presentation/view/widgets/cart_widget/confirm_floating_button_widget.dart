import 'package:flutter/material.dart';
import 'package:products/core/resources/colors.dart';
import 'package:products/core/resources/strings.dart';

class ConfirmFloatinButton extends StatelessWidget {
  const ConfirmFloatinButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppColors.textColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: () {},
      tooltip: AppStrings.confirm,
      label: const Icon(
        Icons.check,
        color: AppColors.backgroundColor,
        size: 30,
      ),
    );
  }
}
