import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/helper_functions/get_user.dart';
import 'package:fruits_e_commerce_app/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_e_commerce_app/core/services/get_it_service.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const String routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt<OrdersRepo>()),
      child: Scaffold(
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
          child: AddOrderCubitBlocBuilder(child: CheckoutViewBody()),
        ),
      ),
    );
  }
}
