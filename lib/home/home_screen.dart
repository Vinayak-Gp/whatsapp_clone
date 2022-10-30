import 'package:flutter/material.dart';
import 'package:whatsapp_clone/camera/camera_screen.dart';
import 'package:whatsapp_clone/chat/chat_screen.dart';

import '../calls/call_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title:const Text('Whatsapp'),
          actions: [
           const Icon(Icons.search),
            PopupMenuButton(itemBuilder: (context) {
              return const [
                PopupMenuItem(child: Text('new group')),
                PopupMenuItem(child:Text('new broadcast')),
                PopupMenuItem(child: Text('linked devices')),
                PopupMenuItem(child: Text('starred messages')),
                PopupMenuItem(child: Text('payments')),
                PopupMenuItem(child: Text('settings'))
              ];
            },)
            
          ],
          bottom: TabBar(tabs: [
            Icon(Icons.camera_alt),
            Text('CHATS'),
            Text('STATUS'),
            Text('CALLS')
          ]),
        ),
        body: TabBarView(children:
      [
          CameraScreen(),
          ChatScreen(),
          Text('status page'),
          CallScreen(),
          
      ]
         ),
      ),
    );
  }
}