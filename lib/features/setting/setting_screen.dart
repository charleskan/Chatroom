import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pma001/features/auth/blocs/auth_bloc.dart';
import 'package:pma001/features/auth/blocs/auth_state.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return ListView(padding: const EdgeInsets.all(8), children: [
            ListTile(
              title: Text(state.user?.name ?? ""),
              subtitle: const Text("Phone"),
              leading: const Icon(
                Icons.person,
                size: 50,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.person),
                  SizedBox(width: 10),
                  Text("Account"),
                ],
              ),
              minLeadingWidth: 0,
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.chat),
                  SizedBox(width: 10),
                  Text("Chats"),
                ],
              ),
              minLeadingWidth: 0,
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.notifications),
                  SizedBox(width: 10),
                  Text("Notifications"),
                ],
              ),
              minLeadingWidth: 0,
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(
                    Icons.storage,
                  ),
                  SizedBox(width: 10),
                  Text("Data and Storage Usage"),
                ],
              ),
              minLeadingWidth: 0,
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.help),
                  SizedBox(width: 10),
                  Text("Help"),
                ],
              ),
              minLeadingWidth: 0,
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.info),
                  SizedBox(width: 10),
                  Text("About"),
                ],
              ),
              minLeadingWidth: 0,
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.logout),
                  SizedBox(width: 10),
                  Text("Log Out"),
                ],
              ),
              minLeadingWidth: 0,
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: () {
                context.read<AuthBloc>().logout();
              },
            ),
          ]);
        },
      ),
    );
  }
}
