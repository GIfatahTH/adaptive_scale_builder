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
    '001 - column scale adaptive ',
    (tester) async {
      final widget = Center(
        child: Column(
          children: [
            const Text('This is you').colorize(),
            SizedBox(
              width: 500,
              child: const Text('This is you').colorize(),
            ),
            const Text(
              'This is you',
              style: TextStyle(fontSize: 25),
            ).colorize(),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: const Text('This is you').colorize(),
            ),
          ],
        ).adapt.scale().colorize(Colors.red),
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
      await screenMatchesGolden(tester, 'flex/column/scale/simple001');
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
      await screenMatchesGolden(tester, 'flex/column/scale/simple002');

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
      await screenMatchesGolden(tester, 'flex/column/scale/simple003');
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
      await screenMatchesGolden(tester, 'flex/column/scale/simple004');
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
      await screenMatchesGolden(tester, 'flex/column/scale/simple005');
    },
  );

  testGoldens(
    '002 - column scale adaptive case mainAxisSize: MainAxisSize.min ',
    (tester) async {
      final widget = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('This is you').colorize(),
            SizedBox(
              width: 500,
              child: const Text('This is you').colorize(),
            ),
            const Text(
              'This is you',
              style: TextStyle(fontSize: 25),
            ).colorize(),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: const Text('This is you').colorize(),
            ),
          ],
        ).adapt.scale().colorize(Colors.red),
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
          tester, 'flex/column/scale_mainAxisSize/simple001');
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
          tester, 'flex/column/scale_mainAxisSize/simple002');

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
          tester, 'flex/column/scale_mainAxisSize/simple003');
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
          tester, 'flex/column/scale_mainAxisSize/simple004');
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
          tester, 'flex/column/scale_mainAxisSize/simple005');
    },
  );

  testGoldens(
    '003 - column scale adaptive case SingleChildScrollView',
    (tester) async {
      final widget = Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('This is you').colorize(),
              SizedBox(
                width: 500,
                child: const Text('This is you').colorize(),
              ),
              const Text(
                'This is you',
                style: TextStyle(fontSize: 25),
              ).colorize(),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: const Text('This is you').colorize(),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 250),
                child: const Text('This is you').colorize(),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: const Text('This is you').colorize(),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 100),
                child: const Text('This is you').colorize(),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 50),
                child: const Text('This is you').colorize(),
              ),
            ],
          ).adapt.scale().colorize(Colors.red),
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
          tester, 'flex/column/scale_SingleScrollView/simple001');
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
          tester, 'flex/column/scale_SingleScrollView/simple002');

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
          tester, 'flex/column/scale_SingleScrollView/simple003');
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
          tester, 'flex/column/scale_SingleScrollView/simple004');
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
          tester, 'flex/column/scale_SingleScrollView/simple005');
    },
  );
//
  testGoldens(
    '004 - column resize adaptive ',
    (tester) async {
      final widget = Center(
        child: Column(
          children: [
            const Text('This is you').colorize(),
            SizedBox(
              width: 500,
              child: const Text('This is you').colorize(),
            ),
            const Text(
              'This is you',
              style: TextStyle(fontSize: 25),
            ).colorize(),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: const Text('This is you').colorize(),
            ),
          ],
        ).adapt.resize().colorize(Colors.red),
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
      await screenMatchesGolden(tester, 'flex/column/resize/simple001');
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
      await screenMatchesGolden(tester, 'flex/column/resize/simple002');

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
      await screenMatchesGolden(tester, 'flex/column/resize/simple003');
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
      await screenMatchesGolden(tester, 'flex/column/resize/simple004');
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
      await screenMatchesGolden(tester, 'flex/column/resize/simple005');
    },
  );

  testGoldens(
    '005 - column resize adaptive case mainAxisSize: MainAxisSize.min ',
    (tester) async {
      final widget = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('This is you').colorize(),
            SizedBox(
              width: 500,
              child: const Text('This is you').colorize(),
            ),
            const Text(
              'This is you',
              style: TextStyle(fontSize: 25),
            ).colorize(),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: const Text('This is you').colorize(),
            ),
          ],
        ).adapt.resize().colorize(Colors.red),
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
          tester, 'flex/column/resize_mainAxisSize/simple001');
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
          tester, 'flex/column/resize_mainAxisSize/simple002');

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
          tester, 'flex/column/resize_mainAxisSize/simple003');
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
          tester, 'flex/column/resize_mainAxisSize/simple004');
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
          tester, 'flex/column/resize_mainAxisSize/simple005');
    },
  );

  testGoldens(
    '006 - column resize adaptive case SingleChildScrollView ',
    (tester) async {
      final widget = Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('This is you').colorize(),
              SizedBox(
                width: 500,
                child: const Text('This is you').colorize(),
              ),
              const Text(
                'This is you',
                style: TextStyle(fontSize: 25),
              ).colorize(),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: const Text('This is you').colorize(),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 250),
                child: const Text('This is you').colorize(),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: const Text('This is you').colorize(),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 100),
                child: const Text('This is you').colorize(),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 50),
                child: const Text('This is you').colorize(),
              ),
            ],
          ).adapt.resize().colorize(Colors.red),
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
          tester, 'flex/column/resize_SingleScrollView/simple001');
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
          tester, 'flex/column/resize_SingleScrollView/simple002');

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
          tester, 'flex/column/resize_SingleScrollView/simple003');
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
          tester, 'flex/column/resize_SingleScrollView/simple004');
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
          tester, 'flex/column/resize_SingleScrollView/simple005');
    },
  );
