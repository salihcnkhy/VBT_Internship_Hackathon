import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class DefaultProgressBar extends StatelessWidget {
  const DefaultProgressBar(
      {Key key,
      this.blur = const Tuple2<double, double>(2, 2),
      this.color = const Color.fromRGBO(200, 200, 200, 0.2),
      this.scaleFactor = 0.25})
      : super(key: key);
  final Tuple2<double, double> blur;
  final Color color;
  final double scaleFactor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur.item1, sigmaY: blur.item2),
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width * scaleFactor,
              height: MediaQuery.of(context).size.width * scaleFactor,
              child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
