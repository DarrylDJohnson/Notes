import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:notes/models/note.dart';

class NoteRepository {
  final User user;

  NoteRepository(User user)
      : this.user = user ?? FirebaseAuth.instance.currentUser,
        super();

  DatabaseReference get notesReference =>
      FirebaseDatabase.instance.reference().child(user.uid).child('notes');

  pushNote(Note note) {
    note.id ??= notesReference.push().key;

    notesReference.child(note.id).set(note.toJson());
  }

  deleteNote(Note note) => notesReference.child(note.id).remove();
}
