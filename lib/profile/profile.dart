import 'package:flutter/material.dart';
import 'package:geonotes/services/auth.dart';
import 'package:geonotes/shared/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileButton(),
      bottomNavigationBar: const BottomNavBar(
        itemIndex: 3,
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            onPressed: () {
              AuthService().signOut();
              Navigator.pushNamed(context, "/login");
            },
            child: const Text("Sign Out"),
          ),
        ],
      ),
    );
  }
}
