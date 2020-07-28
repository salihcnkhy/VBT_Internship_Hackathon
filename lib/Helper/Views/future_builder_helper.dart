import 'package:flutter/material.dart';

class FutureHelper<T> extends StatelessWidget {
  FutureHelper(
      {Key key,
      this.future,
      this.progressWidget,
      this.hasDataWidget,
      this.hasErrorWidget,
      this.hasDataCallback})
      : super(key: key) {
    future.then((event) {
      if (hasDataCallback != null) {
        hasDataCallback(event);
      }
    });
  }

  final Future<T> future;
  final Widget progressWidget;
  final Widget hasDataWidget;
  final Widget hasErrorWidget;
  final Function hasDataCallback;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
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
