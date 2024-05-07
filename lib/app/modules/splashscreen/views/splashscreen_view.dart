import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';
import 'package:miniproject/app/routes/app_pages.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), (() {
      Get.offAllNamed(Routes.LOGIN);
    }));
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/Bg-Spalsh Screen.png', fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 200),
            child: Center(
              child: Image.asset(
                'assets/images/bunga_ungu.png',
                width: 229.51,
                height: 149.8,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 200, 0, 90),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    text: "HELLO FELLAS.\n",
                    children: [
                      TextSpan(
                        text:
                            " Temukan segala jenis bunga \n",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text:
                            "dari berbagai belahan dunia",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
