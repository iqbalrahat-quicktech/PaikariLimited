import 'package:flutter/cupertino.dart';
import 'package:paikarilimited_quicktech/CartDatabase/sqflitedatabase.dart';
import 'package:paikarilimited_quicktech/Models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  SqfliteDatabase database = SqfliteDatabase();

  CartProvider({required this.database}) {
    getallcart();
  }

  List<CartModel>? cartproducts = [];
  num? totalprice;
  int? tprice;

  Future<void> addtocart(CartModel cartModel) async {
    await database.addtocart(cartModel);
    gettotalprice();
    getallcart();
  }

  Future<void> deletecartproduct(int id) async {
    await database.delete(id);
    gettotalprice();
    getallcart();
  }

  Future<void> updatecart(CartModel cartModel) async {
    await database.update(cartModel);
    gettotalprice();
    getallcart();
  }

  Future<void> getallcart() async {
    cartproducts = await database.fetchall();
    notifyListeners();
  }

  Future<void> gettotalprice() async {
    tprice = await database.totalprice();
    notifyListeners();
    // return totalprice.toString();
  }
}
