
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/calls/models/call_model.dart';

class CallTile extends StatelessWidget {
   CallTile({ Key? key,required this.UserData}):super(key: key);
   
  CallModel UserData;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading:  CircleAvatar(
       backgroundImage: NetworkImage(UserData.image.toString()),
      ),
      title: Text(UserData.name!),
      subtitle: Text(UserData.updatedAt!),
      trailing: Icon(Icons.video_call),
      
    );
  }
}