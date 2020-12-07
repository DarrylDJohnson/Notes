import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/notebook.dart';

@immutable
abstract class NavigationState extends Equatable {
  NavigationState([List props = const []]) : super(props);
}

class NavigationStateSplash extends NavigationState {
  @override
  String toString() => 'NavigationState: Splash';
}

class NavigationStateAccount extends NavigationState {
  @override
  String toString() => 'NavigationState: Account';
}

class NavigationStateHome extends NavigationState {
  @override
  String toString() => 'NavigationState: Home';
}

class NavigationStateNotebook extends NavigationState {
  final Notebook notebook;

  NavigationStateNotebook(this.notebook) : super([notebook]);

  @override
  String toString() => 'NavigationState: Notebook';
}

class NavigationStateNote extends NavigationState {
  final Notebook notebook;
  final Note note;

  NavigationStateNote(this.notebook, this.note) : super([notebook, note]);

  @override
  String toString() => 'NavigationState: Note ${note.id} in ${notebook.id}';
}

class NavigationStateCreateNotebook extends NavigationState {
  @override
  String toString() => 'NavigationState: CreateNotebook';
}
