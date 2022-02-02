import 'package:dio/dio.dart';
import 'package:get/get.dart';

class Auth extends GetxController {
  final dio = Dio();
  final email = RxString("");
  final firstname = RxString("");
  final password = RxString("");

  signup() async {
    try {
      final response = await dio.post(
        "https://paikarilimited.com//wp-json/wc/v3/customers",
        data: {
          "email": email.value,
          "password": password.value,
          "first_name": firstname.value
        },
      );
      if (response.statusCode == 201) {
        print(response.data);
      }
    } catch (e) {
      print(e);
    }
  }
}
