import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_images.dart';
import 'package:fruits_e_commerce_app/core/utils/app_text_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_network_image.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_e_commerce_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_e_commerce_app/features/home/presentation/cubits/cart_item/cart_item_cubit.dart';
import 'package:fruits_e_commerce_app/features/home/presentation/views/widgets/cart_item_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 73,
                height: 92,
                decoration: BoxDecoration(color: Color(0xfff3f5f7)),
                child: CustomNetworkImage(
                  imageUrl: cartItemEntity.productEntity.imageUrl!,
                ),
              ),
              SizedBox(width: 17),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartItemEntity.productEntity.name,
                          style: TextStyles.bold13,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().deleteCartItem(
                              cartItemEntity,
                            );
                          },
                          child: SvgPicture.asset(Assets.imagesTrash),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      "${cartItemEntity.calculateTotalWeight()} كم",
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        CartItemActionButtons(cartItemEntity: cartItemEntity),
                        Spacer(),
                        Text(
                          "${cartItemEntity.calculateTotalPrice()} جنية",
                          style: TextStyles.bold16.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
