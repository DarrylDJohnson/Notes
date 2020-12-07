import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';

@immutable
abstract class NoteState extends Equatable {
  NoteState([List props = const []]) : super(props);
}

class NoteStateLoading extends NoteState {
  @override
  String toString() => 'NoteState: Loading';
}

class NoteStateError extends NoteState {
  final error;

  NoteStateError(this.error) : super([error]);

  @override
  String toString() => 'NoteState: Error $error';
}

class NoteStateSuccess extends NoteState {
  final Note note;

  NoteStateSuccess(this.note) : super([note]);

  @override
  String toString() => 'NoteState: Success ${note.id}';
}