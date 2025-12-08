import 'package:fruits_e_commerce_app/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_e_commerce_app/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  factory OrderModel.fromEntity(OrderEntity order) {
    return OrderModel(
      totalPrice: order.cartEntity.calculateTotalPrice(),
      uId: order.uID,
      shippingAddressModel: ShippingAddressModel.fromEntity(
        order.shippingAddressEntity,
      ),
      orderProducts:
          order.cartEntity.cartItems
              .map((e) => OrderProductModel.fromEntity(cartItemEntity: e))
              .toList(),
      paymentMethod: order.payWithCash! ? 'Cash' : 'PayPal',
    );
  }

  toJson() {
    return {
      'totalPrice': totalPrice,
      'uId': uId,
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
