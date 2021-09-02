import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
  String location; //location name for ui
  String time=''; //time in location
  String flag; //url to assets flag icon
  String url; //location url for api endpoint
  bool isDayTime=true;

  WorldTime( this.location, this.flag, this.url);

  Future<void> getTime() async{

    try{
      //make request
      Response response = await get(Uri.parse('http://www.worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String dateTime = data['datetime'];
      String offSet = data['utc_offset'].substring(1,3);
      String offSet2 = data['utc_offset'].substring(4,6);
      // print(dateTime);
      //
      // print(offSet2);

      //date time object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offSet),minutes:int.parse(offSet2)));

      isDayTime = (now.hour > 6 && now.hour <18)?true:false;
      //set the time property
      time = DateFormat.jm().format(now);

    }catch (e){

      print("Caught error:$e");
      time = "could not get data";

    }


  }


}


