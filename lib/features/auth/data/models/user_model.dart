import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.uId, required super.name, required super.email});
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uId: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      name: json['name'],
      email: json['email'],
    );
  }
  factory UserModel.fromEntity(UserEntity user){
    return UserModel(
      uId: user.uId,
      name: user.name,
      email: user.email,
    );
  }
  toMap() {
    return {'uId': uId, 'name': name, 'email': email};
  }
}
