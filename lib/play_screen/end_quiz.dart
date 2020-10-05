import 'package:flutter/material.dart';

class EndQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          PauseExit(),
          FindQuiz(size: size),
          Container(
            child: Column(
              children: [
                Opacity(
                  opacity: _visible ? 1.0 : 0.0,
                  child: Text(
                    "Accuracy",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FindQuiz extends StatelessWidget {
  const FindQuiz({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        width: size.width,
        height: size.height * 0.1,
        decoration: BoxDecoration(color: Color.fromRGBO(44, 44, 44, 1)),
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Text(
            "Find a new quiz",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }
}

class PauseExit extends StatelessWidget {
  const PauseExit({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/icons/pause.png"),
            Container(
              width: 62,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Text(
                "Exit",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
            )
          ],
        ),
      ),
    );
  }
}
