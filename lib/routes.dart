import 'package:flutter/material.dart';
import 'package:geonotes/index/index.dart';
import 'package:geonotes/login/login.dart';
import 'package:geonotes/map/map.dart';

var appRoutes = <String, WidgetBuilder>{
  '/': (context) => const IndexScreen(),
  '/login': (context) => const LoginScreen(),
  '/map': (context) => const MapScreen(),
};
