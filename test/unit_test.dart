import 'package:flutter_test/flutter_test.dart';
import 'package:quiztest/services/api_manager.dart';

void main(List<String> args) {
  test("Test fetch host code ", () {
    var result = API_Manager().joinGame("12321");
    expect(result, "");
  });
  // test("Test fetch done quiz ", () {
  //   var result = API_Manager().fetchDoneQuiz("");
  //   expect(result, null);
  // });
}
