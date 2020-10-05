import 'package:flutter/material.dart';
import 'package:quiztest/components/appbar.dart';
import 'package:quiztest/components/category_card.dart';

class Running extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        namePage: "Activity",
        height: size.height,
      ),
      body: Column(
        children: [
          RunningActived(size: size),
          ListRunning(size: size)
        ],
      ),
    );
  }
}

class ListRunning extends StatelessWidget {
  const ListRunning({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GridView.builder(
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemCount: 4,
          itemBuilder: (context, index) => Category(
                size: size,
                title: "Solar system",
                questionCount: 19,
                imagePath: "assets/images/solar.png",
              )),
    );
  }
}

class RunningActived extends StatelessWidget {
  const RunningActived({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          child: Row(
            children: [
              FlatButton(
                onPressed: () {},
                child: Container(
                  height: 40,
                  width: size.width / 3,
                  child: Stack(children: [
                    Positioned(
                      left: 25,
                      top: 10,
                      child: Image(
                        image: AssetImage("assets/icons/hour_glass_1.png"),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 25,
                      child: Text(
                        "Running",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: 140,
                        height: 5,
                        decoration: BoxDecoration(color: Colors.orange),
                      ),
                    )
                  ]),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Container(
                  height: 40,
                  width: size.width / 3,
                  child: Stack(children: [
                    Positioned(
                      left: 20,
                      top: 10,
                      child: Image(
                        image: AssetImage("assets/icons/clock 2.png"),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 20,
                      child: Text(
                        "Completed",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
