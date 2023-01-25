import 'package:adaptive_scale_builder/adaptive_scale_builder.dart';
import 'package:flutter/material.dart';

extension on Widget {
  Widget colorize([Color? color]) => ColoredBox(
        color: color ?? Colors.blue,
        child: this,
      );
}

void main() {
  // AdaptiveSettings.query = [Query.constant(step: 600)];
  AdaptiveSettings.scaleFactor = 1;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: //

          // AdaptiveExample(),
          Builder(builder: (context) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            padding: EdgeInsets.all(24),
          ),
          child: _WorkSpace(),
        );
      }),
    );
  }
}

class _WorkSpace extends StatelessWidget {
  _WorkSpace({super.key});

  @override
  Widget build(BuildContext context) {
    print('**********************builder material*****************');
    return AdaptiveLayout(
      child: Builder(
        builder: (context) {
          print('*******************builder AdaptiveLayout*******************');
          AdaptiveSettings.scaleFactor = 4;
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
          return Scaffold(
            appBar: AppBar().adapt.clamp(context, lower: 80, upper: 100),
            body: widget,
          );
        },
      ),
    );
  }
}
