import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paikarilimited_quicktech/Fixed%20Variables/fixedvariables.dart';

Widget whitespace(BuildContext context, var thisheight, var thiswidth) {
  Size size = MediaQuery.of(context).size / 100;
  return SizedBox(
    height: size.height * thisheight,
    width: size.width * thiswidth,
  );
}

// ignore: non_constant_identifier_names
AppBar CommonAppBar(BuildContext context) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.white),
    title: Text(
      "Paikari",
      style: GoogleFonts.openSans(
          textStyle: const TextStyle(
        color: Colors.white,
      )),
    ),
    backgroundColor: redcolor,
    // leading: const Icon(Icons.menu),
    actions: <Widget>[
      IconButton(
          icon: const Icon(Icons.search),
          color: Colors.white,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SearchDialogue(context);
                });
          }),
      IconButton(
          icon: const Icon(Icons.shopping_cart),
          color: Colors.white,
          onPressed: () {}),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget SearchDialogue(BuildContext context) {
  return AlertDialog(
    content: Container(
      alignment: Alignment.center,
      height: 150,
      // width: 200,
      child: Column(
        children: [
          const TextField(
            decoration:
                InputDecoration(label: Text("Search for products here")),
          ),
          whitespace(context, 2, 0),
          SizedBox(
            width: 100,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "Search",
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              style: const ButtonStyle(),
            ),
          ),
        ],
      ),
    ),
  );
}
