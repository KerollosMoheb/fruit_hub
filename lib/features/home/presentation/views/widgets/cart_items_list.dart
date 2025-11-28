import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_e_commerce_app/features/home/presentation/views/widgets/cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => CustomDivider(),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CartItem(cartItemEntity: cartItems[index]),
        );
      },
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: Color(0xfff1f1f5), height: 22);
  }
}
