import 'package:adaptive_scale_builder/adaptive_scale_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'common.dart';

void main() {
  setUp(() {
    Resize.adaptiveWidth = 500;
    InheritedLayout.scaleFactor = 1;
    ScaffoldInheritedLayout.query = [];
  });
  testGoldens(
    '001 - simple adaptive',
    (tester) async {
      final widget = Center(
        child: Column(
          children: [
            Text('This is you').colorize(),
            SizedBox(
              width: 500,
              child: Text('This is you').resizeAdaptive().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Text('This is you').resizeAdaptive().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Text('This is you').resizeAdaptive().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: Text('This is you').resizeAdaptive().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: Text('This is you').resizeAdaptive().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: Text('This is you').resizeAdaptive().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: Text('This is you').resizeAdaptive().colorize(),
            ),
          ],
        ),
      );
      await tester.pumpWidgetBuilder(
        ScaffoldInheritedLayout(builder: (_, __) {
          return widget;
        }),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'simple/simple001');
      await tester.pumpWidgetBuilder(
        ScaffoldInheritedLayout(builder: (_, __) {
          return widget;
        }),
        surfaceSize: const Size(500, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'simple/simple002');

      await tester.pumpWidgetBuilder(
        ScaffoldInheritedLayout(builder: (_, __) {
          return widget;
        }),
        surfaceSize: const Size(400, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'simple/simple003');
      await tester.pumpWidgetBuilder(
        ScaffoldInheritedLayout(builder: (_, __) {
          return widget;
        }),
        surfaceSize: const Size(200, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'simple/simple004');
      //
      await tester.pumpWidgetBuilder(
        ScaffoldInheritedLayout(builder: (_, __) {
          return widget;
        }),
        surfaceSize: const Size(50, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'simple/simple005');
    },
  );
}
