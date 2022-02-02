import 'package:flutter/material.dart';
import 'package:paikarilimited_quicktech/commonwidgets.dart';

class DummyCheckoutScreen extends StatefulWidget {
  const DummyCheckoutScreen({Key? key}) : super(key: key);

  @override
  _DummyCheckoutScreenState createState() => _DummyCheckoutScreenState();
}

class _DummyCheckoutScreenState extends State<DummyCheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;

    return Scaffold(
      appBar: CommonAppBar(context),
      body: Column(
        children: [],
      ),
    );
  }
}
