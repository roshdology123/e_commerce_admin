import 'package:e_commerce_admin/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'eCommerce Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        sliderTheme: SliderThemeData(
          showValueIndicator: ShowValueIndicator.always,
          overlayShape: SliderComponentShape.noOverlay,
        )
      ),
      home: const HomeScreen(),
      getPages: [
          GetPage(name: '/products', page: () => ProductsScreen()),
          GetPage(name: '/products/new', page: () => NewProductScreen()),
        ]);
  }
}
