import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chat/models/chat_model.dart';
import 'package:whatsapp_clone/chat/pages/chat_tile.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  List<User> users = [
    User(
      
      name: 'Mufeedh',
      isGroup: false,
      message: 'helloo',
      updatedAt: '10.00 am',
      image: '',
    ),
    User(
      name: 'Flutter',
      isGroup: true,
      message: 'helloo',
      updatedAt: '12.00 am',
      image:''
      ),
    User(
      name:'vinayak',
      isGroup : false,
      message : 'hii',
      updatedAt:'8.00 pm',
      image: 'https://th.bing.com/th/id/R.2f6c745e8ace54840678236e106fb142?rik=AlvCgeU0JtmL0Q&riu=http%3a%2f%2fdata1.ibtimes.co.in%2fen%2ffull%2f576119%2fnivin-pauly.jpg&ehk=eUbGUophzjvH1GTTJ3zz2rituuKkyoECfsvjTIi5chk%3d&risl=&pid=ImgRaw&r=0'
    ),
    User(
      name:'calicut peoples',
      isGroup: true,
      message: 'hooi',
      updatedAt: 'online',
      image: 'https://www.housefind.in/wp-content/uploads/2019/08/flat-for-rent-in-calicut-town.png'
    ),
    User(
      name:'indians',
      isGroup: true,
      message: 'hello all',
      updatedAt: 'online',
      image: 'https://specials-images.forbesimg.com/dam/imageserve/933059378/960x0.jpg?fit=scale'
    ),
    User(
      name: 'favas',
      isGroup:false,
      message:'deyy',
      updatedAt: 'online',
      image: 'https://2.bp.blogspot.com/-ecuabt5iyBM/WhMs0GSaCiI/AAAAAAAAASE/OJCJhH2w9HEHKY7_UlGssFy33O5Zz1drACLcBGAs/s1600/m1.jpg'
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ChatTile(userData:users[index] ,);
      },
    ));
  }
}
