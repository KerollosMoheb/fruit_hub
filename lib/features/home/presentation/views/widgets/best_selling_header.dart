import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_text_styles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('الأكثر مبيعًا', style: TextStyles.bold16),
        const Spacer(),
        Text(
          'المزيد',
          style: TextStyles.regular13.copyWith(color: const Color(0xff949D9E)),
        ),
      ],
    );
  }
}
