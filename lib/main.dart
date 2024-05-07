import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAUY4gj6cZ9yf12tgAPghzGP26RteHMDiI",
        appId: "1:857369775276:android:7d34a810c289ead52e6309",
        messagingSenderId: "857369775276",
        projectId: "miniprojectlx"),
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: Routes.SPLASHSCREEN,
      getPages: AppPages.routes,
    )
  );
}
