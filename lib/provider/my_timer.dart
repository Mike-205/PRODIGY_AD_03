import 'dart:async';

import 'package:flutter/cupertino.dart';

enum StopwatchState {
  initial,
  running,
  paused,
}

class StopWatchProvider with ChangeNotifier{
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  Duration _elapsedTime = Duration.zero;
  final List<Duration> _laps = [];
  StopwatchState _currentState = StopwatchState.initial;

  StopwatchState get currentState => _currentState;

  String get startButtonText {
    switch (_currentState) {
      case StopwatchState.initial:
        return 'Start';
      case StopwatchState.running:
        return 'Stop';
      case StopwatchState.paused:
        return 'Resume';
    }
  }

  String get lapButtonText {
    switch (_currentState) {
      case StopwatchState.initial:
        return 'Lap';
      case StopwatchState.paused:
        return 'Reset';
      case StopwatchState.running:
        return 'Lap';
    }
  }

  StopWatchProvider() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);
  }

  void _onTick (Timer timer) {
    if (_stopwatch.isRunning) {
      _elapsedTime = _stopwatch.elapsed;
      notifyListeners();
    }
  }

  String get formattedTime {
    final hours = _elapsedTime.inHours.toString().padLeft(2, '0');
    final minutes = (_elapsedTime.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (_elapsedTime.inSeconds % 60).toString().padLeft(2, '0');
    final milliseconds = ((_elapsedTime.inMilliseconds % 1000) / 10).floor().toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds.$milliseconds';
  }

  void start (){
    if (_currentState == StopwatchState.initial || _currentState == StopwatchState.paused) {
      _stopwatch.start();
      _currentState = StopwatchState.running;
      notifyListeners();
    }
  }

  void stop (){
    if (_currentState == StopwatchState.running) {
      _stopwatch.stop();
      _currentState = StopwatchState.paused;
      notifyListeners();
    }
  }

  void resume (){
    if (_currentState == StopwatchState.paused) {
      _stopwatch.start();
      _currentState = StopwatchState.running;
      notifyListeners();
    }
  }

  List<Duration> get laps => _laps;

  void lap (){
    if (_stopwatch.isRunning) {
      _laps.add(_elapsedTime);
      notifyListeners();
    }
  }

  void reset (){
    _stopwatch.reset();
    _currentState = StopwatchState.initial;
    _elapsedTime = Duration.zero;
    _laps.clear();
    notifyListeners();
  }
}