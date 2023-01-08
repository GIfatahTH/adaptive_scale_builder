import 'package:flutter/material.dart';

extension WidgetX on Widget {
  Widget colorize([Color? color]) => ColoredBox(
        color: color ?? Colors.blue,
        child: this,
      );
}
