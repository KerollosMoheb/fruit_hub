import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/errors/failure.dart';
import 'package:fruits_e_commerce_app/core/models/product_model.dart';
import 'package:fruits_e_commerce_app/core/repos/products_repo/product_repo.dart';
import 'package:fruits_e_commerce_app/core/services/data_service.dart';
import 'package:fruits_e_commerce_app/core/utils/backend_endpoint.dart';

class ProductRepoImpl extends ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseService.getData(path: BackendEndpoint.getProducts)
              as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      return Right(products);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch products'));
    }
  }
}
