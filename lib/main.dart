import 'package:flutter/material.dart';
import 'package:yum_time_tracking/Setup/signIn.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //text in title bar
      title: 'Yum Timetracking',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      //will load the LoginPage as the default screen on launch
      home: LoginPage(),
    );
  }
}

