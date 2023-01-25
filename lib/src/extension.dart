// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:adaptive_scale_builder/adaptive_scale_builder.dart';

import 'fitted_box_render.dart';

extension WidgetX on Widget {
  AdaptWidget get adapt => AdaptWidget(child: this);
}

extension DoubleX on double {
  AdaptNum<double> get adapt => AdaptNum<double>(num: this);
}

extension IntX on int {
  AdaptNum<int> get adapt => AdaptNum<int>(num: this);
}

extension TextStyleX on TextStyle {
  AdaptTextStyle get adapt => AdaptTextStyle(textStyle: this);
}

extension RadiusX on Radius {
  AdaptGeneric<Radius> get adapt => AdaptGeneric<Radius>(data: this);
}

extension BorderRadiusX on BorderRadius {
  AdaptGeneric<BorderRadiusGeometry> get adapt =>
      AdaptGeneric<BorderRadiusGeometry>(data: this);
}

extension EdgeInsetsGeometryX on EdgeInsetsGeometry {
  AdaptGeneric<EdgeInsetsGeometry> get adapt =>
      AdaptGeneric<EdgeInsetsGeometry>(data: this);
}

extension AppBarX on AppBar {
  AdaptAppBar get adapt => AdaptAppBar(appBar: this);
}

class AdaptAppBar {
  final AppBar _appBar;
  AdaptAppBar({
    required AppBar appBar,
  }) : _appBar = appBar;
  PreferredSize fixed(BuildContext context) {
    final factor = AdaptiveSettings.ofAdaptive(context);
    return PreferredSize(
      preferredSize: _appBar.preferredSize / factor,
      child: _appBar,
    );
  }

  PreferredSize clamp(
    BuildContext context, {
    double lower = double.negativeInfinity,
    double upper = double.infinity,
  }) {
    final factor = AdaptiveSettings.ofAdaptive(context);
    final r = (_appBar.preferredSize.height * factor).clamp(lower, upper);
    return PreferredSize(
      preferredSize: Size.fromHeight(r / factor),
      child: _appBar,
    );
  }
}

class AdaptWidget {
  final Widget _child;
  AdaptWidget({
    required Widget child,
  }) : _child = child;
  Widget scale([double scale = 1.0]) {
    return MyFittedBox(
      key: ValueKey('true$scale'),
      fitTheShortestSide: true,
      scale: scale,
      ignoreGlobalResizing: true,
      child: _child,
    );
  }

  Widget resize([double scale = 1.0]) => MyFittedBox(
        key: ValueKey('false$scale'),
        fitTheShortestSide: false,
        scale: scale,
        ignoreGlobalResizing: true,
        child: _child,
      );

  Widget fixed() => MyFittedBox(
        fitTheShortestSide: false,
        scale: null,
        ignoreGlobalResizing: true,
        child: _child,
      );
}

class AdaptNum<T extends num> {
  final T _num;
  AdaptNum({
    required T num,
  }) : _num = num;

  T fixed(BuildContext context) {
    final factor = AdaptiveSettings.ofAdaptive(context);

    final r = _num / factor;
    if (T == int) {
      return r.toInt() as T;
    }
    return r as T;
  }

  T clamp(BuildContext context, {T? lower, T? upper}) {
    final factor = AdaptiveSettings.ofAdaptive(context);
    final r = (_num * factor)
        .clamp(lower ?? double.negativeInfinity, upper ?? double.infinity);

    if (T == int) {
      return r ~/ factor as T;
    }
    return r / factor as T;
  }
}

class AdaptTextStyle {
  final TextStyle _textStyle;
  AdaptTextStyle({
    required TextStyle textStyle,
  }) : _textStyle = textStyle;

  TextStyle fixed(BuildContext context) {
    final factor = AdaptiveSettings.ofAdaptive(context);
    return _textStyle.copyWith(
      fontSize: _textStyle.fontSize == null
          ? _textStyle.fontSize
          : _textStyle.fontSize! / factor,
      letterSpacing: _textStyle.letterSpacing == null
          ? _textStyle.letterSpacing
          : _textStyle.letterSpacing! / factor,
      wordSpacing: _textStyle.wordSpacing == null
          ? _textStyle.wordSpacing
          : _textStyle.wordSpacing! / factor,
      height: _textStyle.height == null
          ? _textStyle.height
          : _textStyle.height! / factor,
      decorationThickness: _textStyle.decorationThickness == null
          ? _textStyle.decorationThickness
          : _textStyle.decorationThickness! / factor,
    );
  }
}

class AdaptGeneric<T> {
  final T _data;
  AdaptGeneric({
    required T data,
  }) : _data = data;

  T fixed(BuildContext context) {
    final factor = AdaptiveSettings.ofAdaptive(context);
    return (_data as dynamic) / factor as T;
  }
}
