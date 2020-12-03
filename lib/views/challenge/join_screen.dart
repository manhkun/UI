import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiztest/models/models.dart';
import 'package:quiztest/services/api_manager.dart';
import 'package:quiztest/main.dart';
import 'package:quiztest/views/play_screen/quiz_game.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({Key key, this.hostCode}) : super(key: key);
  final String hostCode;

  @override
  _JoinScreenState createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  Timer _timer;
  var _init = true;
  var _isLoading = false;
  List<dynamic> listParticipants = new List<dynamic>();
  var checkStart = false;
  String quizID;
  Quiz quiz;
  @override
  void initState() {
    if (_init) {
      setState(() {
        _isLoading = true;
      });
      _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        API_Manager()
            .getParticipants(widget.hostCode)
            .then((value) {
              listParticipants = value["MapParticipant"].values.toList();
              checkStart = value["Started"];
              quizID = value["QuizID"];
              print("Check start" + checkStart.toString());
              print("quizID" + quizID);
            })
            .then((_) => {
                  API_Manager()
                      .fetchQuizByID(quizID)
                      .then((value) => quiz = value)
                })
            .then((_) {
              setState(() {
                _isLoading = false;
              });
            });
      });
    }
    _init = false;
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return checkStart
        ? Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => QuizGame(
                      quiz: quiz,
                    )),
            (Route<dynamic> route) => false)
        : SafeArea(
            child: Material(
              color: Colors.black,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 107,
                            height: 32,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromRGBO(196, 196, 196, 0.24)),
                            child: Text(
                              widget.hostCode,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await API_Manager()
                                  .deleteHost(widget.hostCode)
                                  .then((_) => {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Home()),
                                                (Route<dynamic> route) => false)
                                      });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 62,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromRGBO(196, 196, 196, 0.4),
                              ),
                              child: Text(
                                'Exit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      child: Text("Please wait the host start game...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: 150,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        widget.hostCode,
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ),
                    _isLoading
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: listParticipants.length,
                            itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                height: 86,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(196, 196, 196, 0.4),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      listParticipants[index],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Container(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/icons/officer.png'),
                                        width: 80,
                                        height: 80,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                    // Center(
                    //   child: IconButton(
                    //       icon: Icon(
                    //         Icons.refresh,
                    //         color: Colors.white,
                    //         size: 48,
                    //       ),
                    //       onPressed: null),
                    // )
                  ],
                ),
              ),
            ),
          );
  }
}
