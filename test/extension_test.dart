import 'package:adaptive_scale_builder/adaptive_scale_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  setUp(() {
    AdaptiveSettings.baseWidth = 500;
    AdaptiveSettings.scaleFactor = 4;
    AdaptiveSettings.query = [];
  });
  testGoldens(
    '001 - AppBar fixed extension',
    (tester) async {
      Widget widget(BuildContext context) => SafeArea(
            child: Scaffold(
              appBar: AppBar().adapt.fixed(context),
              body: const SizedBox(),
            ),
          );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: Builder(builder: (context) {
            return widget(context);
          }),
        ),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return widget;
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'extension/extension_001');
    },
  );

  testGoldens(
    'AppBar clamp extension',
    (tester) async {
      Widget widget(BuildContext context) => SafeArea(
            child: Scaffold(
              appBar: AppBar().adapt.clamp(context, lower: 40, upper: 100),
              body: const SizedBox(),
            ),
          );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: Builder(builder: (context) {
            return widget(context);
          }),
        ),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return widget;
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'extension/extension_002');
      //
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: Builder(builder: (context) {
            return widget(context);
          }),
        ),
        surfaceSize: const Size(40, 600),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return widget;
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'extension/extension_003');
    },
  );

  testGoldens(
    'double and int fixed extension',
    (tester) async {
      AdaptiveSettings.scaleFactor = 2;
      Widget widget(BuildContext context) => SafeArea(
            child: Scaffold(
              body: Column(children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  width: 50.0.adapt.fixed(context),
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  width: 50,
                  height: 50.0.adapt.fixed(context),
                  color: Colors.blue,
                ),
                Container(
                  width: 50,
                  height: 50.adapt.fixed(context).toDouble(),
                  color: Colors.blue,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ).adapt.fixed(),
              ]),
            ),
          );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: Builder(builder: (context) {
            return widget(context);
          }),
        ),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return widget;
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'extension/extension_004');
      //
    },
  );

  testGoldens(
    'double and int clamp extension1',
    (tester) async {
      AdaptiveSettings.scaleFactor = 2;
      Widget widget(BuildContext context) => SafeArea(
            child: Scaffold(
              body: Column(children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  width: 50.0.adapt.clamp(context, lower: 60, upper: 100),
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  width:
                      50.adapt.clamp(context, lower: 60, upper: 100).toDouble(),
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  width: 50,
                  height: 50.0.adapt.fixed(context),
                  color: Colors.blue,
                )
              ]),
            ),
          );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: Builder(builder: (context) {
            return widget(context);
          }),
        ),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return widget;
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'extension/extension_005');
      //
    },
  );

  testGoldens(
    'double and int clamp extension2',
    (tester) async {
      AdaptiveSettings.scaleFactor = 2;
      Widget widget(BuildContext context) => SafeArea(
            child: Scaffold(
              body: Column(children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  width: 50.0.adapt.clamp(context, lower: 60, upper: 100),
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  width:
                      50.adapt.clamp(context, lower: 60, upper: 100).toDouble(),
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  width: 50,
                  height: 50.0.adapt.fixed(context),
                  color: Colors.blue,
                )
              ]),
            ),
          );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: Builder(builder: (context) {
            return widget(context);
          }),
        ),
        surfaceSize: const Size(100, 600),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return widget;
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'extension/extension_006');
      //
    },
  );

  testGoldens(
    'EdgeInsetsGeometry, BoxDecoration extension',
    (tester) async {
      AdaptiveSettings.scaleFactor = 2;
      Widget widget(BuildContext context) => SafeArea(
            child: Scaffold(
              body: Column(children: [
                Row(
                  children: [
                    Container(
                      color: Colors.blue,
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        width: 50,
                        height: 50,
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Container(
                        margin: const EdgeInsets.all(5).adapt.fixed(context),
                        width: 50,
                        height: 50,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedSpacer.fixed(),
                Row(
                  children: [
                    Container(
                      color: Colors.blue,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red,
                        ),
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(30).adapt.fixed(context),
                          color: Colors.red,
                        ),
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.red,
                        ),
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              const Radius.circular(30).adapt.fixed(context)),
                          color: Colors.red,
                        ),
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
                const SizedSpacer(),
                const Text(
                  'This is a Text',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedSpacer.fixed(),
                Text(
                  'This is a Text',
                  style: const TextStyle(fontSize: 16).adapt.fixed(context),
                ),
              ]),
            ),
          );
      await tester.pumpWidgetBuilder(
        AdaptiveLayout(
          child: Builder(builder: (context) {
            return widget(context);
          }),
        ),
        wrapper: (widget) {
          return MaterialApp(
            home: Builder(builder: (context) {
              return widget;
            }),
          );
        },
      );
      await screenMatchesGolden(tester, 'extension/extension_007');
      //
    },
  );
}
