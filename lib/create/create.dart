import 'package:flutter/material.dart';
import 'package:geonotes/shared/bottom_nav_bar.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Create"),
      ),
      bottomNavigationBar: BottomNavBar(
        itemIndex: 2,
      ),
    );
  }
}
