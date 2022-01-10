// ignore_for_file: non_constant_identifier_names

import 'package:get/state_manager.dart';
import 'package:paikarilimited_quicktech/Models/all_products_model.dart';
import 'package:paikarilimited_quicktech/Service/remoteallproducts.dart';

class AllProductsController extends GetxController {
  var allrpoductslist_ = <AllProductsModel>[].obs;

  @override
  void onInit() {
    FetchAllProducts();
    super.onInit();
  }

  void FetchAllProducts() async {
    var products = await AllProductsRemoteService.fetchallproducts();
    if (products != null) {
      allrpoductslist_.value = products;
      print(allrpoductslist_);
    }
  }
}
