// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:paikarilimited_quicktech/Controllers/allproductscontroller.dart';
import 'package:paikarilimited_quicktech/Fixed%20Variables/fixedvariables.dart';
import 'package:paikarilimited_quicktech/commonwidgets.dart';
import 'package:paikarilimited_quicktech/loginscreen.dart';
import 'package:paikarilimited_quicktech/subcategoryscreen.dart';

import 'productdetailsscreen.dart';

final AllProductsController allproductscontroller =
    Get.put(AllProductsController());

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List Categories = [
    "Pet Shop",
    "Toys and Games",
    "Food",
    "Home and Cleaning",
    "Vehicle Essentials",
    "Home Appliance",
    "Office Products"
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: CommonAppBar(context),
      drawer: Sidenav(size),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 5,
              color: Colors.grey.shade300,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Ionicons.location,
                    color: Colors.redAccent,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Dhaka")
                ],
              ),
            ),
            // ListTile(
            //   title: Text("Product",
            //   style: TextStyle(
            //     fontSize: 15,
            //     fontWeight: FontWeight.bold,
            //   ),),
            //   subtitle: Text("1500 tk"),
            //   leading: Icon(Ionicons.dice),
            // ),
            SizedBox(
              height: size.height * 85,
              child: Obx(() {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: allproductscontroller.allrpoductslist_.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      imagecheckfunction(index).toString()),
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
                                      width: size.width * 60,
                                      child: Text(
                                          allproductscontroller
                                              .allrpoductslist_[index].name
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.openSans()),
                                    ),
                                    whitespace(context, 2, 0),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'tk ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          TextSpan(
                                            text: allproductscontroller
                                                .allrpoductslist_[index]
                                                .regularPrice
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                          TextSpan(
                                              text: '    ' +
                                                  allproductscontroller
                                                      .allrpoductslist_[index]
                                                      .salePrice
                                                      .toString(),
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                          id: allproductscontroller
                                              .allrpoductslist_[index].id
                                              .toString(),
                                        )));
                          },
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget SearchDialogue(BuildContext context, Size size) {
    return Dialog(
      child: Container(
        color: Colors.red,
        width: 50,
        height: 50,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Search'),
            ),
            Text("data"),
          ],
        ),
      ),
    );
  }

  String? imagecheckfunction(int index) {
    if (allproductscontroller.allrpoductslist_[index].images!.isEmpty) {
      return "https://i5.walmartimages.com/asr/2442ca60-a563-4bb1-bbab-d4449d546d04.b208061a114950a62193c904d00b72c3.gif";
    } else {
      return allproductscontroller.allrpoductslist_[index].images!.first.src;
    }
  }
}

class Sidenav extends StatelessWidget {
  // const Sidenav({ Key? key }) : super(key: key);
  const Sidenav(Size size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            // shrinkWrap: true,
            // padding: const EdgeInsets.fromLTRB(20, 10, 0,0),
            children: [
              // whitespace(context, 3.7,0),
              ListTile(
                leading: Icon(
                  Ionicons.person_circle_outline,
                  color: Colors.black,
                ),
                title: Text(
                  "Login",
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  )),
                ),
                trailing: Icon(Ionicons.headset_outline),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(
                  Ionicons.flame,
                  color: Colors.amber,
                ),
                title: Text("OFFERS"),
              ),
              ListTile(
                leading: Icon(
                  Ionicons.bonfire,
                  color: redcolor,
                ),
                title: Text("Popular"),
              ),

              ListTile(
                dense: true,
                leading: Icon(Ionicons.medical_outline),
                title: Text("Winter Collections"),
                trailing: Icon(
                  Ionicons.chevron_forward_sharp,
                  size: 15.5,
                  color: ashcolor,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubCategoryScreen())),
              ),
              ListTile(
                dense: true,
                leading: Icon(Ionicons.heart_circle_outline),
                title: Text("Flash Sale"),
                trailing: Icon(
                  Ionicons.chevron_forward_sharp,
                  size: 15.5,
                  color: ashcolor,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubCategoryScreen())),
              ),
              ListTile(
                dense: true,
                leading: Icon(Ionicons.home_outline),
                title: Text("Home & Cleaning"),
                trailing: Icon(
                  Ionicons.chevron_forward_sharp,
                  size: 15.5,
                  color: ashcolor,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubCategoryScreen())),
              ),
              ListTile(
                dense: true,
                leading: Icon(Ionicons.beer_outline),
                title: Text("Food"),
                trailing: Icon(
                  Ionicons.chevron_forward_sharp,
                  size: 15.5,
                  color: ashcolor,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubCategoryScreen())),
              ),
              ListTile(
                dense: true,
                leading: Icon(Ionicons.bag_check),
                title: Text("Office Products"),
                trailing: Icon(
                  Ionicons.chevron_forward_sharp,
                  size: 15.5,
                  color: ashcolor,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubCategoryScreen())),
              ),
              ListTile(
                dense: true,
                leading: Icon(Ionicons.bicycle_outline),
                title: Text("Vehicles Essentials"),
                trailing: Icon(
                  Ionicons.chevron_forward_sharp,
                  size: 15.5,
                  color: ashcolor,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubCategoryScreen())),
              ),
              ListTile(
                dense: true,
                leading: Icon(Ionicons.heart_half_outline),
                title: Text("Pet Care"),
                trailing: Icon(
                  Ionicons.chevron_forward_sharp,
                  size: 15.5,
                  color: ashcolor,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubCategoryScreen())),
              ),
              // ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: 8,
              //   itemBuilder: (context, index) {
              //     return GestureDetector(
              //       onTap: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => SubCategoryScreen()));
              //       },
              //       child: ListTile(
              //         leading: Icon(Ionicons.add),
              //         title: Text("Category $index"),
              //         trailing: Icon(Ionicons.chevron_forward),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
