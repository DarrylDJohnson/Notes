import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';

@immutable
abstract class NotesState extends Equatable {
  NotesState([List props = const []]) : super(props);
}

class NotesStateLoading extends NotesState {
  @override
  String toString() => 'NotesState: Loading';
}

class NotesStateError extends NotesState {
  final error;

  NotesStateError(this.error) : super([error]);

  @override
  String toString() => 'NotesState: Error $error';
}

class NotesStateSuccess extends NotesState {
  final List<Note> notes;

  NotesStateSuccess(this.notes) : super([notes]);

  @override
  String toString() => 'NotesState: Success ${notes.length}';
}

class NotesStateNote extends NotesState {
  final Note note;

  NotesStateNote(this.note) : super([note]);

  @override
  String toString() => 'NotesState: Note ${note.id}';
}