import 'dart:io';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  final num sellingCount;
  String? imageUrl;
  final int expirationMonths;
  bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.price,
    required this.reviews,
    required this.image,
    required this.isFeatured,
    required this.isOrganic,
    this.imageUrl,
    required this.sellingCount,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      code: json['code'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      isFeatured: json['isFeatured'] ?? false,
      expirationMonths: json['expirationMonths'] ?? 0,
      numberOfCalories: json['numberOfCalories'] ?? 0,
      unitAmount: json['unitAmount'] ?? 0,
      isOrganic: json['isOrganic'] ?? false,
      reviews:
          (json['reviews'] as List)
              .map((review) => ReviewModel.fromJson(review))
              .toList(),
      image: File(json['imagePath']),
      sellingCount: json['sellingCount'] ?? 0,
    );
  }
  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      imageUrl: imageUrl,
      isFeatured: isFeatured,
      expirationMonths: expirationMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isOrganic: isOrganic,
      image: image,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'sellingCount': sellingCount,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'expirationMonths': expirationMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
