import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:paikarilimited_quicktech/Boilerplate/boilerplateCheckOutScreen.dart';
import 'package:paikarilimited_quicktech/Fixed%20Variables/fixedvariables.dart';
import 'package:paikarilimited_quicktech/Provider/cartprovider.dart';
import 'package:paikarilimited_quicktech/commonwidgets.dart';
import 'package:paikarilimited_quicktech/homescreen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int a = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: CommonAppBar(context),
      drawer: Sidenav(size),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 5,
              color: Colors.green.shade400,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Ionicons.car_sport,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Dhaka",
                    style: TextStyle(color: Colors.white),
                  ),
                  // Spacer(),
                  // Text(
                  //   "5:30 PM - 6:00 PM",
                  //   style: TextStyle(color: Colors.white),
                  // )
                ],
              ),
            ),
            Consumer<CartProvider>(builder: (_, cartprovider, child) {
              return SizedBox(
                height: size.height * 65,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: cartprovider.cartproducts?.length,
                  itemBuilder: (context, index) {
                    a = (a + cartprovider.cartproducts![index].price!.toInt());
                    return Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(cartprovider
                                      .cartproducts![index].imageurl
                                      .toString()),
                                  radius: 26,
                                ),
                                SizedBox(
                                  width: size.width * 5,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: size.width * 50,
                                      child: Text(
                                          "${cartprovider.cartproducts![index].name}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: GoogleFonts.openSans()),
                                    ),
                                    whitespace(context, 2, 0),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          //  TextSpan(
                                          //   text: '${cartprovider.cartproducts![index].price}',
                                          //   style: const TextStyle(
                                          //     color: Colors.grey,
                                          //     decoration:
                                          //         TextDecoration.lineThrough,
                                          //   ),
                                          // ),
                                          TextSpan(
                                              text:
                                                  'tk ${cartprovider.cartproducts![index].price}',
                                              style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                      color: redcolor))),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    // Text(
                                    //   "12 pcs",
                                    //   style: GoogleFonts.openSans(
                                    //       textStyle: const TextStyle(
                                    //     fontSize: 11,
                                    //   )),
                                    // ),
                                    // whitespace(context, 2, 0),
                                    GestureDetector(
                                      onTap: () => delete(
                                          cartprovider.cartproducts![index].id),
                                      child: Icon(
                                        Ionicons.trash_bin_outline,
                                        color: redcolor,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                      ],
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 75,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              color: Colors.grey.shade300,
              height: 35,
              width: double.infinity,
              child: Row(
                children: [
                  Text(
                    "Subtotal",
                    style: GoogleFonts.openSans(),
                  ),
                  const Spacer(),
                  Text(
                    // a.toString() + " tk",
                    Provider.of<CartProvider>(context).tprice.toString(),
                    style: GoogleFonts.openSans(),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const BoilerplateChekOutScreen()));
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                height: 40,
                color: redcolor,
                width: double.infinity,
                child: Row(
                  children: [
                    const Text(
                      "Place Order",
                      style: TextStyle(
                        fontSize: 15.5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      height: double.infinity,
                      color: Colors.red.shade800,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        " ${Provider.of<CartProvider>(context, listen: true).tprice} tk",
                        style: const TextStyle(
                          fontSize: 15.5,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  delete(int? productid) {
    Provider.of<CartProvider>(context, listen: false)
        .deletecartproduct(productid!);
  }
}
