import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';
import 'package:fruits_e_commerce_app/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_e_commerce_app/core/services/data_service.dart';
import 'package:fruits_e_commerce_app/core/utils/backend_endpoint.dart';
import 'package:fruits_e_commerce_app/features/checkout/data/models/order_model.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService dataBaseService;

  OrdersRepoImpl(this.dataBaseService);

  @override
  Future<Either<Failure, void>> addOrder({
    required OrderInputEntity order,
  }) async {
    try {
      var orderModel = OrderModel.fromEntity(order);
      await dataBaseService.addData(
        path: BackendEndpoint.addOrder,
        documentId: orderModel.orderId,
        data: orderModel.toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
