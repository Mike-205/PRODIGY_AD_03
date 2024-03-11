import 'dart:async';

import 'package:flutter/cupertino.dart';

class StopWatchProvider with ChangeNotifier{
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  Duration _elapsedTime = Duration.zero;
  final List<Duration> _laps = [];

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
    final milliseconds = ((_elapsedTime.inMilliseconds % 1000) / 100).floor().toString().padLeft(1, '0');
    return '$hours:$minutes:$seconds.$milliseconds';
  }

  void start (){
    _stopwatch.start();
    notifyListeners();
  }

  void stop (){
    _stopwatch.stop();
    notifyListeners();
  }

  void resume (){
    _stopwatch.start();
    notifyListeners();
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
    _elapsedTime = Duration.zero;
    notifyListeners();
  }
}