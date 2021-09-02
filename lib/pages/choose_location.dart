import 'package:clock_time/services/world_time.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime('London', 'uk.png','Europe/London'),
    WorldTime('Athens', 'greece.png','Europe/Berlin'),
    WorldTime( 'Cairo',  'egypt.png','Africa/Cairo'),
    WorldTime( 'Nairobi', 'kenya.png','Africa/Nairobi'),
    WorldTime(  'Chicago',  'usa.png','America/Chicago'),
    WorldTime(   'New York',  'usa.png','America/New_York'),
    WorldTime(   'Seoul',  'south_korea.png','Asia/Seoul'),
    WorldTime(  'Jakarta', 'indonesia.png','Asia/Jakarta'),
    WorldTime('Kolkata','india.png','Asia/Kolkata'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Choose Location'),
        elevation: 0,
        backgroundColor: Color(hexColor("#02304A")),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                onTap: ()=>updateTime(index),
                title: Text(locations[index].location,style: TextStyle(fontWeight: FontWeight.bold,),),
                leading: CircleAvatar(
                  backgroundImage:AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            );
          }
      ),
    );
  }

  int hexColor(String Clr){
    //add prefix
    String newColor = '0xff'+Clr;
    //removing # sign
    newColor = newColor.replaceAll("#", '');
    //converting it to integer'
    int finalColor = int.parse(newColor);

    return finalColor;
  }
}
