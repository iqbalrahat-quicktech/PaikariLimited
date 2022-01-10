import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:paikarilimited_quicktech/Controllers/productdetailscontroller.dart';
import 'package:paikarilimited_quicktech/Fixed%20Variables/fixedvariables.dart';
import 'package:paikarilimited_quicktech/Models/product_details_model.dart';
import 'package:paikarilimited_quicktech/commonwidgets.dart';
import 'package:paikarilimited_quicktech/homescreen.dart';
import 'package:http/http.dart' as http;
import 'package:paikarilimited_quicktech/main.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;

    final ProductDetailsController productdetailscontroller =
        Get.put(ProductDetailsController());

    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: CommonAppBar(context),
      drawer: Sidenav(size),
      body: SingleChildScrollView(
          child: FutureBuilder<ProductDetails>(
              future: GetDetails("10"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: double.infinity,
                          height: size.height * 40,
                          child: Image(
                            image: NetworkImage(
                                snapshot.data!.images![0].src.toString()
                                // "https://previews.123rf.com/images/stable/stable1309/stable130900048/22291995-dozen-of-eggs-in-carton.jpg",
                                ),
                            fit: BoxFit.cover,
                          )),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(snapshot.data!.name.toString(),
                                    style: GoogleFonts.openSans(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                                whitespace(context, 2, 0),
                                Text(
                                  snapshot.data!.regularPrice.toString(),
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    // fontSize: 18,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Text(
                                  snapshot.data!.price.toString(),
                                  style: GoogleFonts.openSans(
                                    color: redcolor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          // ignore: prefer_const_constructors
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: const Icon(
                              Ionicons.add_circle_outline,
                              color: Colors.white,
                              size: 35,
                            ),
                          )
                        ],
                      ),
                      whitespace(context, 2, 0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          snapshot.data!.description.toString(),
                          // productdetailscontroller
                          //     .productdetails.value.description
                          //     .toString(),
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                            color: Colors.white70,
                          )),
                        ),
                      )
                    ],
                  );
                } else {
                  return Container(
                    // height: double.infinity,
                    height: size.height * 80,
                    alignment: Alignment.center,
                    child: const CupertinoActivityIndicator(
                      radius: 20,
                    ),
                  );
                }
              })),
    );
  }

  Future<ProductDetails> GetDetails(String id) async {
    String basicAuth = 'Basic ' +
        base64Encode(utf8.encode('$woocommerceusername:$woocommercepassword'));
    final response = await http.get(
        Uri.parse('https://paikarilimited.com/wp-json/wc/v3/products/6238'),
        headers: <String, String>{'authorization': basicAuth});

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ProductDetails.fromJson(data);
    } else {
      return ProductDetails.fromJson(data);
    }
  }
}