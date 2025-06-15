import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/home/presentation/views/widgets/custom_bottom_mavigation_bar.dart';
import 'package:fruits_e_commerce_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomMavigationBar(),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