//
  testGoldens(
    '007 - column scale adaptive with query ',
    (tester) async {
      AdaptiveSettings.query = [
        Query.constant(step: 400),
      ];
      final widget = Center(
        child: Column(
          children: [
            const Text('This is you').colorize(),
            SizedBox(
              width: 500,
              child: const Text('This is you').colorize(),
            ),
            const Text(
              'This is you',
              style: TextStyle(fontSize: 25),
            ).colorize(),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: const Text('This is you').colorize(),
            ),
          ],
        ).adapt.scale().colorize(Colors.red),
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
      await screenMatchesGolden(tester, 'flex/column/scaleWithQuery/simple001');
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
      await screenMatchesGolden(tester, 'flex/column/scaleWithQuery/simple002');

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
      await screenMatchesGolden(tester, 'flex/column/scaleWithQuery/simple003');
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
      await screenMatchesGolden(tester, 'flex/column/scaleWithQuery/simple004');
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
      await screenMatchesGolden(tester, 'flex/column/scaleWithQuery/simple005');
    },
  );

  testGoldens(
    '008 - column scale adaptive case mainAxisSize: MainAxisSize.min with query ',
    (tester) async {
      AdaptiveSettings.query = [
        Query.constant(step: 400),
      ];
      final widget = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('This is you').colorize(),
            SizedBox(
              width: 500,
              child: const Text('This is you').colorize(),
            ),
            const Text(
              'This is you',
              style: TextStyle(fontSize: 25),
            ).colorize(),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: const Text('This is you').colorize(),
            ),
          ],
        ).adapt.scale().colorize(Colors.red),
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
          tester, 'flex/column/scale_mainAxisSize_withQuery/simple001');
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
          tester, 'flex/column/scale_mainAxisSize_withQuery/simple002');

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
          tester, 'flex/column/scale_mainAxisSize_withQuery/simple003');
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
          tester, 'flex/column/scale_mainAxisSize_withQuery/simple004');
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
          tester, 'flex/column/scale_mainAxisSize_withQuery/simple005');
    },
  );

  testGoldens(
    '009 - column resize adaptive with query ',
    (tester) async {
      AdaptiveSettings.query = [
        Query.constant(step: 400),
      ];
      final widget = Center(
        child: Column(
          children: [
            const Text('This is you').colorize(),
            SizedBox(
              width: 500,
              child: const Text('This is you').colorize(),
            ),
            const Text(
              'This is you',
              style: TextStyle(fontSize: 25),
            ).colorize(),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: const Text('This is you').colorize(),
            ),
          ],
        ).adapt.resize().colorize(Colors.red),
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
          tester, 'flex/column/resizeWithQuery/simple001');
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
          tester, 'flex/column/resizeWithQuery/simple002');

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
          tester, 'flex/column/resizeWithQuery/simple003');
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
          tester, 'flex/column/resizeWithQuery/simple004');
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
          tester, 'flex/column/resizeWithQuery/simple005');
    },
  );

  testGoldens(
    '010 - column resize adaptive case mainAxisSize: MainAxisSize.min with query ',
    (tester) async {
      AdaptiveSettings.query = [
        Query.constant(step: 400),
        Query.linear(step: 500),
        Query.constant(),
      ];
      final widget = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('This is you').colorize(),
            SizedBox(
              width: 500,
              child: const Text('This is you').colorize(),
            ),
            const Text(
              'This is you',
              style: TextStyle(fontSize: 25),
            ).colorize(),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('This is you').colorize(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 50),
              child: const Text('This is you').colorize(),
            ),
          ],
        ).adapt.resize().colorize(Colors.red),
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
          tester, 'flex/column/resize_mainAxisSize_withQuery/simple001');
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
          tester, 'flex/column/resize_mainAxisSize_withQuery/simple002');

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
          tester, 'flex/column/resize_mainAxisSize_withQuery/simple003');
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
          tester, 'flex/column/resize_mainAxisSize_withQuery/simple004');
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
          tester, 'flex/column/resize_mainAxisSize_withQuery/simple005');
    },
  );

//
}
