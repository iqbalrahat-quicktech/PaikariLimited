import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:paikarilimited_quicktech/Boilerplate/boilerplateCheckOutScreen.dart';
import 'package:paikarilimited_quicktech/Boilerplate/boilerplateSearchScreen.dart';
import 'package:paikarilimited_quicktech/CartDatabase/sqflitedatabase.dart';
import 'package:paikarilimited_quicktech/cartscreen.dart';
import 'package:paikarilimited_quicktech/homescreen.dart';
import 'package:paikarilimited_quicktech/loginscreen.dart';
import 'package:paikarilimited_quicktech/signupscreen.dart';
import 'package:provider/provider.dart';
import 'Provider/cartprovider.dart';
import 'di_container.dart' as di;
import 'package:geolocator/geolocator.dart';

SqfliteDatabase abc = SqfliteDatabase();

void main() async {
  getfinalpos();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await abc.init();
  await Firebase.initializeApp();
  // runApp(const MyApp());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<CartProvider>()),
    ],
    child: const MyApp(),
  ));
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
      home: const SignUpScreen(),
    );
  }
}

String woocommerceusername = 'ck_2ac27102d6ac7a3a83c8ef047aff774bb3a8edae';
String woocommercepassword = 'cs_8b5cff09fd4580bcfc0616dcc42678c10839f972';

Position? currentpos;
String? currentaddress;

// Future<Position> getpos() async {
//   // LocationPermission permission;
//   // permission = await Geolocator.checkPermission();

//   // if (permission == LocationPermission.denied) {
//   //   permission = await Geolocator.requestPermission();
//   // } else {
//   //   print("LOCATION NOT AVAILABLE");
//   // }

//   return await Geolocator.getCurrentPosition();
// }

void getaddress(latitude, longitude) async {
  try {
    List<Placemark> placemark = await GeocodingPlatform.instance
        .placemarkFromCoordinates(latitude, longitude);

    Placemark place = placemark[0];
    currentaddress = "${place.locality}, ${place.street}, ";
    print(currentaddress);
    print(currentaddress);
  } catch (e) {
    print(e);
  }
}

getfinalpos() async {
  try {
    currentpos = await Geolocator.getCurrentPosition();
    print("THIS IS ADDRESS" + currentpos.toString());
  } catch (e) {
    print(e);
  }

  getaddress(currentpos?.latitude, currentpos?.longitude);
  print("THIS IS ADDRESS" + currentaddress.toString());
}
