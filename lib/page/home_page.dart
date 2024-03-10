import 'package:flutter/material.dart';
import 'package:prodigy_ad_03/components/app_buttons.dart';

import '../color/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isRunning = false;
  bool stopClicked = false;

  void startClicked (){
    setState(() {
      isRunning = !isRunning;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.blue,
        backgroundColor: Colors.black12,
        elevation: 3,
        toolbarHeight: 80,
        title: const Text('Stopwatch', style: TextStyle(fontSize: 25, color: Colors.blueAccent)),
        titleSpacing: 20,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '00:00.00',
                      style: TextStyle(
                        color: Colors.brown.shade500,
                        fontSize: 40
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(text: "Lap", onPressed: () => (){}),
                  const SizedBox(width: 50),
                  AppButton(text: isRunning? "Stop" : "Start", onPressed: startClicked)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
