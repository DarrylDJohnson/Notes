import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';

@immutable
abstract class NoteState extends Equatable {
  NoteState([List props = const []]) : super(props);
}

class NoteStateLoading extends NoteState {
  @override
  String toString() => 'Loading';
}

class NoteStateEmpty extends NoteState {
  @override
  String toString() => 'Empty';
}

class NoteStateNote extends NoteState {
  final Note note;

  NoteStateNote([this.note]) : super([note]);

  @override
  String toString() => 'NoteStateNote : ${note.id}';
}

class NoteStateList extends NoteState {
  final List<Note> notes;

  NoteStateList([this.notes]) : super([notes]);

  @override
  String toString() => 'NoteStateList : ${notes.length} notes';
}

class NoteStateError extends NoteState {
  final String error;

  NoteStateError(this.error) : super([error]);

  @override
  String toString() => 'Note Error: $error';
}

class NoteStateBottomSheet extends NoteState {
  final Note note;

  NoteStateBottomSheet([this.note]) : super([note]);

  @override
  String toString() => 'NoteStateBottomSheet : ${note.id}';
}
