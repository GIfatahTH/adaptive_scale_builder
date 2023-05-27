import 'dart:io';

import 'package:adaptive_scale_builder/adaptive_scale_builder.dart';

import 'fitted_box_render.dart';
import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  factory AdaptiveLayout.orientation({
    Key? key,
    required Widget child,

    /// Should be the same as [Scaffold.resizeToAvoidBottomInset].
    bool resizeToAvoidBottomInset = true,

    /// Should be the same as [SingleChildScrollView.physics].
    final ScrollPhysics? physics,
  }) {
    return AdaptiveLayout._(
      child: Builder(builder: (context) {
        return _SingleChildScrollViewHolder(
          // mediaQuery: MediaQuery.of(context),
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          physics: physics,
          child: Builder(builder: (_) {
            final mediaQuery = MediaQuery.of(context);
            final adaptiveFactor = AdaptiveSettings.ofAdaptive(context);
            return MediaQuery(
              data: mediaQuery.copyWith(
                viewInsets: mediaQuery.viewInsets / adaptiveFactor,
                viewPadding: mediaQuery.viewPadding / adaptiveFactor,
                padding: mediaQuery.padding / adaptiveFactor,
              ),
              child: MyFittedBox(
                fitTheShortestSide: true,
                scale: 1,
                child: child,
              ),
            );
          }),
        );
      }),
    );
  }

  factory AdaptiveLayout({
    Key? key,
    required Widget child,
  }) {
    return AdaptiveLayout._(
      child: Builder(
        builder: (context) {
          final mediaQuery = MediaQuery.of(context);
          final adaptiveFactor = AdaptiveSettings.ofAdaptive(context);
          return MediaQuery(
            data: mediaQuery.copyWith(
              viewInsets: mediaQuery.viewInsets / adaptiveFactor,
              viewPadding: mediaQuery.viewPadding / adaptiveFactor,
              padding: mediaQuery.padding / adaptiveFactor,
            ),
            child: MyFittedBox(
              fitTheShortestSide: true,
              scale: 1,
              child: child,
            ),
          );
        },
      ),
    );
  }

  const AdaptiveLayout._({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScaffoldInheritedLayoutWidget(
          layoutConstraints: constraints,
          child: child,
        );
      },
    );
  }
}

class ScaffoldInheritedLayoutWidget extends InheritedWidget {
  const ScaffoldInheritedLayoutWidget({
    super.key,
    required super.child,
    required this.layoutConstraints,
    // required this.context,
  });
  final BoxConstraints layoutConstraints;
  // final BuildContext context;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

bool? isMobileTest;

class _SingleChildScrollViewHolder extends StatefulWidget {
  const _SingleChildScrollViewHolder({
    Key? key,
    required this.child,
    // required this.mediaQuery,
    required this.resizeToAvoidBottomInset,
    this.physics,
  }) : super(key: key);
  final Widget child;
  // final MediaQueryData mediaQuery;

  /// Should be the same as [Scaffold.resizeToAvoidBottomInset].
  final bool resizeToAvoidBottomInset;

  /// Should be the same as [SingleChildScrollView.physics].
  final ScrollPhysics? physics;
  @override
  State<_SingleChildScrollViewHolder> createState() =>
      _SingleChildScrollViewHolderState();
}

class _SingleChildScrollViewHolderState
    extends State<_SingleChildScrollViewHolder> {
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final mediaQuery = MediaQuery.of(context);

    var isPortrait = mediaQuery.orientation == Orientation.portrait;

    var isMobile = Platform.isAndroid || Platform.isIOS;

    assert(() {
      if (isMobileTest != null) {
        isMobile = isMobileTest!;
      }
      return true;
    }());
    if (!isMobile) {
      return widget.child;
    }

    final constraints = context
        .dependOnInheritedWidgetOfExactType<ScaffoldInheritedLayoutWidget>()!
        .layoutConstraints;
    final maxHeight = isPortrait ? constraints.maxHeight : constraints.maxWidth;

    final keyBoardHeight =
        !widget.resizeToAvoidBottomInset ? mediaQuery.viewInsets.bottom : 0.0;

    return SingleChildScrollView(
      primary: false,
      physics: const ClampingScrollPhysics(),
      child: Flex(
        direction: Axis.vertical,
        children: [
          SizedBox(
            height: maxHeight,
            child: widget.child,
          ),
          if (keyBoardHeight > 0)
            SizedBox(
              key: const Key('_keyB_BoardH_eight_'),
              height: keyBoardHeight,
            ),
        ],
      ),
    );
  }
}
