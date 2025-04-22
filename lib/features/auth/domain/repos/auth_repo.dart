import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/core/errors/failure.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword(
     String email,
     String password,
     String name,
  );
}
