import 'package:adaptive_scale_builder/adaptive_scale_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'common.dart';

void main() {
  setUp(() {
    AdaptiveSettings.baseWidth = 500;
    AdaptiveSettings.scaleFactor = 1;
    AdaptiveSettings.query = [];
  });
  testGoldens(
    '001 - simple scale adaptive ',
    (tester) async {
      final widget = Center(
        child: Column(
          children: [
            const Text('This is you').adapt.fixed().colorize(),
            SizedBox(
              width: 500,
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
          ],
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'simple_widget/simple/simple001');
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(500, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'simple_widget/simple/simple002');

      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(400, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'simple_widget/simple/simple003');
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'simple_widget/simple/simple004');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(50, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'simple_widget/simple/simple005');
    },
  );

  testGoldens(
    '002 - simple resize adaptive ',
    (tester) async {
      final widget = Center(
        child: Column(
          children: [
            const Text('This is you').adapt.fixed().colorize(),
            SizedBox(
              width: 500,
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
          ],
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple/simple001');
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(500, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple/simple002');

      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(400, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple/simple003');
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple/simple004');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(50, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple/simple005');
    },
  );

  testGoldens(
    '003 - simple scale adaptive with adaptiveWidth 250  ',
    (tester) async {
      AdaptiveSettings.baseWidth = 250;

      final widget = Center(
        child: Column(
          children: [
            const Text('This is you').adapt.fixed().colorize(),
            SizedBox(
              width: 500,
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
          ],
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/scale_adaptiveWidth250/simple001');
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(500, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/scale_adaptiveWidth250/simple002');

      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(400, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/scale_adaptiveWidth250/simple003');
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/scale_adaptiveWidth250/simple004');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(50, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/scale_adaptiveWidth250/simple005');
    },
  );

  testGoldens(
    '004 - simple resize adaptive with adaptiveWidth 350 ',
    (tester) async {
      AdaptiveSettings.baseWidth = 350;
      final widget = Center(
        child: Column(
          children: [
            const Text('This is you').adapt.fixed().colorize(),
            SizedBox(
              width: 500,
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            // ConstrainedBox(
            //   constraints: const BoxConstraints(maxWidth: 250),
            //   child: const Text('This is you').adapt.resize().colorize(),
            // ),
            // ConstrainedBox(
            //   constraints: const BoxConstraints(maxWidth: 200),
            //   child: const Text('This is you').adapt.resize().colorize(),
            // ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
          ],
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple_adaptiveWidth250/simple001');
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(500, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple_adaptiveWidth250/simple002');

      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(400, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple_adaptiveWidth250/simple003');
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple_adaptiveWidth250/simple004');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(50, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple_adaptiveWidth250/simple005');
    },
  );

  testGoldens(
    '005 - simple scale adaptive with scaleFactor 2 ',
    (tester) async {
      AdaptiveSettings.scaleFactor = 2;

      final widget = Center(
        child: Column(
          children: [
            const Text('This is you').adapt.fixed().colorize(),
            SizedBox(
              width: 500,
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
          ],
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/scale_scaleAdaptive2/simple001');
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(500, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/scale_scaleAdaptive2/simple002');

      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(400, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/scale_scaleAdaptive2/simple003');
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/scale_scaleAdaptive2/simple004');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(50, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/scale_scaleAdaptive2/simple005');
    },
  );

  testGoldens(
    '006 - simple resize adaptive with scaleFactor 2 ',
    (tester) async {
      AdaptiveSettings.scaleFactor = 1.2;
      final widget = Center(
        child: Column(
          children: [
            const Text('This is you').adapt.fixed().colorize(),
            SizedBox(
              width: 500,
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            // ConstrainedBox(
            //   constraints: const BoxConstraints(maxWidth: 250),
            //   child: const Text('This is you').adapt.resize().colorize(),
            // ),
            // ConstrainedBox(
            //   constraints: const BoxConstraints(maxWidth: 200),
            //   child: const Text('This is you').adapt.resize().colorize(),
            // ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
          ],
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple_scaleFactor2/simple001');
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(500, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple_scaleFactor2/simple002');

      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(400, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple_scaleFactor2/simple003');
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple_scaleFactor2/simple004');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(50, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple_scaleFactor2/simple005');
    },
  );

  testGoldens(
    '007 - simple scale adaptive with query ',
    (tester) async {
      AdaptiveSettings.query = [
        Query.constant(step: 400),
        Query.linear(step: 500),
        Query.constant(),
      ];
      final widget = Center(
        child: Column(
          children: [
            const Text('This is you').adapt.fixed().colorize(),
            SizedBox(
              width: 500,
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: const Text('This is you').adapt.scale().colorize(),
            ),
          ],
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'simple_widget/scale_query/simple001');
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(500, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'simple_widget/scale_query/simple002');

      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(400, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'simple_widget/scale_query/simple003');
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'simple_widget/scale_query/simple004');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(50, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(tester, 'simple_widget/scale_query/simple005');
    },
  );

  testGoldens(
    '008 - simple resize adaptive with query ',
    (tester) async {
      AdaptiveSettings.query = [
        Query.constant(step: 400),
        Query.linear(step: 500),
        Query.constant(),
      ];
      final widget = Center(
        child: Column(
          children: [
            const Text('This is you').adapt.fixed().colorize(),
            SizedBox(
              width: 500,
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: const Text('This is you').adapt.resize().colorize(),
            ),
          ],
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple_query/simple001');
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(500, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple_query/simple002');

      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(400, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple_query/simple003');
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple_query/simple004');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(50, 600),
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );
      await screenMatchesGolden(
          tester, 'simple_widget/resize_simple_query/simple005');
    },
  );

//
}
