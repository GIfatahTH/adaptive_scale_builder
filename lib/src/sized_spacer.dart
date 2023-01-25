import 'package:adaptive_scale_builder/adaptive_scale_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SizedSpacer extends SingleChildRenderObjectWidget {
  // ignore: use_key_in_widget_constructors
  const SizedSpacer([this.space = 8.0]) : isFixed = false;

  // ignore: use_key_in_widget_constructors
  const SizedSpacer.fixed([this.space = 8.0]) : isFixed = true;
  final double space;
  final bool isFixed;

  @override
  RenderObject createRenderObject(BuildContext context) {
    if (isFixed) {
      final factor = AdaptiveSettings.ofAdaptive(context);
      return _RenderSizedSpacer(space / factor);
    }
    return _RenderSizedSpacer(space);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderObject renderObject) {
    if (isFixed) {
      final factor = AdaptiveSettings.ofAdaptive(context);
      (renderObject as _RenderSizedSpacer).space = space / factor;
    } else {
      (renderObject as _RenderSizedSpacer).space = space;
    }
  }
}

class _RenderSizedSpacer extends RenderProxyBox {
  _RenderSizedSpacer(double space) : _space = space;

  double _space = 0.0;
  set space(double value) {
    if (_space == value) {
      return;
    }
    _space = value;
    markNeedsLayout();
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    assert(
        parent is RenderFlex,
        'The parent of a SizedSpacer is not a Flex widget.\n'
        '"SizedSpacer" MUST BE A DIRECT CHILD OF A COLUMN OR A ROW.');
    final direction = (parent as RenderFlex).direction;
    final size =
        direction == Axis.horizontal ? Size(_space, 0) : Size(0, _space);
    return constraints.constrain(size);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }
}
