// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:paikarilimited_quicktech/Models/product_details_model.dart';
import 'package:paikarilimited_quicktech/Service/productdetailsservice.dart';

class ProductDetailsController extends GetxController {
  var productdetails = ProductDetails().obs;

  @override
  void onInit() {
    fetchproductdetails();
    super.onInit();
  }

  void fetchproductdetails() async {
    var details = await ProductDetailsService.fetchdetails();

    if (details != null) {
      productdetails.value = details;
      print(productdetails);
    }
  }
}
