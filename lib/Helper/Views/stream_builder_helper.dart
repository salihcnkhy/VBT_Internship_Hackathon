import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Helper/Views/progress_bar.dart';

class StreamHelper<T> extends StatelessWidget {
  StreamHelper(
      {Key key,
      @required this.stream,
      this.progressWidget = const DefaultProgressBar(),
      @required this.hasDataWidget,
      this.hasErrorWidget = const Text("Error Occured"),
      this.hasDataCallback})
      : super(key: key) {
    _controller.addStream(stream);
    _controller.stream.listen((data) {
      if (hasDataCallback != null) {
        hasDataCallback(data);
        print(data);
      }
    });
  }
  final StreamController<T> _controller = StreamController();
  final Stream<T> stream;
  final Widget progressWidget;
  final Widget hasDataWidget;
  final Widget hasErrorWidget;
  final Function hasDataCallback;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return hasDataWidget;
        } else if (snapshot.hasError) {
          return hasErrorWidget;
        }
        return progressWidget;
      },
    );
  }
}
