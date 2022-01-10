import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paikarilimited_quicktech/Boilerplate/allproductsscreenBoilerplate.dart';
import 'package:paikarilimited_quicktech/Boilerplate/loginscreenboilerplate.dart';
import 'package:paikarilimited_quicktech/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

String woocommerceusername = 'ck_2ac27102d6ac7a3a83c8ef047aff774bb3a8edae';
String woocommercepassword = 'cs_8b5cff09fd4580bcfc0616dcc42678c10839f972';
