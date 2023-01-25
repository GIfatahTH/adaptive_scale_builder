import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';

import '../adaptive_scale_builder.dart';
import 'adaptive_layout.dart';

class AdaptiveSettings {
  static double baseWidth = 500;
  static double scaleFactor = 1.0;

  static final List<Query> _query = [];
  static set query(List<Query> qs) {
    if (qs.isEmpty) {
      _query.clear();
      return;
    }
    for (var i = 0; i < qs.length; i++) {
      final q = qs[i];
      if (i == 0) {
        _query.add(q);
      } else {
        final lastQ = _query[i - 1];
        _query.add(
          Query.internal(
            step: q.step,
            scale: q.scale,
            isLinear: q.isLinear,
            y0: lastQ.step,
            w0: lastQ.fn(lastQ.step, lastQ),
          ),
        );
      }

      if (i == qs.length - 1) {
        final q = _query[i];

        _query.add(
          Query.internal(
            step: double.infinity,
            scale: 1,
            y0: q.step,
            isLinear: true,
            w0: q.fn(q.step, q),
          ),
        );
      }
    }
  }

  static double ofAdaptive(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    return of(context).maxWidth / baseWidth;
  }

  static BoxConstraints of(BuildContext context) {
    ScaffoldInheritedLayoutWidget? r = context
        .dependOnInheritedWidgetOfExactType<ScaffoldInheritedLayoutWidget>();

    assert(r != null);
    bool _is = window.physicalSize.width > window.physicalSize.height;
    bool isLandscape = (Platform.isAndroid || Platform.isIOS) && _is;
    var width = isLandscape
        ? r!.layoutConstraints.maxHeight
        : r!.layoutConstraints.maxWidth;
    final height = isLandscape
        ? r.layoutConstraints.maxWidth
        : r.layoutConstraints.maxHeight;

    if (_query.isNotEmpty) {
      for (var i = 0; i < _query.length; i++) {
        final q = _query[i];

        if (width < q.step) {
          width = q.fn(width, q);
          break;
        }
      }
    }

    late double newWidth;

    newWidth = screenWidthResized?.call(width) ?? width;

    final size = BoxConstraints(
      maxWidth: newWidth,
      maxHeight: screenHeightResized?.call(height) ?? height,
    );
    // final size = InheritedSize(
    //   screenWidthResized != null
    //       ? screenWidthResized!.call(width) ?? width
    //       : width,
    //   screenHeightResized != null
    //       ? screenHeightResized!.call(height) * height
    //       : height,
    // );

    return BoxConstraints(
      maxWidth: size.maxWidth * scaleFactor,
      maxHeight: size.maxHeight * scaleFactor,
    );
  }

  static double Function(double width)? screenWidthResized;
  static double Function(double height)? screenHeightResized;
}
