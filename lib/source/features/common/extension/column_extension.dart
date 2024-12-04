import 'package:flutter/material.dart';

extension WidgetExtension on Column {
  Widget wrap({double padding = 16.0, double margin = 8.0}) {
    final reversedChildren = children
        .map((e) => Container(
            padding: EdgeInsets.all(padding),
            margin: EdgeInsets.all(margin),
            child: e))
        .toList();
    return Column(
      children: reversedChildren,
    );
  }
}


