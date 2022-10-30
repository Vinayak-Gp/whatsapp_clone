import 'package:flutter/material.dart';
import 'package:whatsapp_clone/calls/calltile.dart';
import 'package:whatsapp_clone/calls/models/call_model.dart';

class CallScreen extends StatelessWidget {
   CallScreen({super.key});

  List<CallModel> callList=[
    CallModel(name: 'vinayak',
    isvideocall: true,
    missedCall: false,
    updatedAt: '8:00 AM',
    image: 'https://th.bing.com/th/id/OIP.K3DHoCNkjizU7j_4doHmRQHaFj?w=233&h=180&c=7&r=0&o=5&pid=1.7',
    ),
    CallModel(
      name: 'favas',
      isvideocall: false,
      missedCall: true,
      updatedAt:'10:00 AM',
      image: 'https://th.bing.com/th/id/OIP.HoC30pkhHIa0EfXDntK-WwHaI5?pid=ImgDet&w=185&h=222&c=7'
    ),
    CallModel(
      name: 'arjun',
      isvideocall: true,
      missedCall: false,
      updatedAt: '1:00 AM',
      image: 'https://timesofindia.indiatimes.com/thumb/msid-68863059,width-800,height-600,resizemode-4/68863059.jpg',
    ),
    CallModel(
      name: 'swalih',
      isvideocall: true,
      missedCall: false,
      updatedAt: '12:00 AM',
      image: 'https://todaybirthday.in/wp-content/uploads/2019/06/Mohanlal-7infi.jpg',
    ),
    CallModel(
      name:'hanan',
      isvideocall: true,
      missedCall: false,
      updatedAt: '4:00 AM',
      image: 'https://i0.wp.com/instyle.mx/wp-content/uploads/2020/08/will-smith.jpg?fit=1024%2C1024&ssl=1',


    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount:callList.length,
        itemBuilder: (BuildContext context, int index) {
          return CallTile(UserData:callList[index]);

 },
            
          )
       
      );
  
  }
}

