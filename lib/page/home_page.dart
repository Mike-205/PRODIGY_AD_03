import 'package:flutter/material.dart';
import 'package:prodigy_ad_03/components/app_buttons.dart';
import 'package:prodigy_ad_03/provider/my_timer.dart';
import 'package:provider/provider.dart';

import '../color/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String twoDigitMilliseconds =
    twoDigits(duration.inMilliseconds.remainder(1000) ~/ 10);
    return "$twoDigitMinutes:$twoDigitSeconds.$twoDigitMilliseconds";
  }

  Duration calculateLapTime(List<Duration> laps, int index) {
    if (index == 0) {
      return laps[0];
    } else {
      return laps[index] - laps[index - 1];
    }
  }

  void lapButtonHandler() {
    final stopwatchProvider = Provider.of<StopWatchProvider>(context, listen: false);
    if (stopwatchProvider.currentState == StopwatchState.initial) {
      stopwatchProvider.lap();
    } else if (stopwatchProvider.currentState == StopwatchState.running) {
      stopwatchProvider.lap();
    } else if (stopwatchProvider.currentState == StopwatchState.paused) {
      stopwatchProvider.reset();
    }
  }

  void startStopHandler() {
    final stopwatchProvider = Provider.of<StopWatchProvider>(context, listen: false);
    if (stopwatchProvider.currentState == StopwatchState.initial) {
      stopwatchProvider.start();
    } else if (stopwatchProvider.currentState == StopwatchState.running) {
      stopwatchProvider.stop();
    } else if (stopwatchProvider.currentState == StopwatchState.paused) {
      stopwatchProvider.resume();
    }
  }

  @override
  Widget build(BuildContext context) {
    final stopwatchProvider = Provider.of<StopWatchProvider>(context);
    List<Duration> laps = stopwatchProvider.laps;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        final double scaleFactor = constraints.maxWidth / 400;
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.black.withOpacity(.2),
            elevation: 3,
            toolbarHeight: 80*scaleFactor,
            title: const Text('Stopwatch', style: TextStyle(fontSize: 25, color: Colors.blueAccent)),
            titleSpacing: 20,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50* scaleFactor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          stopwatchProvider.formattedTime,
                          style: TextStyle(
                            color: Colors.brown.shade500,
                            fontSize: 40
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50*scaleFactor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 350 * scaleFactor, // Set your maximum height here
                        child: SingleChildScrollView(
                          child: DataTable(
                            headingTextStyle: TextStyle(color: AppColors.displayColor),
                            columns: const [
                              DataColumn(label: Text('Laps')),
                              DataColumn(label: Text('Lap Time')),
                              DataColumn(label: Text('Overall time')),
                            ],
                            rows: List<DataRow>.generate(
                              laps.length,
                                  (index) => DataRow(
                                cells: [
                                  DataCell(Text('${index + 1}', style: TextStyle(color: Colors.pinkAccent.withOpacity(.8)),)),
                                  DataCell(Text(formatDuration(calculateLapTime(laps, index)), style: TextStyle(color: Colors.blue.withOpacity(.3)))),
                                  DataCell(Text(formatDuration(laps[index]), style: TextStyle(color: AppColors.buttonColor1.withOpacity(.3)),)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60* scaleFactor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(text: stopwatchProvider.lapButtonText, onTap: lapButtonHandler, scaleFactor: scaleFactor),
                        SizedBox(width: 50* scaleFactor),
                        AppButton(text: stopwatchProvider.startButtonText, onTap: startStopHandler, scaleFactor: scaleFactor),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
