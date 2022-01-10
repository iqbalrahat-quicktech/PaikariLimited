import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:paikarilimited_quicktech/Fixed%20Variables/fixedvariables.dart';
import 'package:paikarilimited_quicktech/commonwidgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            whitespace(context, 10, 0),
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back)),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/logos/paikari.jpg',
                height: size.height * 20,
              ),
            ),
            // whitespace(context, 3.3, 0),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  whitespace(context, 10, 0),
                  TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black,
                      )),
                      // labelText: 'Email/Mobile Number',
                      hintText: 'Your Name',
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "*Required"),
                      EmailValidator(errorText: "Email is invalid")
                    ]),
                  ),
                  whitespace(context, 1.1, 0),
                  TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black,
                      )),
                      // labelText: 'Password',
                      hintText: 'Email/Phone Number',
                    ),
                  ),
                  whitespace(context, 1.1, 0),
                  TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black,
                      )),
                      // labelText: 'Password',
                      hintText: 'Password',
                    ),
                  ),
                  whitespace(context, 3, 0),
                  SizedBox(
                      width: double.infinity,
                      child: DarkButtton(
                          title: "Create Account", onPressed: () {})),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
