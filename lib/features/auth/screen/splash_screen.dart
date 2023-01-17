import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pma001/features/auth/blocs/auth_bloc.dart';
import 'package:pma001/features/auth/blocs/auth_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({this.from, Key? key}) : super(key: key);
  final String? from;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Forget about this AnimationController first
    // We will get back to it in Chapter 13
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.3,
      duration: const Duration(milliseconds: 500),
    );

    _controller.repeat(reverse: true);

    // context.read<AuthBloc>().stream.listen((state) {
    //   if (state.user == null) {
    //     return;
    //   }

    //   if (state.user != null) {
    //     Navigator.of(context).pushNamed('contacts');
    //   } else {
    //     Navigator.of(context).pushNamed('register');
    //   }
    // });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AuthBloc>().retrieveLoginState();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.user == null) {
          return;
        }

        if (state.user != null) {
          Navigator.of(context).pushNamed('contacts');
        } else {
          Navigator.of(context).pushNamed('register');
        }
      },
      child: Scaffold(
          body: Center(
              child: FadeTransition(
        opacity: _controller,
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: max(MediaQuery.of(context).size.width * 0.8, 250)),
          child: Image.asset(
            // Use an asset image as splash screen
            'images/logo.jpeg',
            fit: BoxFit.contain,
          ),
        ),
      ))),
    );
  }
}
