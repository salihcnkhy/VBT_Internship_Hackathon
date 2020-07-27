import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Core/Firebase/Firebase.dart';
import 'package:vbt_hackathon/Helper/Views/future_builder_helper.dart';
import 'package:vbt_hackathon/Helper/Views/progress_bar.dart';
import 'package:vbt_hackathon/Views/home_page/home_page.dart';
import 'Views/login_page/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget with FirebaseAuthProcess {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureHelper(
        future: checkUser(),
        hasDataWidget: HomePage(),
        hasErrorWidget: Text("Error"),
        progressWidget: DefaultProgressBar(),
      ),
    );
  }
}
