import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/resources/colors.dart';
import 'package:products/core/resources/keys.dart';
import 'package:products/core/resources/strings.dart';
import 'package:products/core/utils/build_context.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2550), () {
      context.go(AppKeys.productPageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppStrings.splashImage,
              width: context.screenHeight * 0.2,
              height: context.screenHeight * 0.2,
              fit: BoxFit.cover,
            )
                .animate()
                .fadeIn(duration: 1.5.seconds, delay: 0.1.seconds)
                .then()
                .animate(
                  onComplete: (controller) => controller.repeat(),
                )
                .shimmer(
                  duration: 2000.ms,
                  colors: AppColors.shimmerColor,
                ),
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Icon(
                      Icons.auto_awesome,
                      color: AppColors.secondaryColor,
                      size: context.screenWidth * 0.068,
                    ),
                    Icon(Icons.auto_awesome,
                        color: AppColors.textColor,
                        size: context.screenWidth * 0.06 //25,
                        ),
                  ],
                ),
                SizedBox(
                  width: context.screenWidth * 0.04,
                ),
                const Text(
                  AppStrings.productAppTitle,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: AppColors.secondaryColor,
                        offset: Offset(3, 2),
                        blurRadius: 2,
                      )
                    ],
                  ),
                ),
              ],
            ).animate().fadeIn(duration: 2.seconds, delay: 0.2.seconds)
          ],
        ),
      ),
    );
  }
}
