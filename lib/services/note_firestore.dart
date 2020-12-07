import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/notebook.dart';

class NoteFirestore {
  final User user;
  final Notebook notebook;

  NoteFirestore(this.notebook) : user = FirebaseAuth.instance.currentUser;

  CollectionReference get noteCollection => FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('notebooks')
      .doc(notebook.id)
      .collection('notes');

  /// Notes ///
  createNote(Note note) async => await noteCollection.add({
        'title': note.title,
        'note': note.note,
      });

  updateNote(Note note) async => await noteCollection.doc(note.id).set({
        'title': note.title,
        'note': note.note,
      });

  deleteNote(Note note) async => await noteCollection.doc(note.id).delete();

  /// Stream ///
  Stream<Note> streamNote(String noteId) =>
      noteCollection.doc(noteId).snapshots().transform(
        StreamTransformer.fromHandlers(handleData: (data, sink) {
          if (data != null) {
            sink.add(Note(
              notebookId: notebook.id,
              id: data.id,
              title: data.data()['title'],
              note: data.data()['note'],
            ));
          }
        }),
      );

  Stream<List<Note>> streamNotes() => noteCollection.snapshots().transform(
        StreamTransformer.fromHandlers(handleData: (data, sink) {
          List<Note> notes = [];

          if (data != null) {
            data.docs.forEach(
              (doc) => notes.add(
                Note(
                  notebookId: notebook.id,
                  id: doc.id,
                  title: doc.data()['title'],
                  note: doc.data()['note'],
                ),
              ),
            );
          }

          sink.add(notes);
        }),
      );
}
