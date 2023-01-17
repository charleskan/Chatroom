import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pma001/features/auth/blocs/auth_bloc.dart';
import 'package:pma001/features/auth/screen/splash_screen.dart';
import 'package:pma001/features/auth/widgets/register_screen.dart';
import 'package:pma001/features/contacts/screens/contact_list_screen.dart';
import 'package:pma001/features/setting/setting_screen.dart';

import 'features/chatroom/widgets/chatroom_screen.dart';

void main() {
  //if ....

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => _authBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case "chat":
              return MaterialPageRoute(
                  settings: settings,
                  builder: (context) {
                    return ChatRoomScreen(
                      title: settings.arguments as String,
                    );
                  });
            case "register":
              return MaterialPageRoute(
                  builder: (context) => const RegisterScreen());
            case "contacts":
              return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => const ContactListScreen());
            case "settings":
              return MaterialPageRoute(
                  builder: (context) => const SettingScreen());
            // default:
            //   return MaterialPageRoute(
            //       builder: (context) => const ChatRoomScreen(
            //             title: "Chatting with: ",
            //           ));
          }
        },
        home: SplashScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "settings");
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        title: Row(
          children: [
            const Icon(
              Icons.chevron_left,
              size: 30,
            ),
            Text(
              widget.title,
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, "contacts");
                  },
                  icon: const Icon(Icons.login),
                  label: const Text('Login')),
              TextButton.icon(
                  onPressed: () {
                    // Navigator.pushNamed(context, "chat",
                    //     arguments: "Contact ${Random().nextInt(100)}");
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout')),
              TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "register",
                    );
                  },
                  icon: const Icon(Icons.app_registration),
                  label: const Text('Register')),
            ],
          ),
        ),
      ),
    );
  }
}
