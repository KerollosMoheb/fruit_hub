import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/errors/exceptions.dart';
import 'package:fruits_e_commerce_app/core/errors/failure.dart';
import 'package:fruits_e_commerce_app/core/services/data_service.dart';
import 'package:fruits_e_commerce_app/core/services/firebase_auth_service.dart';
import 'package:fruits_e_commerce_app/core/services/shared_preferences_singleton.dart';
import 'package:fruits_e_commerce_app/core/utils/backend_endpoint.dart';
import 'package:fruits_e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.databaseService,
    required this.firebaseAuthService,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(uId: user.uid, name: name, email: email);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('لقد حدث خطأ ما'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('لقد حدث خطأ ما'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checkIfDataExists(
        path: BackendEndpoint.isUserExist,
        documentId: user.uid,
      );
      if (isUserExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checkIfDataExists(
        path: BackendEndpoint.isUserExist,
        documentId: user.uid,
      );
      if (isUserExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoint.getUserData,
      documentId: uid,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }
}
