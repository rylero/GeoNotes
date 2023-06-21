import 'package:flutter/material.dart';
import 'package:geonotes/shared/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Profile"),
      ),
      bottomNavigationBar: BottomNavBar(
        itemIndex: 3,
      ),
    );
  }
}
