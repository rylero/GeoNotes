import 'package:flutter/material.dart';
import 'package:geonotes/shared/bottom_nav_bar.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Notes"),
      ),
      bottomNavigationBar: BottomNavBar(
        itemIndex: 1,
      ),
    );
  }
}
