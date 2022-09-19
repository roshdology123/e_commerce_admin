import 'package:e_commerce_admin/screens/screens.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.signInAnonymously();
  FirebaseAppCheck.instance
      .activate(webRecaptchaSiteKey: 'AA194EFE-5266-4079-BEDF-BF41CAE48D0A');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'eCommerce Admin',
        theme: themeData(),
        home: const HomeScreen(),
        getPages: [
          GetPage(name: '/products', page: () => ProductsScreen()),
          GetPage(name: '/products/new', page: () => NewProductScreen()),
          GetPage(name: '/orders', page: () => OrderScreen()),
        ]);
  }
}
