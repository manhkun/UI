import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key key, @required this.size, this.title, this.questionCount, this.imagePath})
      : super(key: key);

  final Size size;
  final String title;
  final int questionCount;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                spreadRadius: 0,
                offset: Offset(0, 4),
                color: Colors.black.withOpacity(0.25))
          ]),
      width: size.width * 0.4,
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            ClipPath(
              child: Image(
                image: AssetImage(imagePath),
              ),
            ),
            Positioned(
              top: 90,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Text(
                  questionCount.toString() + " Qs",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
                top: 120,
                left: 10,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}