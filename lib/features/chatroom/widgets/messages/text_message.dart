import 'package:flutter/material.dart';
import 'package:pma001/features/chatroom/models/message.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
    required this.color,
  }) : super(key: key);

  final String message;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style:  TextStyle(
          color: color),
    );
  }
}