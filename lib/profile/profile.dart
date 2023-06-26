import 'package:flutter/material.dart';
import 'package:geonotes/services/auth.dart';
import 'package:geonotes/shared/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("In Profile build");
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            children: [
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
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        itemIndex: 3,
      ),
    );
  }
}
