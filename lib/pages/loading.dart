import 'package:clock_time/services/world_time.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupWorldTime() async{
    WorldTime instances = WorldTime('Kolkata','india.png','Asia/Kolkata');
    await  instances.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instances.location,
      'flag':instances.flag,
      'time':instances.time,
      'isDayTime':instances.isDayTime,
    });
  }
  @override
  void initState() {

    super.initState();
    setupWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Center(
        child:  SpinKitCircle
          (
          color: Colors.white,
          size: 50.0,
        ),
      ),

    );
  }
}
