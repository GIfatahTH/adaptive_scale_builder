import 'package:adaptive_scale_builder/adaptive_scale_builder.dart';
import 'package:flutter/material.dart';

extension on Widget {
  Widget colorize([Color? color]) => ColoredBox(
        color: color ?? Colors.blue,
        child: this,
      );
}

void main() {
  AdaptiveSettings.query = [Query.constant(step: 600)];
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

          AdaptiveExample(),
    );
  }
}

class AdaptiveExample extends StatelessWidget {
  static const example = 0;
  AdaptiveExample({super.key}) {
    AdaptiveSettings.baseWidth = 500;
    AdaptiveSettings.scaleFactor = 1;
    AdaptiveSettings.query = [
      // Query.constant(step: 300),
      // Query.linear(step: 1000),
      // Query.constant(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (example == 10) {
      return AdaptiveLayout(
        child: Scaffold(
          appBar: AppBar(
            leading: Text('Leading'),
            title: Text('This is the title of the app'),
          ),
          body: Column(
            children: [
              CircularProgressIndicator(
                color: Colors.white,
              ),
              CheckboxListTile(value: true, onChanged: (_) {}),
              Spacer(),
              Center(
                child: ColoredBox(
                  color: Colors.red,
                  child: Text('HI you'),
                ),
              ),
              Text('HI You'),
              Text('HI'),
              Text('HI'),
            ],
          ).colorize(),
        ).adapt.scale(),
      );
    }
    return Scaffold(
      body: AdaptiveLayout.orientation(child: () {
        if (example == 0) {
          return Column(
            children: [
              const Text('This is you').adapt.fixed().colorize(),
              Spacer(),
              const Text('This is you').colorize(),
              const Text('This is you').adapt.resize(2).colorize(),
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
          );
        }
        if (example == 1) {
          return Column(
            children: [
              const Text('This is you').colorize(),
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
          );
        }
        if (example == 2) {
          return Column(
            children: [
              // const Text(
              //   'This is a text',
              //   style: TextStyle(fontSize: 18),
              // ).adapt.resize(.5).colorize(Colors.red),
              // const Text(
              //   'This is a text',
              //   style: TextStyle(fontSize: 18),
              // ).colorize(),
              // const Text(
              //   'This is a text',
              //   style: TextStyle(fontSize: 18),
              // ).adapt.resize(1).colorize(Colors.red),
              const Text(
                'This is a text',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ).adapt.resize(2).colorize(Colors.red),
              // ConstrainedBox(
              //   constraints: BoxConstraints(
              //     maxWidth: 400,
              //   ),
              //   child: const Text(
              //     'This is a text',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(fontSize: 18),
              //   ).colorize(),
              // ),
              // ConstrainedBox(
              //   constraints: BoxConstraints(
              //     maxWidth: 100,
              //   ),
              //   child: const Text(
              //     'This is a text',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(fontSize: 18),
              //   ).adapt.resize(2).colorize(Colors.red),
              // ),
            ],
          );
        }

        if (example == 3) {
          // return SingleChildScrollView(
          return SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'This is a text',
                  style: TextStyle(fontSize: 48),
                ).colorize(),
                Spacer(),
                const Text(
                  'This is a text',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ).adapt.scale().colorize(Colors.amber),
          );
        }
        if (example == 4) {
          return Column(
            children: [
              Row(
                children: [
                  const Text(
                    'This is a text',
                    style: TextStyle(fontSize: 48),
                  ).colorize(),
                  const Text(
                    'This is a text',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ).adapt.resize(.5).colorize(Colors.amber),
              Row(
                children: [
                  const Text(
                    'This is a text',
                    style: TextStyle(fontSize: 48),
                  ).colorize(),
                  const Text(
                    'This is a text',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ).adapt.resize(1).colorize(Colors.amber),
              Row(
                children: [
                  const Text(
                    'This is a text',
                    style: TextStyle(fontSize: 48),
                  ).colorize(),
                  const Text(
                    'This is a text',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ).adapt.scale(1.2).colorize(Colors.amber),
            ],
          );
        }
        if (example == 5) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CheckboxListTile(
                value: true,
                onChanged: (_) {},
                title: Text('Check box tile'),
              ).adapt.resize(),
              // TextField().adapt.resize().colorize(Colors.amber),
              // TextField().adapt.resize(.5).colorize(Colors.amber),
              // const SizedBox(
              //   height: 8,
              // ),
              // TextField().adapt.resize().colorize(Colors.amber),
              // const SizedBox(
              //   height: 8,
              // ),
              // TextField().adapt.resize(2).colorize(Colors.amber),
            ],
          ).colorize();
        }
        if (example == 6) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.face),
                label: Text('This is an Elevated button'),
              ).adapt.scale(),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.face),
                label: Text('This is an Elevated button'),
              ).adapt.resize(),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 50),
                child: const Text('This is you').adapt.scale().colorize(),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 50),
                child: const Text('This is you').adapt.resize().colorize(),
              ),
              // TextField().adapt.resize().colorize(Colors.amber),
              // TextField().adapt.resize(.5).colorize(Colors.amber),
              // const SizedBox(
              //   height: 8,
              // ),
              // TextField().adapt.resize().colorize(Colors.amber),
              // const SizedBox(
              //   height: 8,
              // ),
              // TextField().adapt.resize(2).colorize(Colors.amber),
            ],
          ).colorize(Colors.grey);
        }
        return const Text('No Example');
      }()),
    );
  }
}
