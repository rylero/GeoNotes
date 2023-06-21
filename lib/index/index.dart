import 'package:flutter/material.dart';
import 'package:geonotes/login/login.dart';
import 'package:geonotes/map/map.dart';
import 'package:geonotes/services/auth.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading');
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('error'),
          );
        } else if (snapshot.hasData) {
          return const MapScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
