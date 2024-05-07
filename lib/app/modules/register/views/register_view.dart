import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';
import 'package:miniproject/app/routes/app_pages.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/Bg-Login Register.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 100),
                  child: const Text(
                    'Register Your Account',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 9, 20),
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: 'Username berupa email',
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Name',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: controller.nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: 'Masukkan Nama',
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Address',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: controller.addressController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: 'Masukkan Alamat',
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Phone Number',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: controller.phonenumberController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: 'Masukkan nomor HP',
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Password',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: 'Masukkan Password',
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Confirm Password',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: controller.confirmController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: 'Konfirmasi Password Anda',
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.fromLTRB(10, 0, 16, 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  Color.fromARGB(255, 190, 66, 140),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Register'),
                            onPressed: () {
                              controller.register();
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed(Routes.LOGIN);
                            },
                            child: Text(
                              ' Log in',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
