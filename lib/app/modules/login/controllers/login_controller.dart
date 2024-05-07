import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<User?> get streamAuthStatus =>
      FirebaseAuth.instance.authStateChanges();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        Get.snackbar(
          'Error',
          'Email dan Password wajib diisi',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(12),
        );
        return;
      }
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      DocumentSnapshot userDoc = await firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (userDoc.exists) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar(
          'error',
          'User data tidak ditemukan',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(12),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'error',
          'User dengan email tersebut tidak ditemukan',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(12),
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'error',
          'Katasandi salah',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(12),
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to sign in: ${e.message}',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(12),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An unexpected error occurred: $e',
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(12),
      );
    }
  }

  void increment() => count.value++;
}
