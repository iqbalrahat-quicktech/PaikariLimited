import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:paikarilimited_quicktech/Controllers/categoryproductscontroller.dart';
import 'package:paikarilimited_quicktech/Fixed%20Variables/fixedvariables.dart';
import 'package:paikarilimited_quicktech/commonwidgets.dart';
import 'package:paikarilimited_quicktech/productdetailsscreen.dart';

final CategoryProductsController categoryproductscontroller =
    Get.put(CategoryProductsController());

class CategoryProductsScreen extends StatefulWidget {
  final String categoryname;
  const CategoryProductsScreen({Key? key, required this.categoryname})
      : super(key: key);

  @override
  _CategoryProductsScreenState createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;

    return Scaffold(
      appBar: CommonAppBar(context),
      body: SizedBox(
        height: size.height * 85,
        child: Obx(() {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: categoryproductscontroller.categoryproductlist_.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
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
                                    categoryproductscontroller
                                        .categoryproductlist_[index].name
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.openSans()),
                              ),
                              whitespace(context, 2, 0),
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'tk ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: categoryproductscontroller
                                          .categoryproductlist_[index]
                                          .regularPrice
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    TextSpan(
                                        text: '    ' +
                                            categoryproductscontroller
                                                .categoryproductlist_[index]
                                                .salePrice
                                                .toString(),
                                        style: GoogleFonts.openSans(
                                            textStyle:
                                                TextStyle(color: redcolor))),
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
                              //       textStyle: TextStyle(
                              //     fontSize: 11,
                              //   )),
                              // ),
                              // whitespace(context, 2, 0),
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
                                    id: categoryproductscontroller
                                        .categoryproductlist_[index].id
                                        .toString(),
                                    url: imagecheckfunction(index).toString(),
                                  )));
                    },
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                ],
              );
            },
          );
        }),
      ),
    );

    // SingleChildScrollView(
    //     child: FutureBuilder<List<AllProductsModel>>(
    //         future: GetDetails(widget.categoryname),
    //         builder: (context, snapshot) {
    //           if (snapshot.hasData) {
    // return ListView.builder(
    //   scrollDirection: Axis.vertical,
    //   shrinkWrap: true,
    //   itemCount: snapshot.data?.length,
    //   itemBuilder: (context, index) {
    //     return Column(
    //       children: [
    //         GestureDetector(
    //           child: Container(
    //             padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
    //             child: Row(
    //               children: [
    //                 CircleAvatar(
    //                   backgroundImage: NetworkImage(
    //                     snapshot.data![index].images!.first.src
    //                         .toString(),
    //                   ),
    //                   // imagecheckfunction(index).toString()),
    //                   radius: 26,
    //                 ),
    //                 SizedBox(
    //                   width: size.width * 5,
    //                 ),
    //                 Column(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment:
    //                       CrossAxisAlignment.start,
    //                   children: [
    //                     SizedBox(
    //                       width: size.width * 60,
    //                       child: Text(
    //                           snapshot.data![index].name
    //                               .toString(),
    //                           overflow: TextOverflow.ellipsis,
    //                           style: GoogleFonts.openSans()),
    //                     ),
    //                     whitespace(context, 2, 0),
    //                     RichText(
    //                       text: TextSpan(
    //                         children: <TextSpan>[
    //                           TextSpan(
    //                             text: 'tk ',
    //                             style: TextStyle(
    //                               color: Colors.grey,
    //                             ),
    //                           ),
    //                           TextSpan(
    //                             text: snapshot
    //                                 .data![index].regularPrice
    //                                 .toString(),
    //                             style: TextStyle(
    //                               color: Colors.grey,
    //                               decoration:
    //                                   TextDecoration.lineThrough,
    //                             ),
    //                           ),
    //                           TextSpan(
    //                               text: '    ' +
    //                                   snapshot
    //                                       .data![index].salePrice
    //                                       .toString(),
    //                               style: GoogleFonts.openSans(
    //                                   textStyle: TextStyle(
    //                                       color: redcolor))),
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //                 const Spacer(),
    //                 Column(
    //                   children: [
    //                     // Text(
    //                     //   "12 pcs",
    //                     //   style: GoogleFonts.openSans(
    //                     //       textStyle: TextStyle(
    //                     //     fontSize: 11,
    //                     //   )),
    //                     // ),
    //                     // whitespace(context, 2, 0),
    //                     Icon(
    //                       Ionicons.add_circle_outline,
    //                       color: redcolor,
    //                     ),
    //                   ],
    //                 )
    //               ],
    //             ),
    //           ),
    //           onTap: () {
    //             Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                     builder: (context) =>
    //                         ProductDetailsScreen(
    //                           id: snapshot.data![index].id
    //                               .toString(),
    //                         )));
    //           },
    //         ),
    //         Divider(
    //           color: Colors.grey,
    //         ),
    //       ],
    //     );
    //   },
    // );
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     SizedBox(
    //         width: double.infinity,
    //         height: size.height * 40,
    //         child: const imageimport.Image(
    //           image: NetworkImage(
    //             // snapshot.data!.images![0].toString(),
    //             "https://teamphotousa.com/assets/images/teamphoto-loading.gif",
    //           ),
    //           fit: BoxFit.cover,
    //         )),
    //     Row(
    //       children: [
    //         Container(
    //           padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               SizedBox(
    //                 width: size.width * 70,
    //                 child: Text(snapshot.data!.name.toString(),
    //                     overflow: TextOverflow.ellipsis,
    //                     maxLines: 2,
    //                     style: GoogleFonts.openSans(
    //                       textStyle: const TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 20,
    //                         fontWeight: FontWeight.w500,
    //                       ),
    //                     )),
    //               ),
    //               whitespace(context, 2, 0),
    //               Text(
    //                 "old Price  " +
    //                     snapshot.data!.regularPrice.toString(),
    //                 style: const TextStyle(
    //                   color: Colors.white54,
    //                   // fontSize: 18,
    //                   decoration: TextDecoration.lineThrough,
    //                 ),
    //               ),
    //               Text(
    //                 "Price  " + snapshot.data!.price.toString(),
    //                 style: GoogleFonts.openSans(
    //                   color: redcolor,
    //                   fontWeight: FontWeight.w700,
    //                   fontSize: 15.5,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         const Spacer(),
    //         // ignore: prefer_const_constructors
    //         Padding(
    //           padding: const EdgeInsets.only(right: 20),
    //           child: const Icon(
    //             Ionicons.add_circle_outline,
    //             color: Colors.white,
    //             size: 35,
    //           ),
    //         )
    //       ],
    //     ),
    //     whitespace(context, 2, 0),
    //     Padding(
    //       padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    //       child: Html(
    //         data: snapshot.data!.description.toString(),
    //         style: {
    //           "body": Style(
    //             color: Colors.white,
    //           )
    //         },

    //         // Text(
    //         //   snapshot.data!.description.toString(),
    //         //   // productdetailscontroller
    //         //   //     .productdetails.value.description
    //         //   //     .toString(),
    //         //   style: GoogleFonts.openSans(
    //         //       textStyle: const TextStyle(
    //         //     color: Colors.white70,
    //         //   )),
    //         // ),
    //       ),
    //     )
    //   ],
    // );
    //             } else {
    //               return Container(
    //                 // height: double.infinity,
    //                 height: size.height * 80,
    //                 alignment: Alignment.center,
    //                 child: const CupertinoActivityIndicator(
    //                   radius: 20,
    //                 ),
    //               );
    //             }
    //           })),
    // );
    // }
  }
}

String? imagecheckfunction(int index) {
  if (categoryproductscontroller.categoryproductlist_[index].images!.isEmpty) {
    return "https://i5.walmartimages.com/asr/2442ca60-a563-4bb1-bbab-d4449d546d04.b208061a114950a62193c904d00b72c3.gif";
  } else {
    return categoryproductscontroller
        .categoryproductlist_[index].images!.first.src;
  }
}
