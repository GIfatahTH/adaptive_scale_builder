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
            CheckboxListTile(
              value: true,
              onChanged: (_) {},
              title: Text('Check box tile'),
            ).adapt.scale(),
            Column(
              children: [
                CheckboxListTile(
                  value: true,
                  onChanged: (_) {},
                  title: Text('Check box tile'),
                ),
              ],
            ).adapt.scale().colorize(Colors.red),
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
      await screenMatchesGolden(tester, 'checkbox/scale/simple001');
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
      await screenMatchesGolden(tester, 'checkbox/scale/simple002');

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
      await screenMatchesGolden(tester, 'checkbox/scale/simple003');
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
      await screenMatchesGolden(tester, 'checkbox/scale/simple004');
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
      await screenMatchesGolden(tester, 'checkbox/scale/simple005');
    },
  );

  testGoldens(
    '001 - column resize adaptive ',
    (tester) async {
      final widget = Center(
        child: Column(
          children: [
            CheckboxListTile(
              value: true,
              onChanged: (_) {},
              title: Text('Check box tile'),
            ).adapt.resize(),
            Column(
              children: [
                CheckboxListTile(
                  value: true,
                  onChanged: (_) {},
                  title: Text('Check box tile'),
                ),
              ],
            ).adapt.resize().colorize(Colors.red),
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
      await screenMatchesGolden(tester, 'checkbox/resize/simple001');
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
      await screenMatchesGolden(tester, 'checkbox/resize/simple002');

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
      await screenMatchesGolden(tester, 'checkbox/resize/simple003');
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
      await screenMatchesGolden(tester, 'checkbox/resize/simple004');
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
      await screenMatchesGolden(tester, 'checkbox/resize/simple005');
    },
  );

  testGoldens(
    '003 - column scale adaptive with query ',
    (tester) async {
      AdaptiveSettings.query = [
        Query.constant(step: 400),
      ];
      final widget = Center(
        child: Column(
          children: [
            CheckboxListTile(
              value: true,
              onChanged: (_) {},
              title: Text('Check box tile'),
            ).adapt.scale(),
            Column(
              children: [
                CheckboxListTile(
                  value: true,
                  onChanged: (_) {},
                  title: Text('Check box tile'),
                ),
              ],
            ).adapt.scale().colorize(Colors.red),
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
      await screenMatchesGolden(tester, 'checkbox/scaleWithQuery/simple001');
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
      await screenMatchesGolden(tester, 'checkbox/scaleWithQuery/simple002');

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
      await screenMatchesGolden(tester, 'checkbox/scaleWithQuery/simple003');
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
      await screenMatchesGolden(tester, 'checkbox/scaleWithQuery/simple004');

      // await tester.pumpWidgetBuilder(
      //   ScaffoldInheritedLayout(builder: (_) {
      //     return widget;
      //   }),
      //   surfaceSize: const Size(50, 600),
      //   wrapper: materialAppWrapper(
      //     theme: ThemeData.light(),
      //     platform: TargetPlatform.android,
      //   ),
      // );
      // await screenMatchesGolden(tester, 'checkbox/scaleWithQuery/simple005');
    },
  );

  testGoldens(
    '004 - column resize adaptive with query ',
    (tester) async {
      AdaptiveSettings.query = [
        Query.constant(step: 400),
      ];
      final widget = Center(
        child: Column(
          children: [
            CheckboxListTile(
              value: true,
              onChanged: (_) {},
              title: Text('Check box tile'),
            ).adapt.resize(),
            Column(
              children: [
                CheckboxListTile(
                  value: true,
                  onChanged: (_) {},
                  title: Text('Check box tile'),
                ),
              ],
            ).adapt.resize().colorize(Colors.red),
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
      await screenMatchesGolden(tester, 'checkbox/resizeWithQuery/simple001');
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
      await screenMatchesGolden(tester, 'checkbox/resizeWithQuery/simple002');

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
      await screenMatchesGolden(tester, 'checkbox/resizeWithQuery/simple003');
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
      await screenMatchesGolden(tester, 'checkbox/resizeWithQuery/simple004');
      //
      // await tester.pumpWidgetBuilder(
      //   ScaffoldInheritedLayout(builder: (_) {
      //     return widget;
      //   }),
      //   surfaceSize: const Size(50, 600),
      //   wrapper: materialAppWrapper(
      //     theme: ThemeData.light(),
      //     platform: TargetPlatform.android,
      //   ),
      // );
      // await screenMatchesGolden(tester, 'checkbox/resizeWithQuery/simple005');
    },
  );
//
}
