import 'package:flutter/material.dart';

class PaddingRow extends StatelessWidget {
  final Widget child;

  const PaddingRow({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(flex: 1),
        Expanded(flex: 8, child: child),
        Spacer(flex: 1),
      ],
    );
  }
}
