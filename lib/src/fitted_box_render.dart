import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'resizer.dart';

class MyFittedBox extends SingleChildRenderObjectWidget {
  const MyFittedBox({
    required this.width,
    required this.height,
    this.inheritedFraction = 1.0,
    required this.fitTheShortestSide,
    this.respectAspectRation = true,
    super.key,
    super.child,
  });
  final double? width, height, inheritedFraction;

  final bool fitTheShortestSide, respectAspectRation;
  @override
  MyRenderFittedBox createRenderObject(BuildContext context) {
    return MyRenderFittedBox(
      width: width,
      height: height,
      inheritedFraction: inheritedFraction,
      fitTheShortestSide: fitTheShortestSide,
      respectAspectRation: respectAspectRation,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, MyRenderFittedBox renderObject) {
    renderObject
      ..width = width
      ..height = height
      ..fitTheShortestSide = fitTheShortestSide
      ..inheritedFraction = inheritedFraction
      ..respectAspectRation = respectAspectRation;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

class MyRenderFittedBox extends MyRenderFittedBoxBase {
  MyRenderFittedBox({
    required super.width,
    required super.height,
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

  Size? baseChildSize;
  Constraints? cachedConstraints;

  @override
  set child(RenderBox? value) {
    baseChildSize = null;
    _clearPaintData();
    super.child = value;
  }

  Size _layout(
    BoxConstraints c,
    bool parentUsesSize, [
    bool compareWithAdaptiveWidth = true,
  ]) {
    if (!c.isNormalized) {
      c = c.copyWith(maxWidth: constraints.constrainWidth(c.maxWidth));
      assert(c.isNormalized);
    }
    if (baseChildSize == null || !compareWithAdaptiveWidth) {
      if (baseChildSize == null) {
        print('====== created =====');
      } else {
        print('====== cached =====');
      }
      child!.layout(
        c,
        parentUsesSize: parentUsesSize,
      );
    }
    final adaptiveWidth = child!.size.width * _inheritedFraction!;
    final size = Size(
      min(adaptiveWidth, c.maxWidth),
      min(adaptiveWidth / child!.size.aspectRatio, c.maxHeight),
    );
    if (!compareWithAdaptiveWidth) {
      return size;
    }
    baseChildSize ??= child!.size;

    if (baseChildSize!.width == c.maxWidth) {
      final widthScale = baseChildSize!.height / size.height;
      final constrainedSize = _layout(
        constraints.copyWith(maxWidth: constraints.maxWidth * widthScale),
        parentUsesSize,
        false,
      );

      scaleSize = getScaleSize(
        child!.size,
        Size(constraints.maxWidth, constrainedSize.height),
      );
      return Size(
        child!.size.width * scaleSize.width,
        child!.size.height * scaleSize.height,
      );
    }
    scaleSize = getScaleSize(child!.size, size);
    baseChildSize = null;
    return Size(child!.size.width * scaleSize.width,
        child!.size.height * scaleSize.height);
  }

  @override
  void performLayout() {
    if (cachedConstraints != constraints) {
      baseChildSize = null;
      _clearPaintData();
      cachedConstraints = constraints;
    }

    final maxWidth = Resize.adaptiveWidth
        // +
        //     0 *
        //         min(Resize.adaptiveWidth, constraints.maxWidth) /
        //         _inheritedFraction!
        ;
    final c = constraints.copyWith(
      maxWidth: maxWidth,
    );
    final s = _layout(c, true);
    size = s;
    // size = constraints.constrain(s);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    if (cachedConstraints != constraints) {
      baseChildSize = null;
      cachedConstraints = constraints;
    }
    final maxWidth =
        min(Resize.adaptiveWidth, constraints.maxWidth) / _inheritedFraction!;
    final c = constraints.copyWith(
      maxWidth: maxWidth,
    );
    final s = _layout(c, false);
    return constraints.constrain(s);
  }

  Size getScaleSize(Size source, Size destination) {
    destination = constraints.constrain(destination);
    final FittedSizes sizes = applyBoxFit(BoxFit.contain, source, destination);
    final double scaleX = sizes.destination.width / sizes.source.width;
    final double scaleY = sizes.destination.height / sizes.source.height;
    return Size(scaleX, scaleY);
  }

//   @override
//   void performLayout() {
//     assert(child != null);

//     final maxWidth = _inheritedFraction != null
//         ? Resize.adaptiveWidth
//         : this.constraints.maxWidth;

//     final loosenConstraints = BoxConstraints(
//       maxWidth: maxWidth,
//       maxHeight: this.constraints.maxHeight,
//     );
//     Size childSize;
//     if (cachedChildSize != null &&
//         cachedLoosenConstraints?.maxHeight == loosenConstraints.maxHeight) {
//       print('****CachedChildSize****');
//       childSize = cachedChildSize!;
//     } else {
//       print('************CREATE LaYOUT*************');

//       cachedLoosenConstraints = loosenConstraints;

//       child!.layout(cachedLoosenConstraints!, parentUsesSize: true);
//       childSize = child!.size;
//       cachedChildSize = childSize;
//     }

//     final constraints = this.constraints.loosen();
//     constrainedSize = childSize.isFinite && !childSize.isEmpty
//         ? constraints.constrainSizeAndAttemptToPreserveAspectRatio(childSize)
//         : null;
//     if (childSize.width == maxWidth) {
//       constrainedSize = childSize.height == constraints.maxHeight
//           ? childSize
//           : !_respectAspectRation && childSize.width > constraints.maxWidth
//               ? constraints.constrain(Size(
//                   (_inheritedFraction ?? 1) * Resize.adaptiveWidth,
//                   childSize.height * (_inheritedFraction ?? 1) * (_width ?? 1),
//                 ))
//               : constraints.constrainSizeAndAttemptToPreserveAspectRatio(
//                   Size(
//                     constraints.maxWidth,
//                     constrainedSize!.height *
//                         (_inheritedFraction ?? 1) *
//                         (_width ?? 1),
//                   ),
//                 );

//       constrainedSize = constraints.constrain(constrainedSize!);

//       final double scaleY = constrainedSize!.height / childSize.height;

//       child!.layout(
//         loosenConstraints.copyWith(
//           maxWidth: constrainedSize!.width / (scaleY > 0 ? scaleY : 1),
//           maxHeight: constrainedSize!.height / (scaleY > 0 ? scaleY : 1),
//         ),
//         parentUsesSize: true,
//       );
//       childSize = child!.size;

//       _boxFit1 = BoxFit.cover;

//       constrainedSize = constrainedSize!;
//     } else {
//       constrainedSize =
//           constraints.constrainSizeAndAttemptToPreserveAspectRatio(
//         Size(
//           constrainedSize!.width * (_inheritedFraction ?? 1) * (_width ?? 1),
//           constrainedSize!.height * (_inheritedFraction ?? 1) * (_width ?? 1),
//         ),
//       );
//       if (constrainedSize!.width == constraints.maxWidth) {
//         if (childSize.width > constraints.maxWidth) {
//           // child!.layout(
//           //     cachedLoosenConstraints!.copyWith(maxWidth: constraints.maxWidth),
//           //     parentUsesSize: true);
//           // childSize = child!.size;
//           // constrainedSize = constraints.constrain(childSize);
//           cachedChildSize = null;
//         } else {
//           // child!.layout(
//           //             cachedLoosenConstraints!.copyWith(maxWidth: constraints.maxWidth),
//           //             parentUsesSize: true);
//           //         childSize = child!.size;
//           //         constrainedSize = constraints.constrain(childSize);

//           cachedChildSize = null;
//         }
//       } else {
//         cachedChildSize = null;
//       }

//       _boxFit1 = BoxFit.cover;
//       // cachedChildSize = null;
//     }

//     size = constrainedSize!;
//     _clearPaintData();
//   }
}

class MyRenderFittedBoxBase extends RenderProxyBox {
  MyRenderFittedBoxBase({
    required double? width,
    required double? height,
    required bool fitTheShortestSide,
    required double? inheritedFraction,
  })  : _width = width,
        _height = height,
        _fitTheShortestSide = fitTheShortestSide,
        _inheritedFraction = inheritedFraction;

  double? _width;
  set width(double? value) {
    if (value == _width) {
      return;
    }
    _width = value;
    // _transform = null;
    markNeedsLayout();
  }

  double? _height;
  set height(double? value) {
    if (value == _height) {
      return;
    }
    _height = value;

    markNeedsLayout();
  }

  double? _inheritedFraction;
  set inheritedFraction(double? value) {
    if (value == _inheritedFraction) {
      return;
    }
    _inheritedFraction = value;
    _transform = null;
    markNeedsLayout();
  }

  bool _fitTheShortestSide;
  set fitTheShortestSide(bool value) {
    if (value == _fitTheShortestSide) {
      return;
    }
    _fitTheShortestSide = value;

    markNeedsLayout();
  }

  // Size? constrainedSize;
  Size scaleSize = const Size(1, 1);
  // bool? _hasVisualOverflow = false;
  Matrix4? _transform;

  void _clearPaintData() {
    // _hasVisualOverflow = false;
    _transform = null;
  }

  void _updatePaintData() {
    if (_transform != null) {
      return;
    }
    _transform = Matrix4.identity()
      ..scale(scaleSize.width, scaleSize.height, 1.0);
    assert(_transform!.storage.every((double value) => value.isFinite));
  }

  TransformLayer? _paintChildWithTransform(
      PaintingContext context, Offset offset) {
    final Offset? childOffset = MatrixUtils.getAsTranslation(_transform!);
    if (childOffset == null) {
      return context.pushTransform(
        needsCompositing,
        offset,
        _transform!,
        super.paint,
        oldLayer: layer is TransformLayer ? layer! as TransformLayer : null,
      );
    } else {
      super.paint(context, offset + childOffset);
    }
    return null;
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
