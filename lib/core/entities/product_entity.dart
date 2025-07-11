import 'dart:io';

import 'package:fruits_e_commerce_app/core/entities/review_entity.dart';


class ProductEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.reviews,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.image,
    required this.isFeatured,
    this.isOrganic = false,
    this.imageUrl,
  });
}
