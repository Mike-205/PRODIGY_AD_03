import 'package:flutter/material.dart';
import 'package:prodigy_ad_03/page/home_page.dart';
import 'package:prodigy_ad_03/provider/my_timer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
