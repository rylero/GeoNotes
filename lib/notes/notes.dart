import 'package:flutter/material.dart';
import 'package:geonotes/shared/bottom_nav_bar.dart';

class NotesScreen extends StatefulWidget {
  State createState() => NotesScreenState();
}

class NotesScreenState extends State<NotesScreen> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    final title = 'Nearby GeoNotes';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
      ),
      // Create a ListView
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            // Specify the direction to swipe and delete
            direction: DismissDirection.endToStart,
            key: Key(item),
            onDismissed: (direction) {
              // Removes that item the list on swipwe
              setState(() {
                items.removeAt(index);
              });
              // Shows the information on Snackbar
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("$item dismissed")));
            },
            background: Container(color: Colors.red),
            child: ListTile(title: Text('$item')),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        itemIndex: 1,
      ),
    );
  }
}
