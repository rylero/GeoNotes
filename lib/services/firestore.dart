import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:geonotes/services/auth.dart';
import 'package:geonotes/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Note>> streamNotes() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var notesRef = _db.collection("notes");
        var query = notesRef.where("user", isEqualTo: user.uid);
        return Stream.fromFuture(query.get().then((querySnapshot) {
          List<Note> notes = List.empty();
          for (var docSnapshot in querySnapshot.docs) {
            notes.add(Note.fromJson(docSnapshot.data()));
          }
          return notes;
        }));
      } else {
        return Stream.fromIterable([
          [Note()]
        ]);
      }
    });
  }
}
