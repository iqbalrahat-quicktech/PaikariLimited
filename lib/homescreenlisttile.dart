import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:paikarilimited_quicktech/commonwidgets.dart';
import 'package:paikarilimited_quicktech/productdetailsscreen.dart';

import 'Fixed Variables/fixedvariables.dart';

class HomeScreenListTile extends StatefulWidget {
  String? productname;
  String? price;
  String? oldprice;
  String? imageurl;
  int? id;
  HomeScreenListTile(
      {this.productname, this.price, this.oldprice, this.imageurl, this.id});
  // const HomeScreenListTile({Key? key}) : super(key: key);

  @override
  _HomeScreenListTileState createState() => _HomeScreenListTileState();
}

class _HomeScreenListTileState extends State<HomeScreenListTile> {
  int _itemcount = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return new Column(
      children: [
        // Text(abc.price.toString()),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.imageurl.toString()),
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
                      width: size.width * 47,
                      child: Text(widget.productname.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.openSans()),
                    ),
                    // whitespace(context, 2, 0),
                    SizedBox(
                      width: size.width * 70,
                      child: Row(
                        children: [
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
                                  text: widget.oldprice.toString(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                TextSpan(
                                    text: '    ' + widget.price.toString(),
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(color: redcolor))),
                              ],
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              _itemcount != 0
                                  ? new IconButton(
                                      onPressed: () => setState(() {
                                            _itemcount--;
                                          }),
                                      icon: new Icon(
                                          Ionicons.remove_circle_outline))
                                  : new Container(),
                              whitespace(context, 0, 1),
                              _itemcount != 0
                                  ? Text(_itemcount.toString())
                                  : Container(),
                              IconButton(
                                  onPressed: () => setState(() {
                                        _itemcount++;
                                      }),
                                  icon: new Icon(
                                    Ionicons.add_circle_outline,
                                    color: redcolor,
                                  ))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          onTap: () {
            String? link = widget.imageurl;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                          id: widget.toString(),
                          url: link.toString(),
                        )));
          },
        ),
        Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
