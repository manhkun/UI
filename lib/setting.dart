import 'package:flutter/material.dart';
import 'components/appbar.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        namePage: "Setting",
        height: size.height,
      ),
      body: Container(),
    );
  }
}
