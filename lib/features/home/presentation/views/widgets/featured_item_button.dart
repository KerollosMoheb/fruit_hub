import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_text_styles.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FittedBox(
            child: Text(
              'تسوق الان',
              style: TextStyles.bold13.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
