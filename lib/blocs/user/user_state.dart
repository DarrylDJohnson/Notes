import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UserState extends Equatable {
  UserState([List props = const []]) : super(props);
}

class Initial extends UserState {
  @override
  String toString() => 'User initial';
}

class Loading extends UserState {
  @override
  String toString() => 'Loading';
}

class Unauthenticated extends UserState {
  @override
  String toString() => 'User unauthenticated';
}

class Authenticated extends UserState {
  final User user;

  Authenticated(this.user);

  @override
  String toString() => 'Authenticated user {$user}';
}

class UserError extends UserState {
  final String error;

  UserError(this.error) : super([error]);

  @override
  String toString() => 'Error {SignInState: $error }';
}
