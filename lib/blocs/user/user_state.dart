import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UserState extends Equatable {
  UserState([List props = const []]) : super(props);
}

class UserStateInitial extends UserState {
  @override
  String toString() => 'User initial';
}

class UserStateLoading extends UserState {
  @override
  String toString() => 'Loading';
}

class UserStateUnauthenticated extends UserState {
  @override
  String toString() => 'User unauthenticated';
}

class UserStateAuthenticated extends UserState {
  final User user;

  UserStateAuthenticated(this.user);

  @override
  String toString() => 'Authenticated user {$user}';
}

class UserStateError extends UserState {
  final String error;

  UserStateError(this.error) : super([error]);

  @override
  String toString() => 'Error {SignInState: $error }';
}
