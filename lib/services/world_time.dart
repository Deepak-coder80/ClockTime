import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location for the ui
  String time=''; //time
  String flag;
  String url;
  bool isDayTime = true;

  WorldTime(this.location, this.flag, this.url);

  Future<void> getTime() async{
    try{
      //make the request
      Response response = await get(Uri.parse('http://www.worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get the propeties form the data
      String dateTime = data['dateTime'];
      String offset = data['utc_offset'].substract(1,3);
      String offSet2 = data['utc_offset'].substring(4,6);

      DateTime now = DateTime.parse(dateTime);
      //caculate the crt time
      now= now.add(Duration(hours: int.parse(offset),minutes: int.parse(offSet2)));

      //check whether its day time or not
      isDayTime = (now.hour >6 && now.hour<18)?true:false;


      //format the time
      time = DateFormat.jm().format(now);
      

    }catch(e){
      time = 'Cant fetch the time';
      print(e);
    }
  }
}
