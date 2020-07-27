import 'package:flutter/material.dart';

class FutureHelper<T> extends StatelessWidget {
  const FutureHelper(
      {Key key,
      this.future,
      this.progressWidget,
      this.hasDataWidget,
      this.hasErrorWidget,
      this.hasDataCallback})
      : super(key: key);

  final Future<T> future;
  final Widget progressWidget;
  final Widget hasDataWidget;
  final Widget hasErrorWidget;
  final Function hasDataCallback;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (hasDataCallback != null) {
            hasDataCallback(snapshot);
          }
          return hasDataWidget;
        } else if (snapshot.hasError) {
          return hasErrorWidget;
        }
        return progressWidget;
      },
    );
  }
}
