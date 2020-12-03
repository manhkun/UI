import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quiztest/main.dart';
import 'package:quiztest/models/models.dart';
import 'package:quiztest/services/user.dart';
import 'package:quiztest/views/components/quiz_card.dart';
import 'package:quiztest/services/api_manager.dart';

class EndQuiz extends StatefulWidget {
  EndQuiz(
      {@required this.correctAns,
      @required this.incorrectAns,
      this.topic,
      this.quizID,
      this.saveGameID,
      this.key});
  final Key key;
  final int correctAns;
  final int incorrectAns;
  final Topic topic;
  final String quizID;
  final String saveGameID;

  @override
  _EndQuizState createState() => _EndQuizState();
}

class _EndQuizState extends State<EndQuiz> {
  List<Quiz> _quizzes;
  var _init = true;
  var _isLoadingQuiz = false;

  @override
  void initState() {
    if (_init && widget.saveGameID == null) {
      print(widget.saveGameID);
      setState(() {
        _isLoadingQuiz = true;
      });
      UserSave().getUserID().then((value) {
        API_Manager().postCompletedQuiz(
            widget.quizID, value, widget.correctAns, widget.incorrectAns);
      }).then((_) {
        API_Manager()
            .fetchQuizByTopic(widget.topic.key)
            .then((value) => _quizzes = value)
            .then((_) {
          print(_quizzes);
        }).then((_) {
          setState(() {
            _isLoadingQuiz = false;
          });
        });
      });
    }
    if (widget.saveGameID != null && _init) {
      setState(() {
        _isLoadingQuiz = true;
      });
      print("save game id" + widget.saveGameID);
      API_Manager().deleteSaveGame(widget.saveGameID).then((_) {
        UserSave().getUserID().then((value) {
          API_Manager().postCompletedQuiz(
              widget.quizID, value, widget.correctAns, widget.incorrectAns);
        }).then((_) {
          API_Manager()
              .fetchQuizByTopic("GglUDmMF6BVuVjaZQOMD")
              .then((value) => _quizzes = value)
              .then((_) {
            print(_quizzes);
          }).then((_) {
            setState(() {
              _isLoadingQuiz = false;
            });
          });
        });
      });
    }
    _init = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.black,
      child: SafeArea(
        child: Column(
          children: [
            PauseExit(),
            FindQuiz(size: size),
            Result(
              size: size,
              correct: widget.correctAns,
              inccorect: widget.incorrectAns,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "You may also like",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 200,
                      child: _isLoadingQuiz
                          ? SpinKitDualRing(color: Colors.white)
                          : ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  _quizzes.length > 3 ? 3 : _quizzes.length,
                              itemBuilder: (context, index) {
                                Quiz quiz = _quizzes[index];
                                return QuizCard(
                                  quiz: quiz,
                                  imagePath: "assets/images/solar.png",
                                  size: size,
                                );
                              },
                            ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {
  const Result(
      {Key key,
      @required this.size,
      @required this.correct,
      @required this.inccorect})
      : super(key: key);

  final Size size;
  final int correct;
  final int inccorect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Container(
          height: size.height * 0.15,
          decoration: BoxDecoration(
              color: Color.fromRGBO(44, 44, 44, 1),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Accuracy",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  margin: EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: this.correct,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10))),
                        ),
                      ),
                      Expanded(
                        flex: this.inccorect,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Correct",
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                    Text(
                      "Incorrect",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.all(10),
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(44, 44, 44, 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset("assets/icons/correct.png"),
                          Text(
                            this.correct.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Text("Correct",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14,
                          ))
                    ],
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(5),
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(44, 44, 44, 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset("assets/icons/wrong.png"),
                          Text(
                            this.inccorect.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Text("Incorrect",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 11,
                          ))
                    ],
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                height: size.height * 0.1,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(44, 44, 44, 1),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Score",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "5470",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Image.asset("assets/icons/score.png"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
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
            ),
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
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Home()),
                      (Route<dynamic> route) => false);
                },
                child: Text(
                  "Exit",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
