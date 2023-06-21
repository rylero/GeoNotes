import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:geonotes/routes.dart';
import 'package:geonotes/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: appRoutes,
      theme: appTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
