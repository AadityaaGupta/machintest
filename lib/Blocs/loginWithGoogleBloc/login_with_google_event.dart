import 'package:flutter/material.dart';

abstract class LoginWithGoogleEvent {}

class OnLoginButttonPressed extends LoginWithGoogleEvent {
  final String email;
  final String password;
  BuildContext context;

  OnLoginButttonPressed(this.email, this.password,this.context);
}