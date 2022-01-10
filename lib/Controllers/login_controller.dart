import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginController extends GetxController {
  var _googlesignin = GoogleSignIn();
  var googleaccount = Rx<GoogleSignInAccount?>(null);

  login() async {
    googleaccount.value = await _googlesignin.signIn();
  }
}
