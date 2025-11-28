// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 0});

  num calculateTotalPrice() {
    return productEntity.price * count;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * count;
  }

  increaseCount() {
    count++;
  }

  decreaseCount() {
    count--;
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}
