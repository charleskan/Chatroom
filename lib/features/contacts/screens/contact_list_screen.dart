import 'package:flutter/material.dart';
import 'package:pma001/features/chatroom/widgets/chatroom_screen.dart';

class ContactListScreen extends StatelessWidget{
  const ContactListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          for (var i = 0; i < 20; i++)
            ListTile(
              title: Text('Contact $i'),
              subtitle: const Text('This is a contact'),
              leading: const Icon(Icons.person),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, "chat" );
              },
            ),
        ]
      )
      
    );
  }
  
}