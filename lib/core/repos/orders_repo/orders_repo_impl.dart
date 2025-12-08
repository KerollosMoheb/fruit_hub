import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';
import 'package:fruits_e_commerce_app/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_e_commerce_app/core/services/data_service.dart';
import 'package:fruits_e_commerce_app/core/utils/backend_endpoint.dart';
import 'package:fruits_e_commerce_app/features/checkout/data/models/order_model.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService fireStoreService;

  OrdersRepoImpl(this.fireStoreService);

  @override
  Future<Either<Failure, void>> addOrder({required OrderEntity order}) async {
    try {
      await fireStoreService.addData(
        path: BackendEndpoint.addOrder,
        data: OrderModel.fromEntity(order).toJson(),
      );
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
