import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double size;
  const Gap({Key? key, this.size = 10.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final row = context.findAncestorWidgetOfExactType<Row>();
    final col = context.findAncestorWidgetOfExactType<Column>();
    final double height = col == null ? 0 : size;
    final double width = row == null ? 0 : size;
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
