import 'package:flutter/material.dart';
import 'package:geonotes/shared/bottom_nav_bar.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Map"),
      ),
      bottomNavigationBar: BottomNavBar(
        itemIndex: 0,
      ),
    );
  }
}
