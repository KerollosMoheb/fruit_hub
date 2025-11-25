import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';

import '../../entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}
