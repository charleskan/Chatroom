import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pma001/features/chatroom/models/message.dart';
import 'package:pma001/features/chatroom/widgets/chatroom_input.dart';

import '../../chatroom/widgets/messages/message_list.dart';
import 'chatroom_app_bar.dart';

class ChatRoomScreen extends StatefulWidget {
  final String title;
  const ChatRoomScreen({super.key, required this.title});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final String title = "Chatting with: ";

  @override
  void initState() {
    super.initState();
    print("State: initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatroomAppBar(title: title),
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: MessageList(
                  messages: messages,
                ),
              ),
            ),
            ChatroomInput(onMessageSent: (message) {
              final newMessage = Message(
                id: Random().nextInt(100).toString(),
                content: message,
                authorId: "me",
                type: "text",
              );
              setState(() {
                messages.add(newMessage);
              });
            }),
          ],
        ),
      ),
    );
  }
}
