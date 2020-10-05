import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  final String namePage;
  final double height;

  CustomAppBar({@required this.namePage, @required this.height});

  @override
  Size get preferredSize => Size.fromHeight(height * 0.1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.grey))),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                namePage,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              FlatButton(
                onPressed: (){},
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(235, 235, 235, 1),
                      shape: BoxShape.circle),
                  child: Image(
                    image: AssetImage('assets/icons/menu.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
