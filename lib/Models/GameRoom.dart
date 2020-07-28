import 'Word.dart';

class GameRoom {
  final String id;
  List<Word> _words = List();

  List<Word> get words => _words;

  set words(List<Word> words) {
    _words = words;
  }

  GameRoom({this.id});
}
