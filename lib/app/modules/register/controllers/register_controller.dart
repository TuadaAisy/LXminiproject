import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miniproject/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String address = addressController.text.trim();
    String phonenumber = phonenumberController.text.trim();
    String password = passwordController.text;

    Map<String, dynamic> userData = {
      'email': email,
      'name': name,
      'address': address,
      'phonenumber': phonenumber,
    };

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email,
             password: password);

      String userId = userCredential.user!.uid;

      await _firestore.collection('users').doc(userId).set(userData);

      Get.snackbar('Success', 'Registrasi berhasil',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(12)
          );

      clearControllers();
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      print('Error registering user: $e');

      Get.snackbar(
        'Error',
        'Gagal Registrasi, Coba lagi',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    }
  }

  void clearControllers() {
    emailController.clear();
    nameController.clear();
    addressController.clear();
    phonenumberController.clear();
    passwordController.clear();
    confirmController.clear();
  }
}