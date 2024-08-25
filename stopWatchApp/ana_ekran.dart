import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/stopWatchApp/theme.dart';
import 'laps_widget.dart';

class StopWatchApp extends StatefulWidget {
  const StopWatchApp({Key? key}) : super(key: key);

  @override
  State<StopWatchApp> createState() => _StopWatchAppState();
}

class _StopWatchAppState extends State<StopWatchApp> {
  String _digitSecons = "00";
  String _digitMinutes = "00";
  String _digitHours = "00";

  int _seconds = 0, _minutes = 0, _hours = 0;
  Timer? _timer;
  bool _started = false;
  List laps = [];

  void _stop() {
    _timer!.cancel();
    setState(() {
      _started = false;
    });
  }

  void _resetValue() {
    _timer!.cancel();
    setState(() {
      _seconds = 0;
      _minutes = 0;
      _hours = 0;

      _digitHours = "00";
      _digitMinutes = "00";
      _digitSecons = "00";
      _started = false;
    });
  }

  void _addLaps() {
    String lap = "$_digitHours:$_digitMinutes:$_digitSecons";
    laps.add(lap);
  }

  void _stateManager(int localSeconds, int localMinutes, int localHours) {
    if (localSeconds > 59) {
      if (localMinutes > 59) {
        localHours++;
        localMinutes = 0;
      } else {
        localMinutes++;
        localSeconds = 0;
      }
    }
  }

  void _start() {
    _started = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = _seconds + 1;
      int localMinutes = _minutes;
      int localHours = _hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }

      setState(() {
        _seconds = localSeconds;
        _minutes = localMinutes;
        _hours = localHours;

        _digitSecons = (_seconds >= 10) ? "$_seconds" : "0$_seconds";
        _digitMinutes = (_minutes >= 10) ? "$_minutes" : "0$_minutes";
        _digitHours = (_hours >= 10) ? "$_hours" : "0$_hours";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ProjectStrings()._title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _centerWidget(),
          Padding(
              padding: const EdgeInsets.all(20),
              child: LapsWidget(widgetList: laps)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 15),
                  child: _leftButton(),
                ),
              ),
              Expanded(
                  child: IconButton(
                      onPressed: () {
                        _addLaps();
                      },
                      icon: Icon(Icons.flag))),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, bottom: 15),
                  child: _rightButton(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  RawMaterialButton _rightButton() {
    return RawMaterialButton(
      onPressed: () {
        _resetValue();
        laps.clear();
      },
      fillColor: ProjectColor().backroundColor,
      shape: StadiumBorder(),
      child: Text(
        ProjectStrings()._reset,
        style: TextStyle(
            color: ProjectColor().textColor, fontStyle: FontStyle.italic),
      ),
    );
  }

  Center _centerWidget() {
    return Center(
      child: Text(
        "$_digitHours:$_digitMinutes:$_digitSecons",
        style: TextStyle(color: ProjectColor().textColor, fontSize: 82),
      ),
    );
  }

  RawMaterialButton _leftButton() {
    return RawMaterialButton(
        onPressed: () {
          (!_started) ? _start() : _stop();
        },
        fillColor: ProjectColor().backroundColor,
        shape: StadiumBorder(),
        child: Text(
          (!_started) ? ProjectStrings()._start : ProjectStrings()._pause,
          style: TextStyle(
              color: ProjectColor().textColor, fontStyle: FontStyle.italic),
        ));
  }
}

class ProjectStrings {
  final String _title = 'StopWatch App';
  final String _reset = 'Reset';
  final String _start = 'Start';
  final String _stop = 'Stop';
  final String _pause = 'Pause';
}
