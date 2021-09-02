import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);
   Color bgColor = data['isDayTime'] ? Colors.blue.shade400 : Colors.blue.shade900;
    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0,120,0,0),
          child: Column(
            children: [
              // ignore: deprecated_member_use
              FlatButton.icon(
                  onPressed: (){},
                  icon: Icon(Icons.edit_location,color: Colors.grey.shade100,),
                  label: Text("Edit Location",style: TextStyle(color: Colors.white60),),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data['time'],style: TextStyle(color: Colors.white,fontSize: 48,fontWeight: FontWeight.bold),),


                ],

              ),
              SizedBox(height: 30,),
              Text("Location",style: TextStyle(color: Colors.white,fontSize: 23)),
            ],
          ),
        )
      )
    );
  }
}
