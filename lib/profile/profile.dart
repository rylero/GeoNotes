import 'package:flutter/material.dart';
import 'package:geonotes/services/auth.dart';
import 'package:geonotes/shared/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final title = "User Profile";
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
      ),
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MaterialButton(
                onPressed: () {
                  AuthService().signOut();
                  Navigator.pushNamed(context, "/login");
                },
                color: Colors.blue,
                child: const Text('Sign Out',
                    style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
