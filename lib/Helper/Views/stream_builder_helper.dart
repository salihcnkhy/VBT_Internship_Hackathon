import 'package:flutter/material.dart';

class StreamHelper<T> extends StatelessWidget {
  StreamHelper(
      {Key key,
      this.stream,
      this.progressWidget,
      this.hasDataWidget,
      this.hasErrorWidget,
      this.hasDataCallback})
      : super(key: key) {
    stream.listen((event) {
      if (hasDataCallback != null) {
        hasDataCallback(event);
      }
    });
  }

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
