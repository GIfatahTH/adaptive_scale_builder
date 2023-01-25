import 'package:adaptive_scale_builder/adaptive_scale_builder.dart';
import 'package:adaptive_scale_builder/src/adaptive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'common.dart';

void main() {
  setUp(() {
    isMobileTest = null;
    AdaptiveSettings.baseWidth = 500;
    AdaptiveSettings.scaleFactor = 1;
    AdaptiveSettings.query = [];
  });
  testGoldens(
    '001 - safe area without adaptive layout',
    (tester) async {
      var widget = SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: const SizedBox(),
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'safe_area/safe_area_001');
    },
  );

  testGoldens(
    '002 - safe area is a parent of AdaptiveLayout',
    (tester) async {
      var widget = SafeArea(
        child: AdaptiveLayout(
          child: Scaffold(
            appBar: AppBar(),
            body: const SizedBox(),
          ),
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'safe_area/safe_area_002');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'safe_area/safe_area_003');
    },
  );

  testGoldens(
    '003 - safe area is a child of AdaptiveLayout',
    (tester) async {
      var widget = AdaptiveLayout(
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(),
            body: const SizedBox(),
          ),
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'safe_area/safe_area_004');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'safe_area/safe_area_005');
    },
  );

  testGoldens(
    '004 - safe area is a parent of AdaptiveLayout.orientation',
    (tester) async {
      var widget = SafeArea(
        child: AdaptiveLayout.orientation(
          child: Scaffold(
            appBar: AppBar(),
            body: const SizedBox(),
          ),
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'safe_area/safe_area_002');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'safe_area/safe_area_003');
    },
  );

  testGoldens(
    '005 - safe area is a child of AdaptiveLayout.orientation',
    (tester) async {
      var widget = AdaptiveLayout.orientation(
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(),
            body: const SizedBox(),
          ),
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'safe_area/safe_area_004');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'safe_area/safe_area_005');
    },
  );

  testGoldens(
    '006 - safe area is a parent of AdaptiveLayout.orientation for mobile',
    (tester) async {
      isMobileTest = true;
      var widget = SafeArea(
        child: AdaptiveLayout.orientation(
          child: Scaffold(
            appBar: AppBar(),
            body: const SizedBox(),
          ),
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'safe_area/safe_area_006');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'safe_area/safe_area_007');
    },
  );

  testGoldens(
    '007 - safe area is a child of AdaptiveLayout.orientation for mobile',
    (tester) async {
      isMobileTest = true;
      var widget = AdaptiveLayout.orientation(
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(),
            body: const SizedBox(),
          ),
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'safe_area/safe_area_008');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'safe_area/safe_area_009');
    },
  );

  testGoldens(
    'safe area is a parent of AdaptiveLayout.orientation for mobile with keyboard',
    (tester) async {
      isMobileTest = true;
      var widget = SafeArea(
        child: AdaptiveLayout.orientation(
          child: Scaffold(
            appBar: AppBar(),
            body: const SizedBox(),
          ),
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                  viewInsets: const EdgeInsets.all(160),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'safe_area/safe_area_010');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                  viewInsets: const EdgeInsets.all(160),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'safe_area/safe_area_011');
    },
  );

  testGoldens(
    'safe area is a child of AdaptiveLayout.orientation for mobile with keyboard',
    (tester) async {
      isMobileTest = true;
      var widget = AdaptiveLayout.orientation(
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(),
            body: const SizedBox(),
          ),
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                  viewInsets: const EdgeInsets.all(160),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      expect(find.byKey(const Key('_keyB_BoardH_eight_')), findsNothing);
      await screenMatchesGolden(tester, 'safe_area/safe_area_012');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                  viewInsets: const EdgeInsets.all(160),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      expect(find.byKey(const Key('_keyB_BoardH_eight_')), findsNothing);
      await screenMatchesGolden(tester, 'safe_area/safe_area_013');
    },
  );

  testGoldens(
    'safe area is a parent of AdaptiveLayout.orientation for mobile with keyboard'
    ' with resizeToAvoidBottomInset=false',
    (tester) async {
      isMobileTest = true;
      var widget = SafeArea(
        child: AdaptiveLayout.orientation(
          resizeToAvoidBottomInset: false,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(),
            body: const Center(
              child: Text('text'),
            ),
          ),
        ),
      );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(500, 600),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                  viewInsets: const EdgeInsets.only(bottom: 160),
                ),
                child: widget,
              );
            }),
          );
        },
      );

      await tester.pumpAndSettle();
      expect(find.byKey(const Key('_keyB_BoardH_eight_')), findsOneWidget);
      await screenMatchesGolden(tester, 'safe_area/safe_area_014');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: widget,
        ),
        surfaceSize: const Size(200, 600),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  padding: const EdgeInsets.all(16),
                  viewInsets: const EdgeInsets.only(bottom: 160),
                ),
                child: widget,
              );
            }),
          );
        },
      );
      expect(find.byKey(const Key('_keyB_BoardH_eight_')), findsOneWidget);
      await screenMatchesGolden(tester, 'safe_area/safe_area_015');
    },
  );
}
