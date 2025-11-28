import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_e_commerce_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_e_commerce_app/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruits_e_commerce_app/features/home/presentation/views/widgets/cart_items_list.dart';
import 'package:fruits_e_commerce_app/features/home/presentation/views/widgets/custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: kTopPadding),
                  buildAppBar(
                    context,
                    title: "السلة ",
                    isNotificationVisible: false,
                  ),
                  SizedBox(height: 12),
                  CartHeader(),
                  SizedBox(height: 12),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child:
                  context.read<CartCubit>().cartEntity.cartItems.isEmpty
                      ? SizedBox()
                      : CustomDivider(),
            ),
            CartItemsList(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child:
                  context.read<CartCubit>().cartEntity.cartItems.isEmpty
                      ? SizedBox()
                      : CustomDivider(),
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * 0.07,
          child: CustomCartButton(),
        ),
      ],
    );
  }
}
