import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:notes/models/note.dart';

class NoteRepository {
  final User user;

  NoteRepository([User user])
      : this.user = user ?? FirebaseAuth.instance.currentUser,
        super();

  DatabaseReference get notesReference =>
      FirebaseDatabase.instance.reference().child(user.uid).child('notes');

  String generateNoteId() => notesReference.push().key;

  pushNote(Note note) {
    notesReference.child(note.id).set(note.toJson());
  }

  deleteNote(Note note) => notesReference.child(note.id).remove();

  Stream<List<Note>> streamNotes() async* {
    yield* notesReference.onValue.transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          if(data?.snapshot?.value != null){
            List<Note> notes = [];

            Map map = data.snapshot.value;

            map.values.forEach((element) => notes.add(Note.fromJson(element)));

            sink.add(notes);
          }
        },
      ),
    );
  }

  Stream<Note> streamNote(String id) async* {
    yield* notesReference.child(id).onValue.transform(StreamTransformer.fromHandlers(handleData: (data, sink){
      if(data?.snapshot?.value != null){
        sink.add(Note.fromJson(data.snapshot.value));
      }
    },));
  }
}
