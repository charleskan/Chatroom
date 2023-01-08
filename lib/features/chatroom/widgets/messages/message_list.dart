import 'package:flutter/material.dart';
import 'package:pma001/features/chatroom/models/message.dart';
import 'package:pma001/features/chatroom/widgets/messages/messages_bubble.dart';


class MessageList extends StatelessWidget {
  const MessageList({
    Key? key,
    required messages,
  })  : _messages = messages,
        super(key: key);

  final List<Message> _messages;

  @override
  Widget build(BuildContext context) {
    return ListView(
        reverse: true,
        children: _messages.reversed.map((message) {
          return MessageBubble(
            isOutbound: message.authorId == 'me',
            message: message.content,
          );
        }).toList());
  }
}
