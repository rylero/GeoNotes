import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  final int itemIndex;

  const BottomNavBar({super.key, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: itemIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.mapLocationDot,
            size: 20,
          ),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.noteSticky,
            size: 20,
          ),
          label: 'Notes',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.circlePlus,
            size: 20,
          ),
          label: 'Create',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.circleUser,
            size: 20,
          ),
          label: 'Profile',
        ),
      ],
      fixedColor: Colors.blue[500],
      onTap: (int idx) {
        switch (idx) {
          case 0:
            Navigator.pushNamed(context, '/map');
            break;
          case 1:
            Navigator.pushNamed(context, '/notes');
            break;
          case 2:
            Navigator.pushNamed(context, '/create');
            break;
          case 3:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
    );
  }
}
