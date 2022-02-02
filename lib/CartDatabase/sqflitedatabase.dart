import 'package:paikarilimited_quicktech/Models/cart_model.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDatabase {
  String tablename = "Cart";
  Database? database;
  num a = 0;

  Future<void> init() async {
    String tempo = await getDatabasesPath();
    String databasepath = tempo + "/" + "cart_db";
    print("Init Worked ");

    await openDatabase(
      databasepath,
      version: 6,
      onCreate: (db, version) async {
        print("ONCREATE WORKED");
        String command =
            "CREATE TABLE $tablename (id INTEGER PRIMARY KEY, name TEXT, price INTEGER, imageurl TEXT)";
        await db.execute(command);
        database = db;
      },
      //
      onOpen: (db) {
        database = db;
      },
      //
      onUpgrade: (db, oldVersion, newVewrsion) {
        database = db;
      },
    );
  }

  Future<void> addtocart(CartModel cart) async {
    int? added = await database?.insert(tablename, cart.toJson());
    print(added);
  }

  Future<List<CartModel>>? fetchall() async {
    List<Map<String, Object?>>? map = await database?.query(tablename);
    List<CartModel> cartproducts = [];
    CartModel singleproduct = CartModel();

    for (Map<String, Object?> i in map!) {
      cartproducts.add(CartModel.fromJson(i));
      singleproduct = CartModel.fromJson(i);
      a = a + singleproduct.price!.toInt();
    }

    return cartproducts;
  }

  Future<void> delete(int id) async {
    await database?.delete(tablename, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> update(CartModel cart) async {
    await database?.update(tablename, cart.toJson(),
        where: 'id = ?', whereArgs: [cart.id]);
  }

  Future<int> totalprice() async {
    int totalprice = 0;
    List<CartModel>? products = await fetchall();
    if (products != null) {
      for (var i in products) {
        totalprice = (totalprice + i.price!.toInt());
      }
    }
    return totalprice;
  }

  num? returntotalprice() {
    return a;
  }
}
