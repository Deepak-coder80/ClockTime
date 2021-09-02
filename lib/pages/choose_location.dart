import 'package:clock_time/services/world_time.dart';
import 'package:flutter/material.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime('Athens', 'greece.png','Europe/Berlin'),
    WorldTime('Cairo',  'egypt.png','Africa/Cairo'),
    WorldTime('Catamarca','argentina.png','America/Catamarca'),
    WorldTime('Chicago',  'usa.png','America/Chicago'),
    WorldTime('Dhaka','bd.png','Asia/Dhaka'),
    WorldTime('Eucla','au.png','Astralia/Eucla'),
    WorldTime('Jakarta', 'indonesia.png','Asia/Jakarta'),
    WorldTime('London', 'uk.png','Europe/London'),
    WorldTime('Kolkata','india.png','Asia/Kolkata'),
    WorldTime('Manaus','br.png','America/Manaus'),
    WorldTime( 'Nairobi', 'kenya.png','Africa/Nairobi'),
    WorldTime('New York',  'usa.png','America/New_York'),
    WorldTime('Santiago','cl.png','America/Santiago'),
    WorldTime('Shangai','cn.png','Asia/Shanghai'),
    WorldTime('Seoul',  'south_korea.png','Asia/Seoul'),



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
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Colors.grey.shade200 ,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Choose the Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}
