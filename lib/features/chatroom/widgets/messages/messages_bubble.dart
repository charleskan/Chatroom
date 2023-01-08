import 'package:flutter/material.dart';
import 'package:pma001/features/chatroom/models/message.dart';
import 'package:pma001/features/chatroom/widgets/messages/date_message.dart';
import 'package:pma001/features/chatroom/widgets/messages/text_message.dart';


class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    required this.isOutbound,
    required this.message,
  }) : super(key: key);

  final bool isOutbound;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isOutbound ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: isOutbound ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isOutbound ? 8 : 0),
                topRight: const Radius.circular(8),
                bottomLeft: const Radius.circular(8),
                bottomRight: Radius.circular(isOutbound ? 0 : 8),
              ),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextMessage(
                  message: message,
                  color: isOutbound ? Colors.white : Colors.black),
              const SizedBox(height: 8),
              DateMessage(
                text: 'Read 12:00',
                color: isOutbound ? Colors.white : Colors.black,),
            ],
          ),
        ),
      ),
    );
  }
}

