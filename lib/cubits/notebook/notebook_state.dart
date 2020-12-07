import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';

@immutable
abstract class NotebookState extends Equatable {
  NotebookState([List props = const []]) : super(props);
}

class NotebookStateLoading extends NotebookState {
  @override
  String toString() => 'NotebookState: Loading';
}

class NotebookStateError extends NotebookState {
  final error;

  NotebookStateError(this.error) : super([error]);

  @override
  String toString() => 'NotebookState: Error $error';
}

class NotebookStateSuccess extends NotebookState {
  final List<Note> notes;

  NotebookStateSuccess(this.notes) : super([notes]);

  @override
  String toString() => 'NotebookState: Success ${notes.length}';
}