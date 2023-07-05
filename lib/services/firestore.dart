import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:geonotes/services/auth.dart';
import 'package:geonotes/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Note>> streamNotes() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        print(user.uid);
        var notesRef = _db.collection("notes");
        var query = notesRef.where("user", isEqualTo: user.uid);
        return Stream.fromFuture(query.get().then((querySnapshot) {
          List<Note> notes = List.empty(growable: true);
          for (var docSnapshot in querySnapshot.docs) {
            notes.add(Note.fromJson(docSnapshot.data()));
          }
          return notes;
        }));
      } else {
        print("No user");
        return Stream.fromIterable([
          [Note()]
        ]);
      }
    });
  }
}

Future<DocumentReference> addMessageToGuestBook(String message) {
  // if (!_loggedIn) {
  //   throw Exception('Must be logged in');
  // }

  return FirebaseFirestore.instance.collection('notes').add(<String, dynamic>{
    'text': message,
    'timestamp': DateTime.now().millisecondsSinceEpoch,
    'name': FirebaseAuth.instance.currentUser!.displayName,
    'userId': FirebaseAuth.instance.currentUser!.uid,
  });
}
