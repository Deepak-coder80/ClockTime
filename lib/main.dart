import 'package:clock_time/pages/choose_location.dart';
import 'package:clock_time/pages/home.dart';
import 'package:clock_time/pages/location.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        //thesearetheroutes
        '/': (context) => Location(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    );
  }
}
