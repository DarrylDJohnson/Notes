import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/notebook.dart';

class NotebookFirestore {
  final User user;

  NotebookFirestore() : user = FirebaseAuth.instance.currentUser;

  CollectionReference get notebookCollection => FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('notebooks');

  /// Initialization ///
  initialize() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((value) {
      if (value.exists) {
        print("exists");
      } else {
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set({'name': user.displayName});
      }
    });
  }

  Color getColor() {
    List<Color> colors = [
      Colors.blueGrey.shade900,
      Colors.blueGrey.shade700,
      Colors.blueGrey.shade500,
      Colors.blueGrey.shade300
    ];
    colors.shuffle();
    return colors.toList().first;
  }

  /// Notebooks ///
  String generateNotebookId() => notebookCollection.id;

  Future<String> createNotebook(Notebook notebook) async =>
      await notebookCollection.add({
        'title': notebook.title,
        'color': Colors.blueGrey.shade900.value,
        'sortBy': notebook.sortBy,
      }).then((value) => value.id);

  updateNotebook(Notebook notebook) async =>
      await notebookCollection.doc(notebook.id).update({
        'title': notebook.title,
        'sortBy': notebook.sortBy,
      });

  deleteNotebook(Notebook notebook) async =>
      await notebookCollection.doc(notebook.id).delete();

  /// Notes ///
  Future<String> createNote(Notebook notebook, Note note) async =>
      await notebookCollection.doc(notebook.id).collection('notes').add({
        'title': note.title,
        'note': note.note,
      }).then((value) => value.id);

  updateNote(Notebook notebook, Note note) async {
    print(
        "Note: ${note.id}, ${note.title}, ${note.note}, ${note.notebookId}, ");

    await notebookCollection
        .doc(notebook.id)
        .collection('notes')
        .doc(note.id)
        .set({
      'title': note.title,
      'note': note.note,
    }).then((value) => print("done"));
  }

  deleteNote(Notebook notebook, Note note) async => await notebookCollection
      .doc(notebook.id)
      .collection('notes')
      .doc(note.id)
      .delete();

  /// Stream Notebooks ///
  Stream<Notebook> streamNotebook(String id) =>
      notebookCollection.doc(id).snapshots().transform(
        StreamTransformer.fromHandlers(handleData: (data, sink) {
          if (data != null) {
            sink.add(Notebook(
              id: data.id,
              title: data.data()['title'],
              color: Color(data.data()['color']),
              sortBy: data.data()['sortBy'],
            ));
          }
        }),
      );

  Stream<List<Notebook>> streamNotebooks() =>
      notebookCollection.snapshots().transform(
        StreamTransformer.fromHandlers(
          handleData: (data, sink) {
            List<Notebook> notebooks = [];

            if (data != null) {
              data.docs.forEach(
                (doc) => notebooks.add(Notebook(
                  id: doc.id,
                  title: doc.data()['title'],
                  color: Color(doc.data()['color']),
                  sortBy: doc.data()['sortBy'],
                )),
              );
            }
            sink.add(notebooks);
          },
        ),
      );

  /// Stream Notes ///
  Stream<Note> streamNote(notebookId, String noteId) => notebookCollection
          .doc(notebookId)
          .collection('notes')
          .doc(noteId)
          .snapshots()
          .transform(
        StreamTransformer.fromHandlers(handleData: (data, sink) {
          if (data != null) {
            sink.add(Note(
              notebookId: notebookId,
              id: data.id,
              title: data.data()['title'],
              note: data.data()['note'],
            ));
          }
        }),
      );

  Stream<List<Note>> streamNotes(String notebookId) => notebookCollection
          .doc(notebookId)
          .collection('notes')
          .snapshots()
          .transform(
        StreamTransformer.fromHandlers(handleData: (data, sink) {
          List<Note> notes = [];

          if (data != null) {
            data.docs.forEach(
              (doc) => notes.add(
                Note(
                  notebookId: notebookId,
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
