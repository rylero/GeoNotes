import 'package:flutter/material.dart';
import 'package:geonotes/create/create.dart';
import 'package:geonotes/index/index.dart';
import 'package:geonotes/login/login.dart';
import 'package:geonotes/map/map.dart';
import 'package:geonotes/notes/notes.dart';
import 'package:geonotes/profile/profile.dart';

var appRoutes = <String, WidgetBuilder>{
  '/': (context) => const IndexScreen(),
  '/login': (context) => const LoginScreen(),
  '/map': (context) => const MapScreen(),
  '/notes': (context) => const NotesScreen(),
  '/create': (context) => CreateScreen(),
  '/profile': (context) => const ProfileScreen(),
};
