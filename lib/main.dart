import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import "dart:async";
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _random = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    Timer.periodic(
      Duration(milliseconds: 10),
      _onTimer,
    );
    super.initState();
  }

  void _onTimer(Timer timer) {
    setState(
      () => _random++,
    );
  }

  final maxX = 50.0;
  final maxY = 50.0;
  final radius = 8.0;

  Color blue1 = const Color(0xFF0D47A1);
  Color blue2 = const Color(0xFF42A5F5).withOpacity(0.8);

  List<ScatterSpot> randomData() {
    const blue1Count = 21;
    const blue2Count = 57;
    return List.generate(blue1Count + blue2Count, (i) {
      Color color;
      if (i < blue1Count) {
        color = Colors.blue;
      } else {
        color = Colors.purple;
      }

      return ScatterSpot(
        (Random().nextDouble() * (50.0 - 8)) + 4,
        (Random().nextDouble() * (50.0 - 8)) + 4,
        color: color,
        radius: (Random().nextDouble() * 16) + 4,
      );
    });
  }

  List<ScatterSpot> flutterLogoData() {
    return [
      /// section 1
      ScatterSpot(20, 14.5, color: blue1, radius: radius),
      ScatterSpot(22, 16.5, color: blue1, radius: radius),
      ScatterSpot(24, 18.5, color: blue1, radius: radius),

      ScatterSpot(22, 12.5, color: blue1, radius: radius),
      ScatterSpot(24, 14.5, color: blue1, radius: radius),
      ScatterSpot(26, 16.5, color: blue1, radius: radius),

      ScatterSpot(24, 10.5, color: blue1, radius: radius),
      ScatterSpot(26, 12.5, color: blue1, radius: radius),
      ScatterSpot(28, 14.5, color: blue1, radius: radius),

      ScatterSpot(26, 8.5, color: blue1, radius: radius),
      ScatterSpot(28, 10.5, color: blue1, radius: radius),
      ScatterSpot(30, 12.5, color: blue1, radius: radius),

      ScatterSpot(28, 6.5, color: blue1, radius: radius),
      ScatterSpot(30, 8.5, color: blue1, radius: radius),
      ScatterSpot(32, 10.5, color: blue1, radius: radius),

      ScatterSpot(30, 4.5, color: blue1, radius: radius),
      ScatterSpot(32, 6.5, color: blue1, radius: radius),
      ScatterSpot(34, 8.5, color: blue1, radius: radius),

      ScatterSpot(34, 4.5, color: blue1, radius: radius),
      ScatterSpot(36, 6.5, color: blue1, radius: radius),

      ScatterSpot(38, 4.5, color: blue1, radius: radius),

      /// section 2
      ScatterSpot(20, 14.5, color: blue2, radius: radius),
      ScatterSpot(22, 12.5, color: blue2, radius: radius),
      ScatterSpot(24, 10.5, color: blue2, radius: radius),

      ScatterSpot(22, 16.5, color: blue2, radius: radius),
      ScatterSpot(24, 14.5, color: blue2, radius: radius),
      ScatterSpot(26, 12.5, color: blue2, radius: radius),

      ScatterSpot(24, 18.5, color: blue2, radius: radius),
      ScatterSpot(26, 16.5, color: blue2, radius: radius),
      ScatterSpot(28, 14.5, color: blue2, radius: radius),

      ScatterSpot(26, 20.5, color: blue2, radius: radius),
      ScatterSpot(28, 18.5, color: blue2, radius: radius),
      ScatterSpot(30, 16.5, color: blue2, radius: radius),

      ScatterSpot(28, 22.5, color: blue2, radius: radius),
      ScatterSpot(30, 20.5, color: blue2, radius: radius),
      ScatterSpot(32, 18.5, color: blue2, radius: radius),

      ScatterSpot(30, 24.5, color: blue2, radius: radius),
      ScatterSpot(32, 22.5, color: blue2, radius: radius),
      ScatterSpot(34, 20.5, color: blue2, radius: radius),

      ScatterSpot(34, 24.5, color: blue2, radius: radius),
      ScatterSpot(36, 22.5, color: blue2, radius: radius),

      ScatterSpot(38, 24.5, color: blue2, radius: radius),

      /// section 3
      ScatterSpot(10, 25, color: blue2, radius: radius),
      ScatterSpot(12, 23, color: blue2, radius: radius),
      ScatterSpot(14, 21, color: blue2, radius: radius),

      ScatterSpot(12, 27, color: blue2, radius: radius),
      ScatterSpot(14, 25, color: blue2, radius: radius),
      ScatterSpot(16, 23, color: blue2, radius: radius),

      ScatterSpot(14, 29, color: blue2, radius: radius),
      ScatterSpot(16, 27, color: blue2, radius: radius),
      ScatterSpot(18, 25, color: blue2, radius: radius),

      ScatterSpot(16, 31, color: blue2, radius: radius),
      ScatterSpot(18, 29, color: blue2, radius: radius),
      ScatterSpot(20, 27, color: blue2, radius: radius),

      ScatterSpot(18, 33, color: blue2, radius: radius),
      ScatterSpot(20, 31, color: blue2, radius: radius),
      ScatterSpot(22, 29, color: blue2, radius: radius),

      ScatterSpot(20, 35, color: blue2, radius: radius),
      ScatterSpot(22, 33, color: blue2, radius: radius),
      ScatterSpot(24, 31, color: blue2, radius: radius),

      ScatterSpot(22, 37, color: blue2, radius: radius),
      ScatterSpot(24, 35, color: blue2, radius: radius),
      ScatterSpot(26, 33, color: blue2, radius: radius),

      ScatterSpot(24, 39, color: blue2, radius: radius),
      ScatterSpot(26, 37, color: blue2, radius: radius),
      ScatterSpot(28, 35, color: blue2, radius: radius),

      ScatterSpot(26, 41, color: blue2, radius: radius),
      ScatterSpot(28, 39, color: blue2, radius: radius),
      ScatterSpot(30, 37, color: blue2, radius: radius),

      ScatterSpot(28, 43, color: blue2, radius: radius),
      ScatterSpot(30, 41, color: blue2, radius: radius),
      ScatterSpot(32, 39, color: blue2, radius: radius),

      ScatterSpot(30, 45, color: blue2, radius: radius),
      ScatterSpot(32, 43, color: blue2, radius: radius),
      ScatterSpot(34, 41, color: blue2, radius: radius),

      ScatterSpot(34, 45, color: blue2, radius: radius),
      ScatterSpot(36, 43, color: blue2, radius: radius),

      ScatterSpot(38, 45, color: blue2, radius: radius),
    ];
  }

  Widget scatterComponent = ScatterChart(
    ScatterChartData(
        scatterSpots: [ScatterSpot(0, 0), ScatterSpot(1, 34)],
        minX: 0,
        maxX: 50.0,
        minY: 0,
        maxY: 50.0),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: scatterComponent,
    );
  }
}
