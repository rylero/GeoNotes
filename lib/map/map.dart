import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geonotes/shared/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

import '../services/models.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  Set<Marker> markers = Set();

  void setLocationToGeoLocation() async {}

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    print(position.latitude);
    print(position.longitude);
    mapController.moveCamera(
        CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)));
  }

  @override
  Widget build(BuildContext context) {
    List<Note> notes = Provider.of<List<Note>>(context);

    markers.addAll(notes.map((e) => Marker(
          markerId: MarkerId(
              LatLng(e.location.latitude, e.location.longitude).toString()),
          position: LatLng(e.location.latitude, e.location.longitude),
          infoWindow: InfoWindow(
            title: e.title,
            snippet: e.description,
          ),
          icon: BitmapDescriptor.defaultMarker,
        )));

    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.221340, -121.979637),
          zoom: 14.0,
          tilt: 75.0,
        ),
        zoomGesturesEnabled: true,
        mapType: MapType.normal,
        markers: markers,
      ),
      bottomNavigationBar: const BottomNavBar(
        itemIndex: 0,
      ),
    );
  }
}
