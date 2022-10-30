import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chat/models/chat_model.dart';

class ChatDetailed extends StatefulWidget {
  ChatDetailed({super.key, required this.user_details});

  User user_details;

  @override
  State<ChatDetailed> createState() => _ChatDetailedState();
}

class _ChatDetailedState extends State<ChatDetailed> {
  bool showSend = true;
  bool showEmoji = false;
  final TextEditingController _messageController = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Row(
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back)),
            const CircleAvatar(),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(widget.user_details.name!), const Text('Online')],
        ),
        actions: [
          const Icon(Icons.call),
          const SizedBox(width: 20),
          const Icon(Icons.video_call),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text('view contact')),
                const PopupMenuItem(child: Text('Media Links and Docs')),
                const PopupMenuItem(child: Text('search')),
                const PopupMenuItem(child: Text('mute notification')),
                const PopupMenuItem(child: Text('Disappearing messages')),
                const PopupMenuItem(child: Text('Wallpaper')),
                const PopupMenuItem(child: const Text('more'))
              ];
            },
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/whatsapp_background.jpg',
              width: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return const Text('');
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                              focusNode: focusNode,
                              onTap: () {
                                setState(() {
                                  showEmoji = false;
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: 'message',
                                  prefixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showEmoji = !showEmoji;

                                          showEmoji?FocusManager.instance.primaryFocus
                                              ?.unfocus():focusNode.
                                              requestFocus();
                                          
                                        });
                                      },
                                      icon: Icon(showEmoji
                                          ? Icons.keyboard
                                          : Icons.emoji_emotions_outlined)),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (context) => menu(),
                                            );
                                          },
                                          icon: const Icon(Icons.attach_file)),
                                      const Icon(Icons.currency_rupee),
                                      const Icon(Icons.camera_alt),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ))),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(showSend ? Icons.send : Icons.mic),
                      ),
                    ],
                  ),
                  Offstage(
                    offstage: !showEmoji,
                    child: SizedBox(
                      height: 250,
                      child: EmojiPicker(
                        textEditingController: _messageController,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container menu() {
    return Container(
      height: 400,
      color: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(
                    icon: const Icon(Icons.insert_drive_file),
                    color: Colors.purple,
                    text: 'Document'),
                iconWidget(
                    icon: const Icon(Icons.camera_alt),
                    color: Colors.red,
                    text: 'camera'),
                iconWidget(
                    icon: const Icon(Icons.insert_photo),
                    color: Colors.pink,
                    text: 'gallery'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(
                    icon: const Icon(Icons.headset),
                    color: Colors.red,
                    text: 'audio'),
                iconWidget(
                    icon: const Icon(Icons.location_pin),
                    color: Colors.blueGrey,
                    text: 'location'),
                iconWidget(
                    icon: const Icon(Icons.contact_phone),
                    color: Colors.blue,
                    text: 'contact'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconWidget(
                      icon: const Icon(Icons.currency_rupee),
                      color: Colors.green,
                      text: 'payment')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column iconWidget({String? text, Icon? icon, Color? color}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: icon,
          radius: 30,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(text!),
      ],
    );
  }
}
