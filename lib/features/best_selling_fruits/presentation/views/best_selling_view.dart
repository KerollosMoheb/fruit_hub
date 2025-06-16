import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_e_commerce_app/features/best_selling_fruits/presentation/views/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'best-selling-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الأكثر مبيعًا'),
      body: BestSellingViewBody(),
    );
  }
}
