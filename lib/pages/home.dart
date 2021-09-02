import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? (ModalRoute.of(context)?.settings.arguments as Map):data;
    //print(data);
    //set background
    String bgImag = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Color(hexColor("#3C516C")) : Color(hexColor("#02304A"));
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImag'),
                fit: BoxFit.cover,
              )),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                // ignore: deprecated_member_use
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                    await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag':result['flag'],

                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    "Edit Location",
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(height: 80.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 60.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/${data['flag']}'),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.white,

                      ),
                    ),

                  ],

                ),

              ],
            ),
          ),
        ),
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


