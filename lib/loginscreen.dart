import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:paikarilimited_quicktech/Controllers/login_controller.dart';
import 'package:paikarilimited_quicktech/commonwidgets.dart';
import 'package:paikarilimited_quicktech/homescreen.dart';
import 'package:paikarilimited_quicktech/signupscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(GoogleLoginController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            whitespace(context, 10, 0),

            Image.asset(
              'assets/logos/paikari.jpg',
              height: size.height * 30,
            ),
            whitespace(context, 3.3, 0),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      // labelText: 'Email/Mobile Number',
                      hintText: 'Enter valid email address',
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "*Required"),
                      EmailValidator(errorText: "Email is invalid")
                    ]),
                  ),
                  whitespace(context, 1.1, 0),
                  TextFormField(
                    decoration: const InputDecoration(
                      // labelText: 'Password',
                      hintText: 'Enter your password',
                    ),
                  ),
                  whitespace(context, 3, 0),
                  SizedBox(
                      width: double.infinity,
                      child: DarkButtton(
                          title: "Login",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          })),
                ],
              ),
            ),
            whitespace(context, 1.5, 0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Forgot password?",
                style: GoogleFonts.openSans(),
              ),
            ),
            whitespace(context, 2, 0),
            SizedBox(
                width: double.infinity,
                child: Obx(() {
                  if (controller.googleaccount.value == null) {
                    return buildloginbutton();
                  } else {
                    return buildprofileview();
                  }
                })),
            // whitespace(context, 2, 0),
            SizedBox(
              width: double.infinity,
              child: SignInButton(
                Buttons.Facebook,
                onPressed: () {},
              ),
            ),
            whitespace(context, 2, 0),
            Text(
              "Don't have an account?",
              style: GoogleFonts.openSans(),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                },
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                    color: Colors.black,
                  )),
                ),
                style: const ButtonStyle(),
              ),
            ),

            // textformfi
          ],
        ),
      ),
    ));
  }

  SignInButton buildloginbutton() {
    return SignInButton(
      Buttons.Google,
      onPressed: () {
        // GoogleSignIn().signIn();
        controller.login();
      },
    );
  }

  Column buildprofileview() {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: Image.network("").image,
          radius: 100,
        ),
        const Text("Name"),
      ],
    );
  }
}
