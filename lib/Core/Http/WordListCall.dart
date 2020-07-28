import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vbt_hackathon/Models/Word.dart';

class WordListCaller {
  Future<WordList> fetchWords(String url) async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return WordList.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
