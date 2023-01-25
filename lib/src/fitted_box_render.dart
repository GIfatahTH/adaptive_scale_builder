import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../adaptive_scale_builder.dart';

class MyFittedBox extends SingleChildRenderObjectWidget {
  const MyFittedBox({
    this.scale,
    required this.fitTheShortestSide,
    this.respectAspectRation = true,
    this.ignoreGlobalResizing = false,
    super.key,
    super.child,
  });
  final double? scale;
  final bool fitTheShortestSide, respectAspectRation, ignoreGlobalResizing;
  @override
  MyRenderFittedBox createRenderObject(BuildContext context) {
    final fraction =
        AdaptiveSettings.of(context).maxWidth / AdaptiveSettings.baseWidth;

    return MyRenderFittedBox(
      inheritedFraction: scale == null
          ? 1 / fraction
          : scale! * (ignoreGlobalResizing ? 1 : fraction),
      fitTheShortestSide: fitTheShortestSide,
      respectAspectRation: respectAspectRation,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, MyRenderFittedBox renderObject) {
    final fraction =
        AdaptiveSettings.of(context).maxWidth / AdaptiveSettings.baseWidth;
    renderObject
      ..fitTheShortestSide = fitTheShortestSide
      ..inheritedFraction = scale == null
          ? 1 / fraction
          : scale! * (ignoreGlobalResizing ? 1 : fraction)
      ..respectAspectRation = respectAspectRation;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

class MyRenderFittedBox extends MyRenderFittedBoxBase {
  MyRenderFittedBox({
    required super.fitTheShortestSide,
    required super.inheritedFraction,
    required bool respectAspectRation,
  }) : _respectAspectRation = respectAspectRation;

  bool _respectAspectRation;
  set respectAspectRation(bool value) {
    if (value == _respectAspectRation) {
      return;
    }
    _respectAspectRation = value;

    markNeedsLayout();
  }

  Constraints? cachedConstraints;

  Size _layout(
    BoxConstraints c,
    bool parentUsesSize, {
    bool compareWithAdaptiveWidth = true,
  }) {
    if (!c.isNormalized) {
      // Non normalized constraint, are not normalized in the width dimension.
      c = c.copyWith(maxWidth: constraints.constrainWidth(c.maxWidth));
      assert(c.isNormalized);
    }
    if (baseChildSize == null || !compareWithAdaptiveWidth) {
      // baseChildSize caches the size of the child for performance consideration
      if (baseChildSize == null) {
        print('====== created: scale: $_scaleSize =====');
      } else {
        print('====== cached scale: $_scaleSize =====');
      }
      child!.layout(
        c,
        parentUsesSize: parentUsesSize,
      );
    }
    // The adaptive width is the width of the child times the inherited fraction
    final adaptiveWidth = child!.size.width * _inheritedFraction!;
    final adaptiveSize = Size(
      adaptiveWidth,
      adaptiveWidth / child!.size.aspectRatio,
      // min(adaptiveWidth / child!.size.aspectRatio, c.maxHeight),
    );
    if (!compareWithAdaptiveWidth) {
      return adaptiveSize;
    }
    // caching the child size
    baseChildSize ??= child!.size;

    if (baseChildSize!.width == c.maxWidth ||
        baseChildSize!.height == c.maxHeight) {
      // if child width equals the max constrained width (child takes the max
      // available width), we try to relayout the child with adaptive constraints
      final widthScale = baseChildSize!.height / adaptiveSize.height;
      final constrainedSize = _layout(
        constraints.copyWith(
          maxWidth: (constraints.maxWidth * widthScale).roundToDouble(),
          maxHeight: (constraints.maxHeight * widthScale).roundToDouble(),
          minWidth: constraints.hasTightWidth
              ? (constraints.maxWidth * widthScale).roundToDouble()
              : null,
          minHeight: constraints.hasTightHeight
              ? (constraints.maxHeight * widthScale).roundToDouble()
              : null,
        ),
        parentUsesSize,
        compareWithAdaptiveWidth: false,
      );
      //
      _scaleSize ??= getScaleSize(
        child!.size,
        Size(constraints.maxWidth, constrainedSize.height),
      );
      return Size(
        child!.size.width * _scaleSize!.width,
        child!.size.height * _scaleSize!.height,
      );
    }
    _scaleSize ??= getScaleSize(child!.size, adaptiveSize);
    baseChildSize = null;
    return Size(child!.size.width * _scaleSize!.width,
        child!.size.height * _scaleSize!.height);
  }

  BoxConstraints _setUpConstraints() {
    if (cachedConstraints != constraints) {
      _clearPaintData();
      cachedConstraints = constraints;
    }
    final r = constraints.maxWidth;
    final maxWidth = _fitTheShortestSide || r > AdaptiveSettings.baseWidth
        ? AdaptiveSettings.baseWidth
        : min(AdaptiveSettings.baseWidth, constraints.maxWidth) /
            _inheritedFraction!;

    return constraints.copyWith(
      maxWidth: maxWidth,
    );
  }

  @override
  void performLayout() {
    final c = _setUpConstraints();
    final s = _layout(c, true);

    size = constraints.constrain(s);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final c = _setUpConstraints();
    final s = _layout(c, false);
    return constraints.constrain(s);
  }

  Size getScaleSize(Size source, Size destination) {
    if (_fitTheShortestSide) {
      destination = constraints.constrain(destination);
    }
    final FittedSizes sizes = applyBoxFit(BoxFit.contain, source, destination);
    final double scaleX = sizes.destination.width / sizes.source.width;
    final double scaleY = sizes.destination.height / sizes.source.height;
    return Size(scaleX, scaleY);
  }
}

class MyRenderFittedBoxBase extends RenderProxyBox {
  MyRenderFittedBoxBase({
    required bool fitTheShortestSide,
    required double? inheritedFraction,
  })  : _fitTheShortestSide = fitTheShortestSide,
        _inheritedFraction = inheritedFraction;

  double? _inheritedFraction;
  set inheritedFraction(double? value) {
    if (value == _inheritedFraction) {
      return;
    }
    print(value);
    _inheritedFraction = value;
    _clearPaintData();
    markNeedsLayout();
  }

  bool _fitTheShortestSide;
  set fitTheShortestSide(bool value) {
    if (value == _fitTheShortestSide) {
      return;
    }
    _fitTheShortestSide = value;
    _clearPaintData();
    markNeedsLayout();
  }

  Size? baseChildSize;
  Size? _scaleSize;
  Matrix4? _transform;

  @override
  set child(RenderBox? value) {
    _clearPaintData();
    super.child = value;
  }

  @override
  void reassemble() {
    // _clearPaintData();
    baseChildSize = null;
    super.reassemble();
  }

  void _clearPaintData() {
    baseChildSize = null;
    _transform = null;
    _scaleSize = null;
  }

  void _updatePaintData() {
    if (_transform != null) {
      return;
    }
    assert(_scaleSize != null);
    _transform = Matrix4.identity()
      ..scale(_scaleSize!.width, _scaleSize!.height, 1.0);
    assert(_transform!.storage.every((double value) => value.isFinite));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null || size.isEmpty || child!.size.isEmpty) {
      return;
    }
    _updatePaintData();
    assert(child != null);
    layer = context.pushTransform(
      needsCompositing,
      offset,
      _transform!,
      super.paint,
      oldLayer: layer is TransformLayer ? layer! as TransformLayer : null,
    );
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    if (size.isEmpty || (child?.size.isEmpty ?? false)) {
      return false;
    }
    _updatePaintData();
    return result.addWithPaintTransform(
      transform: _transform,
      position: position,
      hitTest: (BoxHitTestResult result, Offset position) {
        return super.hitTestChildren(result, position: position);
      },
    );
  }

  @override
  bool paintsChild(RenderBox child) {
    assert(child.parent == this);
    return !size.isEmpty && !child.size.isEmpty;
  }

  @override
  void applyPaintTransform(RenderBox child, Matrix4 transform) {
    if (!paintsChild(child)) {
      transform.setZero();
    } else {
      _updatePaintData();
      transform.multiply(_transform!);
    }
  }
}
