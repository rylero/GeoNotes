import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:geonotes/routes.dart';
import 'package:geonotes/services/firestore.dart';
import 'package:geonotes/services/models.dart';
import 'package:geonotes/theme.dart';
import 'package:provider/provider.dart';
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
    return StreamProvider(
      create: (_) => FirestoreService().streamNotes(),
      initialData: [Note()],
      child: MaterialApp(
        routes: appRoutes,
        theme: appTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
