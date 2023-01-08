import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';

class ChatroomInput extends StatefulWidget {
  final Function onMessageSent;

  const ChatroomInput({
    Key? key,
    required this.onMessageSent,
  }) : super(key: key);

  @override
  State<ChatroomInput> createState() => _ChatroomInputState();
}

class _ChatroomInputState extends State<ChatroomInput> {
  final _formKey = GlobalKey<FormState>();

  String? _message;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: ((newValue) => _message = newValue),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                final formState = _formKey.currentState;

                if (FormState == null) {
                  return;
                }

                if (!formState!.validate()) {
                  print('Form is invalid');
                  return;
                }

                formState.save();

                if (_message != null) {
                  widget.onMessageSent(_message!);
                }

                _message = null;
                formState.reset();
              },
              child: Transform.rotate(
                angle: pi * 2.25,
                child: Icon(Icons.send),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
