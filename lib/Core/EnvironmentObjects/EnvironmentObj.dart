import 'package:vbt_hackathon/Models/User.dart';
import 'package:vbt_hackathon/Models/Word.dart';

class EnvironmentObjects {
  static final EnvironmentObjects _singleton = EnvironmentObjects._internal();
  EnvironmentObjects._internal();
  factory EnvironmentObjects() {
    return _singleton;
  }
  User _user;

  User get user => _user;

  set user(User user) {
    _user = user;
  }

  List<WordList> learnedWordList = new List();
}
