import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_e_commerce_app/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser?.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code: ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الكلمة المرور ضعيفة جدا.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'لالبريد الإلكتروني مستخدم بالفعل.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: ' يرجى التحقق من اتصالك بالإنترنت.');
      } else {
        throw CustomException(message: 'لقد حدث خطأ غير معروف.');
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}',
      );

      throw CustomException(message: 'لقد حدث خطأ غير معروف.');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code: ${e.code}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(
          message: 'البريد الإلكتروني او كلمة المرور غير موجود.',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: 'البريد الإلكتروني او كلمة المرور غير موجود.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: ' يرجى التحقق من اتصالك بالإنترنت.');
      } else {
        throw CustomException(message: 'لقد حدث خطأ غير معروف.');
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}',
      );

      throw CustomException(message: 'لقد حدث خطأ غير معروف.');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }
}
