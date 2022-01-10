import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:paikarilimited_quicktech/Fixed%20Variables/fixedvariables.dart';
import 'package:paikarilimited_quicktech/commonwidgets.dart';
import 'package:paikarilimited_quicktech/homescreen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                  Spacer(),
                  Text(
                    "5:30 PM - 6:00 PM",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 65,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://cdn.britannica.com/94/151894-050-F72A5317/Brown-eggs.jpg"),
                                radius: 26,
                              ),
                              SizedBox(
                                width: size.width * 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Layer Eggs",
                                      style: GoogleFonts.openSans()),
                                  whitespace(context, 2, 0),
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        const TextSpan(
                                          text: 'tk 130',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        TextSpan(
                                            text: '    tk 115',
                                            style: GoogleFonts.openSans(
                                                textStyle: TextStyle(
                                                    color: redcolor))),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    "12 pcs",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                      fontSize: 11,
                                    )),
                                  ),
                                  whitespace(context, 2, 0),
                                  Icon(
                                    Ionicons.add_circle_outline,
                                    color: redcolor,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
              ),
            ),
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
                    "150 tk",
                    style: GoogleFonts.openSans(),
                  )
                ],
              ),
            ),
            Container(
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
                    child: const Text(
                      "150 tk",
                      style: TextStyle(
                        fontSize: 15.5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
