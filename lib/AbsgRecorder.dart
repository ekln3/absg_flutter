import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import "dart:async";
import 'dart:math';

import 'package:sensors_plus/sensors_plus.dart';

class AbsgRecorder extends StatefulWidget {
  const AbsgRecorder({Key? key}) : super(key: key);

  @override
  State<AbsgRecorder> createState() => _AbsgRecorderState();
}

class _AbsgRecorderState extends State<AbsgRecorder> {
  List<double> time = [];
  var data = [];
  var timer;

  bool _recording = false;

  void _toggleRecord() {
    if (!_recording) {
      print("start recording");
      time = [];
      data = [];
      timer = Timer.periodic(const Duration(milliseconds: 10), ((timer) {
        time.add(_clock.toDouble() / 100);
        var tmp = [_absg, _ax, _ay, _az];
        data.add(tmp);
        _clock++;
      }));
    } else {
      print("stop recording");
      timer.cancel();
    }

    _recording = !_recording;
  }

  void _outportCSV() {
    print("outputCSV");
    print(time.length);
  }

  double _g = 9.8;

  int _clock = 0;

  double _ax = 0;
  double _ay = 0;
  double _az = 0;
  double _gx = 0;
  double _gy = 0;
  double _gz = 0;
  double _absa = 0;
  double _absg = 0;

  @override
  void initState() {
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      _ax = event.x;
      _ay = event.y;
      _az = event.z;
      _gx = _ax / _g;
      _gy = _ay / _g;
      _gz = _az / _g;
      _absa = sqrt(pow(_ax, 2) + pow(_ay, 2));
      _absg = sqrt(pow(_gx, 2) + pow(_gy, 2));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(
        width: 10,
      ),
      OutlinedButton(
          onPressed: () {
            _toggleRecord();
          },
          child: const Text("Record")),
      const SizedBox(
        width: 10,
      ),
      OutlinedButton(
          onPressed: () {
            _outportCSV();
          },
          child: const Text("Output CSV"))
    ]);
  }
}
