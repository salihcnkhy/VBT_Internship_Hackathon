import 'package:flutter/material.dart';

class RoundedRectWithShadow extends StatelessWidget {
  const RoundedRectWithShadow(
      {Key key,
      this.padding = const EdgeInsets.all(0),
      this.shadow = const BoxShadow(
          blurRadius: 3,
          color: Colors.black26,
          offset: Offset(2, 2),
          spreadRadius: 2),
      @required this.borderRadius,
      this.child,
      this.color = const Color.fromRGBO(255, 255, 255, 1),
      this.onTap,
      this.flex = 1})
      : super(key: key);

  final EdgeInsets padding;
  final BoxShadow shadow;
  final BorderRadius borderRadius;
  final Widget child;
  final Color color;
  final Function onTap;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Expanded(
        flex: flex,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
              boxShadow: [shadow], color: color, borderRadius: borderRadius),
          child: child,
        ),
      ),
    );
  }
}
