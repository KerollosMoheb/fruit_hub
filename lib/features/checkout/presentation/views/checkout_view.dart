import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/helper_functions/get_user.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const String routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'الشحن',
        isNotificationVisible: false,
      ),
      body: Provider.value(
        value: OrderEntity(
          uID: getUser().uId,
          cartEntity,
          shippingAddressEntity: ShippingAddressEntity(),
        ),
        child: CheckoutViewBody(),
      ),
    );
  }
}
