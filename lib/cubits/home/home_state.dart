import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/notebook.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([List props = const []]) : super(props);
}

class HomeStateLoading extends HomeState {
  @override
  String toString() => 'HomeState: Loading';
}

class HomeStateError extends HomeState {
  final error;

  HomeStateError(this.error) : super([error]);

  @override
  String toString() => 'HomeState: Error $error';
}

class HomeStateSuccess extends HomeState {
  final List<Notebook> notebooks;

  HomeStateSuccess(this.notebooks) : super([notebooks]);

  @override
  String toString() => 'HomeState: Success ${notebooks.length}';
}