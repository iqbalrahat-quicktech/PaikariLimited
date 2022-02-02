import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ionicons/ionicons.dart';
import 'package:paikarilimited_quicktech/Controllers/productdetailscontroller.dart';
import 'package:paikarilimited_quicktech/Fixed%20Variables/fixedvariables.dart';
import 'package:paikarilimited_quicktech/Models/cart_model.dart';
import 'package:paikarilimited_quicktech/Models/product_details_model.dart';
import 'package:paikarilimited_quicktech/Provider/cartprovider.dart';
import 'package:paikarilimited_quicktech/commonwidgets.dart';
import 'package:paikarilimited_quicktech/homescreen.dart';
import 'package:http/http.dart' as http;
import 'package:paikarilimited_quicktech/main.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  //
  String id;
  String url;
  // const ProductDetailsScreen({required this.id, Key? key}) : super(key: key);
  ProductDetailsScreen({required this.id, required this.url});

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
              future: GetDetails(widget.id),
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
                              widget.url,
                              // snapshot.data!.images![0].toString(),
                              // "https://teamphotousa.com/assets/images/teamphoto-loading.gif",
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
                                SizedBox(
                                  width: size.width * 70,
                                  child: Text(snapshot.data!.name.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                ),
                                whitespace(context, 2, 0),
                                Text(
                                  "old Price  " +
                                      snapshot.data!.regularPrice.toString(),
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    // fontSize: 18,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Text(
                                  "Price  " + snapshot.data!.price.toString(),
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
                            child: GestureDetector(
                              onTap: () => addtocart(
                                  int.parse(widget.id),
                                  snapshot.data?.name,
                                  int.parse(snapshot.data!.price.toString())),
                              child: const Icon(
                                Ionicons.add_circle_outline,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          )
                        ],
                      ),
                      whitespace(context, 2, 0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Html(
                          data: snapshot.data!.description.toString(),
                          style: {
                            "body": Style(
                              color: Colors.white,
                            )
                          },

                          // Text(
                          //   snapshot.data!.description.toString(),
                          //   // productdetailscontroller
                          //   //     .productdetails.value.description
                          //   //     .toString(),
                          //   style: GoogleFonts.openSans(
                          //       textStyle: const TextStyle(
                          //     color: Colors.white70,
                          //   )),
                          // ),
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
        Uri.parse('https://paikarilimited.com/wp-json/wc/v3/products/' + id),
        headers: <String, String>{'authorization': basicAuth});

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ProductDetails.fromJson(data);
    } else {
      return ProductDetails.fromJson(data);
    }
  }

  addtocart(int productid, String? name, int? productprice) {
    Provider.of<CartProvider>(context, listen: false).addtocart(CartModel(
        id: productid, name: name, price: productprice, imageurl: widget.url));
    print("Added this - $name ");
  }
}
