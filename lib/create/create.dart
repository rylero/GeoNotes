import 'package:flutter/material.dart';
import 'package:geonotes/shared/bottom_nav_bar.dart';
import 'package:geonotes/services/auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Need a scren that shows a text entry box and a "Submit button"
// Onsubmit will take location and create geopoint as well
// Take submitted text and push to firestore

class CreateScreen extends StatefulWidget {
  State createState() => CreateScreenState();
}

class CreateScreenState extends State<CreateScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Geoflutterfire geo = Geoflutterfire();
  final _textController = TextEditingController();

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  // Set GeoLocation Data
  void _addGeoPoint(String userNote) async {
    Position position = await _determinePosition();
    GeoFirePoint point =
        geo.point(latitude: position.latitude, longitude: position.longitude);
    firestore
        .collection('users')
        .doc(AuthService().currentUser())
        .collection('geonotes')
        .add({
      'position': point.data,
      'note': userNote,
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Create a GeoNote';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Enter your GeoNote',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                )),
            MaterialButton(
                onPressed: () => {
                      _addGeoPoint(_textController.text),
                      _textController.clear(),
                    },
                color: Colors.blue,
                child:
                    const Text('Create', style: TextStyle(color: Colors.white)))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        itemIndex: 2,
      ),
    );
  }
}
