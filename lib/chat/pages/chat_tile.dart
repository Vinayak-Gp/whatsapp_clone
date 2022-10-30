import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chat/models/chat_model.dart';
import 'package:whatsapp_clone/chat/pages/chat_detailed_screen.dart';

class ChatTile extends StatelessWidget {
   ChatTile({
    Key? key,
    required this.userData
  }) : super(key: key);

  User userData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailed(user_details: userData,),)),

      
    leading: CircleAvatar(backgroundImage:(userData.image=='')?
     AssetImage(userData.isGroup!? 'assets/images/gruop.png':'assets/images/default.jpg')
    as ImageProvider<Object>?
    :NetworkImage(userData.image.toString())), 
    title: Text(userData.name.toString()),
    subtitle: Text(userData.message.toString()),
    trailing: Text(userData.updatedAt.toString()),
      );
  }
}